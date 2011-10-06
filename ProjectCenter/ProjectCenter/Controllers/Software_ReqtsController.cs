using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCenter.Controllers
{
    public class Software_ReqtsController : Controller
    {
        //
        // GET: /Software_Reqts/
        [Authorize()]
        public ActionResult List(Models.SoftwareReqtsModel S)
        {
            return View(S);
        }
        [Authorize()]
        public ActionResult DetailedView(Models.SoftwareReqtsModel S,string id)
        {
            Models.DataBaseTableClassesDataContext db = new Models.DataBaseTableClassesDataContext();
            S.SelectedId = id;
            var query = from ws in db.WpsForSrs
                        where ws.Sr_ID == Int32.Parse(S.SelectedId)
                        select ws.WorkPackageDescription;
            foreach (var q in query)
            {
                SelectListItem li = new SelectListItem();
                li.Text = q.Wp_Title;
                li.Value = q.Wp_Id.ToString();
                S.Wp_used.Add(li);
            }
            return View(S);
        }
        [Authorize(Roles = "Manager")]
        public ActionResult UpdateView(Models.SoftwareReqtsModel S,string id)
        {
            S.SelectedId = id;
            int sid = Convert.ToInt32(id);
            int Name = -1;
            for (int i = 0; i < S.Sr.Count; i++)
            {
                if(S.Sr[i].Sr_ID==sid)
                Name = S.Sr[i].ProjectID;
            }
                foreach (SelectListItem li in S.Pids)
            {
                if (li.Value == Name.ToString())
                    li.Selected = true;
            }
            return View(S);
        }
        [Authorize(Roles = "Manager")]
        public ActionResult ManageWorkPackages(Models.SoftwareReqtsModel S, string id)
        {
           Models.DataBaseTableClassesDataContext db=new Models.DataBaseTableClassesDataContext();
            S.SelectedId = id;
            var query = from ws in db.WpsForSrs
                        where ws.Sr_ID == Int32.Parse(S.SelectedId)
                        select ws.WorkPackageDescription;
            foreach (var m in query)
            {
                SelectListItem li = new SelectListItem();
                li.Text = m.Wp_Title;
                li.Value = m.Wp_Id.ToString();
                S.Wp_used.Add(li);   
            }
            
            foreach (Models.WorkPackageDescription wp in db.WorkPackageDescriptions)
            {
                int k;
                SelectListItem li = new SelectListItem();
                li.Text = wp.Wp_Title;
                li.Value = wp.Wp_Id.ToString();
                
                    for ( k = 0; k < S.Wp_used.Count; k++)
                    {
                        if (S.Wp_used[k].Value == li.Value)
                            break;
                    }
                    if (k < S.Wp_used.Count)
                        continue;
                S.Wp_unused.Add(li);
            }

            return View(S);
        
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Create(Models.SoftwareReqtsModel S, Models.Software_Requirement sr)
        {
            sr.Sr_Date = DateTime.Now;
            if (S.Save(sr))
            {
                return RedirectToAction("List");
            }
            else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home" );
            }
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Submit(Models.SoftwareReqtsModel S, Models.Software_Requirement sr)
        {
            int id;
            id=Convert.ToInt32(Session["srid"].ToString());
            
            foreach (Models.Software_Requirement s in S.Sr)
            {
                if (s.Sr_ID == id)
                {
                    s.Sr_Desc = sr.Sr_Desc;
                    s.Sr_IssuesText = sr.Sr_IssuesText;
                    s.Sr_Title = sr.Sr_Title;  
                    s.ProjectID = sr.ProjectID;
                    
                }

            }
            if(S.Update())
            return RedirectToAction("DetailedView/"+id);
    
            else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }
        }
        [HttpPost]
        public ActionResult WpSubmit(Models.SoftwareReqtsModel S, FormCollection coll)
        {
            S.SelectedId = Session["srid"].ToString();
            try
            {

                Models.DataBaseTableClassesDataContext db = new Models.DataBaseTableClassesDataContext();
                var query = from ws in db.WpsForSrs
                            where ws.Sr_ID == Int32.Parse(S.SelectedId)
                            select ws.WorkPackageDescription;
                foreach (var m in query)
                {
                    SelectListItem li = new SelectListItem();
                    li.Text = m.Wp_Title;
                    li.Value = m.Wp_Id.ToString();
                    S.Wp_used.Add(li);
                }
                string[] selected = coll.GetValues("SelectedPackages");
                if (selected != null)
                {
                    foreach (string s in selected)
                    {
                        int i;
                        for (i = 0; i < S.Wp_used.Count; i++)
                        {
                            if (s == S.Wp_used[i].Value)
                                break;
                        }
                        if (i == S.Wp_used.Count)
                        {

                            var que = from srs in db.WpsForSrs
                                        where srs.Wp_Id.ToString() == s && S.SelectedId == srs.Sr_ID.ToString()
                                        select srs;
                            db.WpsForSrs.DeleteAllOnSubmit(que);
                        }
                    }
                    db.SubmitChanges();
                }
                else
                {
                    foreach (SelectListItem s in S.Wp_used)
                    {
                        var que = from srp in db.WpsForSrs
                                    where srp.Wp_Id == Int32.Parse(s.Value) && srp.Sr_ID == Int32.Parse(S.SelectedId)
                                    select srp;
                        db.WpsForSrs.DeleteAllOnSubmit(que);
                    }
                    db.SubmitChanges();
                }
                selected = coll.GetValues("UnselectedPackages");
                if (selected != null)
                {
                    foreach (string s in selected)
                    {
                        Models.WpsForSr ws=new Models.WpsForSr();
                        ws.Sr_ID=Int32.Parse(S.SelectedId);
                        ws.Wp_Id=Int32.Parse(s);
                        db.WpsForSrs.InsertOnSubmit(ws);

                    }
                    db.SubmitChanges();
                }
            }
            catch
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }
            return RedirectToAction("DetailedView/" + S.SelectedId);
        }

        [Authorize(Roles = "Manager")]
        public ActionResult Delete(Models.SoftwareReqtsModel model, int id)
        {
            var q = (from sr in model.Sr
                     where sr.Sr_ID == id
                     select sr).Single<Models.Software_Requirement>();
            if (model.Delete(q))
                return RedirectToAction("List", "Software_Reqts");
            else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }

        }
    }
}

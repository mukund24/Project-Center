using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ProjectCenter.Controllers
{
    public class StatusReportsController : Controller
    {
        //
        // GET: /StatusReports/
        [Authorize()]
        public ActionResult Status(Models.StatusReportModel S)
        {
            return View(S);
        }
        [Authorize()]
        public ActionResult DetailView(Models.StatusReportModel S,string id)
        {
            S.SelectedID = id;
            return View(S);
        }
        [Authorize(Roles = "Manager")]
        public ActionResult UpdateView(Models.StatusReportModel S,string id)
        {
            S.SelectedID = id;
            int sid = Convert.ToInt32(id);
            int Name = -1;
            for (int i = 0; i < S.StR.Count; i++)
            {
                if (S.StR[i].StatusReportID == sid)
                    Name = S.StR[i].Wp_Id;
            }
            foreach (SelectListItem li in S.WpList)
            {
                if (li.Value == Name.ToString())
                    li.Selected = true;
            }
            return View(S);
            
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Create( Models.StatusReportModel S,Models.StatusReport sr)
        {
            if (S.Save(sr))
            {
                return RedirectToAction("Status");
            }
            else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }
        
        }


        [Authorize(Roles = "Manager")]
        public ActionResult Submit(Models.StatusReportModel S, Models.StatusReport sr)
        {
            int id;
            id = Convert.ToInt32(Session["status"].ToString());

            foreach (Models.StatusReport s in S.StR)
            {
                if (s.StatusReportID == id)
                {
                    s.ReportTitle = sr.ReportTitle;
                    s.StatusReportLog = sr.StatusReportLog;
                    
                    s.Wp_Id = sr.Wp_Id;

                }

            }
           if( S.Update())
            return RedirectToAction("DetailView/" + id);
          
               else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }
        }

        [Authorize(Roles = "Manager")]
        public ActionResult Delete(Models.StatusReportModel model, int id)
        {
            var q = (from sr in model.StR
                     where sr.StatusReportID== id
                     select sr).Single<Models.StatusReport>();
            if (model.Delete(q))
                return RedirectToAction("Status", "StatusReports");
            else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }

        }
    }
}

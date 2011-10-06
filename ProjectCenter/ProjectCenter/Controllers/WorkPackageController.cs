using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCenter.Controllers
{
    public class WorkPackageController : Controller
    {
        //
        // GET: /WorkPackage/
        [Authorize()]

        public ActionResult List(Models.WorkPackageModel w)
        {
            return View(w);
        }
        [Authorize()]
        public ActionResult Detail(Models.WorkPackageModel w, string id)
        {
            w.selectedId = id;
            return View(w);
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Edit(Models.WorkPackageModel w, string id)
        {
            w.selectedId = id;
            int wid = Convert.ToInt32(id);
            int pid = -1;
            int crid = -1;

            for (int i = 0; i < w.WorkPackageList.Count; i++)
            {
                if (w.WorkPackageList[i].Wp_Id == wid)
                {
                    pid = w.WorkPackageList[i].ProjectID;
                    crid = w.WorkPackageList[i].CreatedBy;
                }
            
            }
            foreach (SelectListItem li in w.ProjectList)
                if (li.Value == pid.ToString())
                    li.Selected = true;
            foreach (SelectListItem el in w.EmpList)
                if (el.Value == crid.ToString())
                    el.Selected = true;
            return View(w);
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Create(Models.WorkPackageDescription wpd,Models.WorkPackageModel w)
        {
            wpd.Wp_Date = DateTime.Today;
           if( w.Save(wpd))
            return RedirectToAction("List");
           
           else
           {
               Session["ErrorMessage"] = "Failed To Submit Changes";
               return RedirectToAction("ErrorPage", "Home");
           }
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Submit(Models.WorkPackageDescription wpd, Models.WorkPackageModel w)
        {
            int id;
            id = Convert.ToInt32(Session["wpid"].ToString());
            foreach (Models.WorkPackageDescription x in w.WorkPackageList)
            {
                if (x.Wp_Id == id)
                {
                    x.Wp_Title = wpd.Wp_Title;
                    x.Wp_Description = wpd.Wp_Description;
                    x.ProjectID = wpd.ProjectID;
                    x.CreatedBy = wpd.CreatedBy;
                }
            
            }
           if( w.Update())
            return RedirectToAction("Detail/" + id);
           else
           {
               Session["ErrorMessage"] = "Failed To Submit Changes";
               return RedirectToAction("ErrorPage", "Home");
           }
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Delete(Models.WorkPackageModel model, int id)
        {
            var q = (from sr in model.WorkPackageList
                     where sr.Wp_Id == id
                     select sr).Single<Models.WorkPackageDescription>();
            if (model.Delete(q))
                return RedirectToAction("List", "WorkPackage");
            else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }

        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCenter.Controllers
{
    public class ProjectsController : Controller
    {
        //
        // GET: /Projects/
        [Authorize()]
        public ActionResult List(Models.ProjectModel P)
        {
            return View(P);
        }
        [Authorize()]
        public ActionResult DetailView(Models.ProjectModel P,string id)
        {
            P.SelectedId = id;
            return View(P);
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Edit(Models.ProjectModel P, string id)
        {
            P.SelectedId = id;
            int prid = Convert.ToInt32(id);
            int StatusID=-1, mgrId=-1;
            for (int i = 0; i < P.ProjectList.Count; i++)
            {
                if (P.ProjectList[i].ProjectID == prid)
                {
                    StatusID = P.ProjectList[i].ProjectStatusID;
                    mgrId = P.ProjectList[i].ManagerID;
                }
            }
            foreach (SelectListItem li in P.ManagerList)
                if (li.Value == mgrId.ToString())
                    li.Selected = true;
            foreach (SelectListItem Sl in P.StatusList)
                if (Sl.Value == StatusID.ToString())
                    Sl.Selected = true;

            return View(P);
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Create(Models.ProjectModel P,Models.Project Pr)
        {
            Pr.Start_Date = DateTime.Today;
            Pr.ProjectStatusID = 1;
            P.Save(Pr);
            return RedirectToAction("List");
        }
        [Authorize(Roles = "Manager")]
        public ActionResult Submit(Models.ProjectModel P, Models.Project Pr)
        {
            int id;
            id=Convert.ToInt32(Session["prid"].ToString());
            foreach (Models.Project p in P.ProjectList)
            {
                if (p.ProjectID == id)
                {
                    p.End_Date = Pr.End_Date;
                    p.Last_Review_Date = Pr.Last_Review_Date;
                    p.Project_Desc = Pr.Project_Desc;
                    p.ProjectName = Pr.ProjectName;
                    p.ManagerID = Pr.ManagerID;
                    p.ProjectStatusID = Pr.ProjectStatusID;
                }

            }
            if(P.Update())
            return RedirectToAction("DetailView/"+id);
            else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }
        }
    
        //public ActionResult Delete(
        [Authorize(Roles = "Manager")]
        public ActionResult Delete(Models.ProjectModel model, int id)
        {
            var q = (from sr in model.ProjectList
                     where sr.ProjectID == id
                     select sr).Single<Models.Project>();
            if(model.Delete(q))
                return RedirectToAction("List", "Project");
            else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }

        }
    }

}

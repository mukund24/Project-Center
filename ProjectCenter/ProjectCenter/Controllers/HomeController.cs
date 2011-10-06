using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCenter.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            if (Request.IsAuthenticated)
                return RedirectToAction("List", "Projects");
            else
            ViewData["Message"] = "Welcome to Project Center";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        //public ActionResult Grid(Models.GridModel model)
        //{

        //    ViewData["Message"] = "Data from Grid Model XMl";
        //    return View(model);
        //}

        //public ActionResult Edit(string id, Models.GridModel model)
        //{
        //    // An Html.ActionLink invokes this method and passes its id attribute.
        //    // Note that ActionLinks do an Http Get, not a Post, so no model
        //    // data is sent.

        //    // a checked character gets a save button to submit changes

        //    int selected = Int32.Parse(id);
        //    for (int i = 0; i < model.Bugs.Count; ++i)
        //    {
        //        if (i != selected)
        //            model.Bugs[i].Checked = false;
        //        else
        //            model.Bugs[i].Checked = true;
        //    }
        //    return View(model);
        //}
        //public ActionResult Save(Models.BugReport cmodel, Models.GridModel model)
        //{
        //    // We get here when a "Save" submit button is clicked, so an Http Post
        //    // message was used.  Thus, we get model data sent up via the cmodel
        //    // parameter, however we can't get an id number.  That comes only with
        //    // the actionlinks.

        //    // Therefore we used a Session["selected"] value to transfer
        //    // this one datum from the view to this controller method.

        //    int selected = (int)Session["selected"];
        //    model.Bugs[selected].EmpId = cmodel.EmpId;
        //    //model.Bugs[selected].ProjectTeam = cmodel.ProjectTeam;
        //    model.Bugs[selected].Requirement = cmodel.Requirement;
        //    model.Bugs[selected].ProjectName = cmodel.ProjectName;           
        //    model.Bugs[selected].BugDesc = cmodel.BugDesc;
        //    model.Bugs[selected].SeverityLevel = cmodel.SeverityLevel;
        //    model.Bugs[selected].Solution = cmodel.Solution;
        //    model.Bugs[selected].DateAdded = cmodel.DateAdded;
        //    model.Bugs[selected].LastModifiedDate = cmodel.LastModifiedDate;
        //    model.Bugs[selected].ResolvedDate = cmodel.ResolvedDate;
        //    model.Bugs[selected].Checked = false;

        //    model.Save(model, model.getXmlPath());
        //    return RedirectToAction("Grid");
        //}


        ////----< insert new record >--------------------------------

        //public ActionResult Insert(Models.BugReport cmodel, Models.GridModel model)
        //{
        //    // We got here from a submit button on the Insert form, one of two
        //    // in the Show.aspx view.  Therefore, model data was sent to us
        //    // via the cmodel parameter, but we don't get an id.

        //    model.Bugs.Add(cmodel);
        //    model.Save(model, model.getXmlPath());
        //    return RedirectToAction("Grid");
        //}
        ////----< delete record >------------------------------------

        //public ActionResult Delete(string id, Models.GridModel model)
        //{
        //    // We got here from an ActionLink, so no data is posted,
        //    // but we do get the link's id.

        //    int selected = Int32.Parse(id);
        //    model.Bugs.RemoveAt(selected);
        //    model.Save(model, model.getXmlPath());
        //    return RedirectToAction("Grid");
        //}
        
        public ActionResult ErrorPage()
        {
            string message = Session["ErrorMessage"].ToString();
            ViewData["message"] = message;
            return View();
        }
    }
}

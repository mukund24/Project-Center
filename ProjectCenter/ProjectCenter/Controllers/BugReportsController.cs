using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCenter.Controllers
{
    public class BugReportsController : Controller
    {
        //
        // GET: /BugReports/

        [Authorize ()]
        public ActionResult List(Models.GridModel model)
        {

            ViewData["Message"] = "Data from Grid Model XMl";
            return View(model);
        }

        [Authorize()]
        public ActionResult Detail(string id, Models.GridModel model)
        {
            int selected = Int32.Parse(id);
            for (int i = 0; i < model.Bugs.Count; ++i)
            {
                if (i != selected)
                    model.Bugs[i].Checked = false;
                else
                    model.Bugs[i].Checked = true;
            }
            return View(model);
        
        }
        [Authorize(Roles="Manager") ]
        public ActionResult Edit(string id, Models.GridModel model)
        {
            // An Html.ActionLink invokes this method and passes its id attribute.
            // Note that ActionLinks do an Http Get, not a Post, so no model
            // data is sent.

            // a checked character gets a save button to submit changes

            int selected = Int32.Parse(id);
            for (int i = 0; i < model.Bugs.Count; ++i)
            {
                if (i != selected)
                    model.Bugs[i].Checked = false;
                else
                    model.Bugs[i].Checked = true;
            }
            return View(model);
        }
        [Authorize()]
        public ActionResult Save(Models.BugReport cmodel, Models.GridModel model)
        
        {
            // We get here when a "Save" submit button is clicked, so an Http Post
            // message was used.  Thus, we get model data sent up via the cmodel
            // parameter, however we can't get an id number.  That comes only with
            // the actionlinks.

            // Therefore we used a Session["selected"] value to transfer
            // this one datum from the view to this controller method.

            int selected = (int)Session["selected"];
  
            model.Bugs[selected].EmpId = cmodel.EmpId;
            model.Bugs[selected].Title = cmodel.Title;
            model.Bugs[selected].Requirement = cmodel.Requirement;
            model.Bugs[selected].ProjectName = cmodel.ProjectName;
            model.Bugs[selected].BugDesc = cmodel.BugDesc;
            model.Bugs[selected].SeverityLevel = cmodel.SeverityLevel;
            model.Bugs[selected].Solution = cmodel.Solution;
            model.Bugs[selected].DateAdded = cmodel.DateAdded;
            model.Bugs[selected].LastModifiedDate = cmodel.LastModifiedDate;
            model.Bugs[selected].ResolvedDate = cmodel.ResolvedDate;
            model.Bugs[selected].Checked = false;

            if(model.Save(model, model.getXmlPath()))
            return RedirectToAction("Detail/" +selected);
            else
            {
                Session["ErrorMessage"] = "Failed To Submit Changes";
                return RedirectToAction("ErrorPage", "Home");
            }
        }


        //----< insert new record >--------------------------------
        [Authorize(Roles = "Manager")]
        public ActionResult Insert(Models.BugReport cmodel, Models.GridModel model)
        {
            // We got here from a submit button on the Insert form, one of two
            // in the Show.aspx view.  Therefore, model data was sent to us
            // via the cmodel parameter, but we don't get an id.
            int cnt = Int32.Parse(model.count);
            cnt++;
            cmodel.Id = cnt.ToString();
            model.count = cnt.ToString();
            model.Bugs.Add(cmodel);
            cmodel.DateAdded = DateTime.Today.ToShortDateString();
            model.Save(model, model.getXmlPath());
            return RedirectToAction("List");
        }
        //----< delete record >------------------------------------
        [Authorize(Roles = "Manager")]
        public ActionResult Delete(string id, Models.GridModel model)
        {
            // We got here from an ActionLink, so no data is posted,
            // but we do get the link's id.

            int selected = Int32.Parse(id);
            model.Bugs.RemoveAt(selected);
            model.Save(model, model.getXmlPath());
            return RedirectToAction("List");
        }
       
    }
}

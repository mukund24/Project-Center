using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCenter.Models
{
    public class ProjectModel
    {
        DataBaseTableClassesDataContext db;
        public string SelectedId { get; set; }
        public List<SelectListItem> StatusList { get; set; }
        public List<Project> ProjectList { get; set; }
        public List<SelectListItem> ManagerList { get; set; }
        public ProjectModel()
        {
             ProjectList = new List<Project>();
             StatusList = new List<SelectListItem>();
             ManagerList = new List<SelectListItem>();
             db = new DataBaseTableClassesDataContext();
             foreach (Project p in db.Projects)
             {
                 ProjectList.Add(p);
             }
             foreach (ProjectStatus Ps in db.ProjectStatus)
             {
                 StatusList.Add(new SelectListItem { Text = Ps.StatusValue, Value = Ps.ProjectStatusID.ToString() });
             }
             foreach (Employee e in db.Employees)
             { 
             ManagerList.Add(new SelectListItem{Text=e.Fname + " " + e.Lname,Value=e.EmpId.ToString()});
             }
        }
        public bool Save( Models.Project Pr)
        {
            try
            {
                db.Projects.InsertOnSubmit(Pr);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }
        public bool Update()
        {
            try
            {
                db.SubmitChanges();
            }
            catch {
                return false;
            }
            return true;
        }
        public bool Delete(Models.Project P) 
        {
            Models.Project pr;
            try
            {
                pr = (from x in db.Projects where x.ProjectID == P.ProjectID select x).First<Project>();
                db.Projects.DeleteOnSubmit(pr);
                db.SubmitChanges();
            }

            catch (Exception ex)
            {
                return false;
            }
            return true;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCenter.Models
{
    public class WorkPackageModel
    {
        DataBaseTableClassesDataContext db;
        public List<WorkPackageDescription> WorkPackageList { get; set; }
        public string selectedId { get; set; }
        public List<SelectListItem> ProjectList { get; set; }
        public List<SelectListItem> EmpList { get; set; }
        public WorkPackageModel()
        {
            ProjectList = new List<SelectListItem>();
            EmpList = new List<SelectListItem>();
            WorkPackageList = new List<WorkPackageDescription>();
            db = new DataBaseTableClassesDataContext();
            foreach (WorkPackageDescription w in db.WorkPackageDescriptions)
            {
                WorkPackageList.Add(w);
            }
            foreach (Project p in db.Projects)
            {
                ProjectList.Add(new SelectListItem { Text = p.ProjectName, Value = p.ProjectID.ToString() });
            }
            foreach (Employee e in db.Employees)
            {
                EmpList.Add(new SelectListItem { Text = e.Fname + " " + e.Lname, Value = e.EmpId.ToString() });
            }

        }
        public bool Save(Models.WorkPackageDescription w)
        {
            try
            {
                db.WorkPackageDescriptions.InsertOnSubmit(w);
                db.SubmitChanges();
            }
            catch 
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
            catch
            {
                return false;
            }
            return true;
        }

        public bool Delete(Models.WorkPackageDescription w)
        {
            Models.WorkPackageDescription temp;
            try
            {
                temp = (from x in db.WorkPackageDescriptions where x.Wp_Id == w.Wp_Id select x).First<WorkPackageDescription>();
                var query = from srs in db.WpsForSrs
                            where srs.Wp_Id ==w.Wp_Id
                            select srs;
                var query1 = from st in db.StatusReports
                             where st.Wp_Id == w.Wp_Id
                             select st;
                db.StatusReports.DeleteAllOnSubmit(query1);
                db.WpsForSrs.DeleteAllOnSubmit(query);
                db.WorkPackageDescriptions.DeleteOnSubmit(temp);
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
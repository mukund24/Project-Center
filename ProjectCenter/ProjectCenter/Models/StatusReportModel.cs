using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCenter.Models
{
    public class StatusReportModel
    {
        DataBaseTableClassesDataContext db;
        public string SelectedID { get; set; }
        public List<StatusReport> StR { get; set; }
        public List<SelectListItem> WpList { get; set; }

        public StatusReportModel()
        {
            StR = new List<StatusReport>();
            db = new DataBaseTableClassesDataContext();
            WpList = new List<SelectListItem>();
            foreach (StatusReport s in db.StatusReports)
            {
                StR.Add(s);
            }

            foreach (WorkPackageDescription w in db.WorkPackageDescriptions)
            {
                WpList.Add(new SelectListItem { Text = w.Wp_Title, Value = w.Wp_Id.ToString() });
            }
        
        }
        public bool Save(Models.StatusReport s)
        {
            try
            {
                db.StatusReports.InsertOnSubmit(s);
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
            catch
            {
                return false;
            }
            return true;

        }
        public bool Delete(Models.StatusReport SR)
        {
            Models.StatusReport sr;
            try
            {
                sr = (from x in db.StatusReports where x.StatusReportID == SR.StatusReportID select x).First<StatusReport>();
                db.StatusReports.DeleteOnSubmit(sr);
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


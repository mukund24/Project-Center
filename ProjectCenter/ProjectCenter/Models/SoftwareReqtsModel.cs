using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCenter.Models
{
    public class SoftwareReqtsModel
    {
        DataBaseTableClassesDataContext db;
        public string SelectedId { get; set; }
        public List<Software_Requirement> Sr { get; set; }
        public List<SelectListItem> Wp_used { get; set; }
        public List<SelectListItem> Wp_unused { get; set; }
        public List<SelectListItem>  Pids { get; set; }
        public SoftwareReqtsModel()
        {
            Sr = new List<Software_Requirement>();
            db = new DataBaseTableClassesDataContext();
            Pids=new List<SelectListItem>();
            Wp_unused = new List<SelectListItem>();
            Wp_used = new List<SelectListItem>();
            foreach (Software_Requirement sr in db.Software_Requirements)
            {
                Sr.Add(sr);
            }
          
            foreach (Project p in db.Projects)
            {
                Pids.Add(new SelectListItem { Text = p.ProjectName, Value = p.ProjectID.ToString()}); 
            }        
        }
        public bool Save(Models.Software_Requirement sr)
        {
            try
            {
                db.Software_Requirements.InsertOnSubmit(sr);
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
        public bool Delete(Models.Software_Requirement SR)
        {
            Models.Software_Requirement sr;
            try
            {
                sr = (from x in db.Software_Requirements where x.Sr_ID == SR.Sr_ID select x).First<Software_Requirement>();
                
                var query = from srp in db.WpsForSrs
                            where srp.Sr_ID == SR.Sr_ID
                            select srp;
                db.WpsForSrs.DeleteAllOnSubmit(query);
                db.Software_Requirements.DeleteOnSubmit(sr);
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
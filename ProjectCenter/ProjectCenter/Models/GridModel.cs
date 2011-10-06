using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Web.Mvc;
namespace ProjectCenter.Models
{
    public class BugReport
    { 
    public string EmpId {get; set;}
    public string Id { get; set; }
    public string Title {get;   set;}
    public string Requirement {get;   set;}
    public string ProjectName {get;   set;}
    public string BugDesc {get;   set;}
    public string SeverityLevel {get;   set;}
    public string Solution {get;   set;}
    public string DateAdded {get;   set;}
    public string LastModifiedDate {get;   set;}
    public string ResolvedDate {get;   set;}
    public bool Checked { get; set; }
    
    }

    public class GridModel
    {
        public List<BugReport> Bugs;
        public string count { get; set; }
        DataBaseTableClassesDataContext db;
        public List<SelectListItem> EmpList { get; set; }
        public List<SelectListItem> ProjectList { get; set; }
        public List<SelectListItem> ReqList { get; set; }
        private static string xmlFilepath;
        public GridModel()
        {
            Bugs=new List<BugReport>();
            db = new DataBaseTableClassesDataContext();
            ProjectList = new List<SelectListItem>();
            EmpList = new List<SelectListItem>();
            ReqList = new List<SelectListItem>();
            foreach (Project p in db.Projects)
            {
                ProjectList.Add(new SelectListItem { Text = p.ProjectName, Value = p.ProjectName });
            }
            foreach (Employee e in db.Employees)
            {
                EmpList.Add(new SelectListItem { Text = e.Fname + " " + e.Lname, Value = e.Fname + " " + e.Lname });
            }
            foreach (Software_Requirement SR in db.Software_Requirements)
            {
                ReqList.Add(new SelectListItem { Text = SR.Sr_Title, Value = SR.Sr_Title });
            }
            xmlFilepath = HttpContext.Current.Server.MapPath("~\\App_Data\\Lab07.xml");
            Fill(xmlFilepath);
        }
        public bool Fill(string path)
        {
            try
            {
                XDocument doc = XDocument.Load(path);
                var q = from chr in doc.Elements("BUGS").Elements("BUGREPORT") select chr;
                count = (from c in doc.Elements("BUGS").Elements("COUNT") select c.Value).Single<string>();
                foreach (var elem in q)
                {
                    BugReport B = new BugReport();
                    B.Id = elem.Element("ID").Value;
                    B.EmpId=elem.Element("EMPID").Value;
                    B.Title=elem.Element("TITLE").Value;
                    B.Requirement=elem.Element("REQUIREMENT").Value;
                    B.ProjectName=elem.Element("PROJECT_NAME").Value;
                    B.BugDesc=elem.Element("BUG_DESC").Value;
                    B.SeverityLevel=elem.Element("SEVERITY_LEVEL").Value;
                    B.Solution=elem.Element("SOLUTION").Value;
                    B.DateAdded=elem.Element("DATE_ADDED").Value;
                    B.LastModifiedDate=elem.Element("LAST_MODIFIED_DATE").Value;
                    B.ResolvedDate=elem.Element("RESOLVED_DATE").Value;
                    B.Checked=false;
                    Bugs.Add(B);
                }

            }
            catch { return false; }
            return true;
        }
        public bool Save(Models.GridModel model, string path)
        {
            try
            {
                XDocument doc = new XDocument();
                XElement elm = new XElement("BUGS");
                XElement cnt = new XElement("COUNT");
                cnt.Value = count;
                elm.Add(cnt);
                foreach (BugReport c in model.Bugs)
                {
                    
                    XElement BR = new XElement("BUGREPORT");
                    XElement id = new XElement("ID");    
                    XElement E = new XElement("EMPID");
                    XElement PT = new XElement("TITLE");
                    XElement R = new XElement("REQUIREMENT");
                    XElement PN = new XElement("PROJECT_NAME");
                    XElement BD = new XElement("BUG_DESC");
                    XElement SL = new XElement("SEVERITY_LEVEL");
                    XElement S = new XElement("SOLUTION");
                    XElement DA = new XElement("DATE_ADDED");
                    XElement LMD = new XElement("LAST_MODIFIED_DATE");
                    XElement RD = new XElement("RESOLVED_DATE");

                    id.Value = c.Id;
                    R.Value = c.Requirement;
                    E.Value=c.EmpId;
                    PT.Value=c.Title;
                    PN.Value=c.ProjectName;
                    if(c.BugDesc!=null)
                    BD.Value=c.BugDesc;
                    if(c.SeverityLevel!=null)
                    SL.Value=c.SeverityLevel;
                   if(c.Solution!=null)
                    S.Value=c.Solution;
                    if(c.DateAdded!=null)
                    DA.Value=c.DateAdded;
                    if(c.LastModifiedDate!=null)
                    LMD.Value=c.LastModifiedDate;
                    if(c.ResolvedDate!=null)
                    RD.Value=c.ResolvedDate;
                    
                    BR.Add(id);
                    BR.Add(E);
                    BR.Add(PT);
                    BR.Add(R);
                    BR.Add(PN);
                    BR.Add(BD);
                    BR.Add(SL);
                    BR.Add(S);
                    BR.Add(DA);
                    BR.Add(LMD);
                    BR.Add(RD);
 
                    elm.Add(BR);
                }
                doc.Add(elm);
                doc.Save(path);
            }
            catch { return false; }
            return true;
        }

        public string getXmlPath()
        {
            return HttpContext.Current.Server.MapPath("~/App_Data/Lab07.xml");
        }
    }
}




using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.IO;
using System.Web;
using System.Text;

namespace ProjectCenter
{
    [AspNetCompatibilityRequirements(RequirementsMode=AspNetCompatibilityRequirementsMode.Allowed)]
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "UploadDownload" in code, svc and config file together.
    public class ProjectCenter : IProjectCenter
    {
         public Models.StatusReportModel getStatusReports()
        {
            Models.StatusReportModel S = new Models.StatusReportModel();
             return S;
        }

         public bool editStatusReports(Models.StatusReport s)
         {
             //Models.StatusReportModel Sm=new Models.StatusReportModel();
             
             try
             {
                 Models.DataBaseTableClassesDataContext db = new Models.DataBaseTableClassesDataContext();
                 if (s.StatusReportID != null)
                 {
                     Models.StatusReport Snew=null;
                     var query = from Sr in db.StatusReports
                                 where Sr.StatusReportID == s.StatusReportID
                                 select Sr;
                     /*Linq Queries Return An Ienumerable Collection Like a list<>
                      SO the use of a foreach loop eventhough there will be only one 
                      or  0 status report.*/
                     foreach (var q in query)
                     {
                         Snew = q;
                     }
                     if (Snew != null)
                     {
                         Snew.ReportTitle = s.ReportTitle;
                         Snew.StatusReportLog = s.StatusReportLog;
                         db.SubmitChanges();
                     }
                 }
                 return true;
             }
             catch (Exception ex)
             {
                 return false;
             }
         }

         public bool createStatusReports(Models.StatusReport s)
         {
             try
             {
                 Models.DataBaseTableClassesDataContext db = new Models.DataBaseTableClassesDataContext();
                 db.StatusReports.InsertOnSubmit(s);
                 db.SubmitChanges();
                 return true;
             }
             catch (Exception ex)
             {
                 return false;
             }
         }

         public bool deleteStatusReport(Models.StatusReport s)
         {
             try
             {

                 Models.DataBaseTableClassesDataContext db = new Models.DataBaseTableClassesDataContext();
                 if (s.StatusReportID != null)
                 {
                     Models.StatusReport Snew = null;
                     var query = from Sr in db.StatusReports
                                 where Sr.StatusReportID == s.StatusReportID
                                 select Sr;
                     /*Linq Queries Return An Ienumerable Collection Like a list<>
                      SO the use of a foreach loop eventhough there will be only one 
                      or  0 status report.*/
                     foreach (var q in query)
                     {
                         Snew = q;
                     }
                     if (Snew != null)
                     {
                         db.StatusReports.DeleteOnSubmit(Snew);
                         db.SubmitChanges();
                     }
                    
                 }
                 return true;
             }
             catch (Exception ex)
             {
                 return false;
             }
         }
        /*Bug Reports*/
         public Models.GridModel getbugReports()
         {
             Models.GridModel br = new Models.GridModel();
             return br;
         }

         public bool editbugReports(Models.GridModel g)
         {
             if (g.Save(g, g.getXmlPath()))
                 return true;
             else
                 return false;
         
         }
         public bool createbugReports(Models.GridModel g)
         {
             if (g.Save(g, g.getXmlPath()))
                 return true;
             else
                 return false;
         }
         public bool deletebugReports(Models.GridModel g)
         {

             if (g.Save(g, g.getXmlPath()))
                 return true;
             else
                 return false;
         }

        

    }

   
   

}

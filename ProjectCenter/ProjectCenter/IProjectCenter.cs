using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.IO;
using System.Text;

namespace ProjectCenter
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IUploadDownload" in both code and config file together.
    [ServiceContract]
    public interface IProjectCenter
    {
        [OperationContract]
         Models.StatusReportModel getStatusReports();
        [OperationContract]
        bool editStatusReports(Models.StatusReport s);
        [OperationContract]
        bool createStatusReports(Models.StatusReport s);
        [OperationContract]
        bool deleteStatusReport(Models.StatusReport s);
        
        /*Bug Reports*/
        [OperationContract]
        Models.GridModel getbugReports();
        [OperationContract]
        bool editbugReports(Models.GridModel g);
        [OperationContract]
        bool createbugReports(Models.GridModel g);
        [OperationContract]
        bool deletebugReports(Models.GridModel g);
    }
}

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.StatusReportModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UpdateView
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
<script type="text/javascript" language="javascript">
    function validate() {
        var val = document.getElementById("ReportTitle").value;
        var result = true;
        var summary = "";

        /*System  Specific return value varies..*/
        if (val == null || val == "") {
            result = false;
            summary += "ENTER A REPORT TITLE NAME <br/>";

        }
        val = document.getElementById("Wp_Id").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "CHOOSE A WORK PACKAGE FOR THE STATUS REPORT <br/>";
        }
        if (result == false)
            document.getElementById("error").innerHTML = summary;
        return result;
    }
    
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

      <Headings>Edit Selected Status Report</Headings>
    <br />
    <br />
    <p id="error"></p>
    <table id="table1" cellspacing="2px" cellpadding="2px" border="2">
    <%using (Html.BeginForm("Submit", "StatusReports"))
      { %>
        <% for (int i = 0; i < Model.StR.Count; i++)
           {
               if (Model.StR[i].StatusReportID.ToString() == Model.SelectedID)
               {
                   Session["status"] = Model.SelectedID;     
               %>
               <tr><th>Status Report Number</th><td><%=Model.StR[i].StatusReportID %></td></tr>
               <tr><th>Report Title</th><td><%=Html.TextBox("ReportTitle",Model.StR[i].ReportTitle) %></td></tr>
               <tr><th>Status Report Log</th><td><%=Html.TextArea("StatusReportLog",Model.StR[i].StatusReportLog,5,50,null)%></td></tr>
               <tr><th>Work Package </th><td><%=Html.DropDownList("Wp_Id",Model.WpList,"Select Work Package") %></td></tr>
      <%}

           }
           %>
      </table>
<br />
<input type="submit" value="Submit" onclick="javascript:return validate()" />
    <%} %>
</asp:Content>

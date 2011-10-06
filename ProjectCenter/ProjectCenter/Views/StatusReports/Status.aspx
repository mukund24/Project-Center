<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.StatusReportModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Status
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
            summary += "ENTER A REPORT TITLE NAME <br/>" ;
            
        }
        val = document.getElementById("Wp_Id").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "CHOOSE A WORK PACKAGE FOR THE STATUS REPORT <br/>";
        }
        if (result == false)
            document.getElementById("error").innerHTML=summary;
        return result;
    }
    
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<Headings>Fill Details To Create A New Status Report</Headings>
<br /><br />
<p id="error"></p>
<%using (Html.BeginForm("Create","StatusReports")) 
        {%>
        <%=Html.TextBox("ReportTitle") %>
        <%=Html.DropDownList("Wp_Id",Model.WpList,"Select Workpackage") %>
        
        <input type="submit" value="Create" onclick="javascript:return validate()"/>

        <%} %>
        <br /><br />
   <table id="table1" cellpadding="1" cellspacing="1" border="2">
     <Headings>List Of Created Status Reports</Headings>
 <br /><br />
        <tr> 
        <th>Status Report Number</th>
        <th>Report Title</th>
        
        </tr>
         
        <%for (int i = 0;i<Model.StR.Count; i++)
          {
          %>
          <tr>
        <td><%= Html.ActionLink(Model.StR[i].StatusReportID.ToString(), "DetailView/" + Model.StR[i].StatusReportID, "StatusReports")%></td>
        <td><%:Html.ActionLink(Model.StR[i].ReportTitle, "DetailView/" + Model.StR[i].StatusReportID, "StatusReports")%>	</td>
        
        </tr>
    <%} %>
      </table>
    <br />
    

</asp:Content>

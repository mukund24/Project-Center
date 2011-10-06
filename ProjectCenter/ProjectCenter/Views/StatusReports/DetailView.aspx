<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.StatusReportModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetailView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <Headings>Details Of The Selected Status Report</Headings>
    <br /><br />
    <table id="table1" cellpadding="2px" cellspacing="2px"  border="2">
    <%for (int i = 0; i < Model.StR.Count; i++)
      {
          if (Model.StR[i].StatusReportID.ToString() == Model.SelectedID)
          {
          %>

    <tr> <th>Status Report Number</th><td><%=Model.StR[i].StatusReportID %></td></tr>
<tr></tr>
    <tr> <th>Project The Status Report Belongs</th><td><%=Model.StR[i].ReportTitle%></td></tr>
    <tr></tr>
    <tr><th>Status Report Log Details</th><td><%=Model.StR[i].StatusReportLog %></td></tr>
    <tr><th>Work Package</th><td><%=Model.StR[i].WorkPackageDescription.Wp_Title %></td></tr>
    
    <%if (Page.User.IsInRole("Manager"))
      {%>
    <tr><td><%=Html.ActionLink("EDIT", "UpdateView/" + Model.SelectedID, "StatusReports")%></td>
    <td><%=Html.ActionLink("DELETE", "Delete/" + Model.SelectedID, "StatusReports")%></td></tr>   
       <%} %>
               <%}
      } %>
      <tr><td colspan="2"><%=Html.ActionLink("BACK TO LIST VIEW","Status/"+Model.SelectedID,"StatusReports") %></td></tr>
    </table>
    

</asp:Content>

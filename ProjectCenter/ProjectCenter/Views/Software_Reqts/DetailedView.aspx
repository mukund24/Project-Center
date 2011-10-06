<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.SoftwareReqtsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetailedView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
   <table id="table1" cellpadding="2px" cellspacing="2px" border="2">
   <tr></tr> 
   <Headings>Details Of Selected Software Requirement</Headings>
   <br /><br />
   
   <%for (int i = 0; i < Model.Sr.Count; i++)
     {
         if (Model.Sr[i].Sr_ID.ToString() == Model.SelectedId)
         {
        %>
        <tr><th>Software Requirement ID</th><td><%=Model.Sr[i].Sr_ID %></td></tr>
        <tr>
        <tr><th>Software Requirement Title</th> <td><%=Model.Sr[i].Sr_Title %></td></tr>
        <tr></tr>
        <tr><th>Software Requirement Description</th><td><%=Model.Sr[i].Sr_Desc %></td></tr>
        <tr></tr>
        <tr><th>Software Requirement Date</th><td><%=Model.Sr[i].Sr_Date.ToShortDateString()%></td></tr>
        <tr></tr>
        <tr><th>Software Requirement Issues Text</th><td><%=Model.Sr[i].Sr_IssuesText %></td></tr>
        <tr></tr>
        <tr><th>Project To Which Software Requirement Belongs</th><td><%=Model.Sr[i].Project.ProjectName %></td></tr>
        <tr><th colspan="2">Work Packages Included</th></tr>
        <% for (int j = 0; j < Model.Wp_used.Count; j++)
           { %>
            <tr><td colspan="2"><%=Model.Wp_used[j].Text %></td></tr>

           <%} %>
        
           <%if (Page.User.IsInRole("Manager"))
             { %>      
        
        <tr><td><%=Html.ActionLink("EDIT", "UpdateView/" + Model.SelectedId, "Software_Reqts")%></td>
        <td><%=Html.ActionLink("DELETE", "Delete/" + Model.SelectedId, "Software_Reqts")%></td>
        </tr>
        <%} %>
        <%}%>
   
     <%} %>
   <tr><td colspan="2"><%=Html.ActionLink("BACK TO LIST VIEW","List/"+Model.SelectedId,"Software_Reqts") %></td></tr>
   </table> 
   
</asp:Content>

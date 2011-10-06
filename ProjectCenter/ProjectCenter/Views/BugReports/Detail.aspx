<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.GridModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <h2><%:ViewData["Message"] %></h2>

    <p/>
    <% using (Html.BeginForm("List", "BugReports"))
       { %>
    <div class="content">
      <table id="table2" border="1" cellpadding="2" cellspacing="2">
        <Headings>Details Of Selected Bug Report </Headings>
      <br /><br />
      <%
        string debug = "";
        //foreach (GridCharacter c in Model.Characters)
        for (int i = 0; i < Model.Bugs.Count; ++i)
        {
            if (Model.Bugs[i].Checked)
            {
          %>
            <tr><th>BUG REPORT ID</th><td><%=Model.Bugs[i].Id %></td></tr>
               <tr><th>Report Made By</th> <td><%= Model.Bugs[i].EmpId%></td></tr>
              <tr><th>Bug Report Title</th><td><%= Model.Bugs[i].Title%></td></tr>
             <tr><th>Requirement</th><td><%= Model.Bugs[i].Requirement%></td></tr>
             <tr><th>Project Name</th><td><%=  Model.Bugs[i].ProjectName%></td></tr>
             <tr><th>Severity Level</th><td><%= Model.Bugs[i].SeverityLevel%></td></tr>
             <tr><th>Date Bug Report Was Added</th><td><%=Model.Bugs[i].DateAdded%></td></tr>
             <tr><th>Last Date Of Modification</th><td><%=Model.Bugs[i].LastModifiedDate%></td></tr>
             <tr><th>Resolved Date</th><td><%= Model.Bugs[i].ResolvedDate%></td></tr>
           <tr><th>Bug Description</th><td><%= Model.Bugs[i].BugDesc%></td></tr>
           
           <tr><th>Solution</th><td><%= Model.Bugs[i].Solution%></td></tr>
          
           
           <%if(Page.User.IsInRole("Manager"))
             { %>
             <tr>
            <td><%= Html.ActionLink("EDIT", "Edit", new { id = i })%> </td>
            <td><%= Html.ActionLink("DELETE", "Delete", new { id = i })%></td>
            </tr>
          <%} %>
        <% }
        }%>
      </table>
    </div>
    <% } %>
    <p/>
    <p>
        </p>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.GridModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Grid
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <h2><%:ViewData["Message"] %></h2>

    <p/>
    <% using (Html.BeginForm("Grid", "Home"))
       { %>
    <div class="content">
      <table id="table2" border="1" cellpadding="2" cellspacing="2">
        <tr>
          <th colspan="12">Bug Reports</th>
        </tr>
        <tr>
          <th>EMPID</th><th>Bug Report Title</th><th>REQUIREMENT</th><th>PROJECT_NAME</th><th>BUG_DESC</th>
          <th>SEVERITY_LEVEL</th><th>SOLUTION</th><th>DATE_ADDED</th><th>LAST_MODIFIED_DATE</th><th>RESOLVED_DATE</th><th>EDIT</th><th>DELETE</th>
        </tr>
      <%
        string debug = "";
        //foreach (GridCharacter c in Model.Characters)
        for(int i=0; i<Model.Bugs.Count; ++i)
        { 
          %>
          <tr>
            <td><%= Model.Bugs[i].EmpId%></td>
           
            <td><%= Model.Bugs[i].Requirement%></td>
            <td><%= Model.Bugs[i].ProjectName%></td>
            <td><%= Model.Bugs[i].BugDesc%></td>
            <td><%= Model.Bugs[i].SeverityLevel%></td>
            <td><%= Model.Bugs[i].Solution%></td>
            <td><%= Model.Bugs[i].DateAdded%></td>
            <td><%= Model.Bugs[i].LastModifiedDate%></td>
            <td><%= Model.Bugs[i].ResolvedDate%></td>
            <td><%= Html.ActionLink("Edit", "Edit", new { id = i })%></td>
            <td><%= Html.ActionLink("Delete", "Delete", new { id = i })%></td>
          </tr>
        <% } %>
      </table>
    </div>
    <% } %>
    <p/>
    <p>
    <%using (Html.BeginForm("Insert", "Home"))
      { %>
    <table id="table1"border="1" cellpadding="2" cellspacing="2">
    <tr>
             <td><%= Html.TextBox("EMPID")%></td>
             
            <td><%= Html.TextBox("REQUIREMENT")%></td>

            <td><%= Html.TextBox("PROJECTNAME")%></td>
            <td><%= Html.TextBox("BUGDESC")%></td>
            <td><%= Html.TextBox("SEVERITYLEVEL")%></td>
            <td><%= Html.TextBox("SOLUTION")%></td>
            <td><%= Html.TextBox("DATEADDED")%></td>
            <td><%= Html.TextBox("LASTMODIFIEDDATE")%></td>
            <td><%= Html.TextBox("RESOLVEDDATE")%></td>
            <td><input type="submit" value="Insert" /></td>
            </tr>
    </table>
    <% }%>
    </p>

</asp:Content>

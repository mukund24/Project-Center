<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.GridModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:ViewData["Message"] %></h2>

    <p/>
    <% using (Html.BeginForm("Save", "BugReports"))
       { %>
    <div class="content">
      <table id="table1" border="1" cellpadding="2" cellspacing="2">
        <tr>
          <th colspan="12">Bug Reports</th>
        </tr>
        <tr>
          <th>EMPID</th><th>REQUIREMENT</th><th>PROJECT_NAME</th><th>BUG_DESC</th>
          <th>SEVERITY_LEVEL</th><th>SOLUTION</th><th>DATE_ADDED</th><th>LAST_MODIFIED_DATE</th><th>RESOLVED_DATE</th><th>EDIT</th><th>DELETE</th>
        </tr>
      <%
        string debug = "";
        //foreach (GridCharacter c in Model.Characters)
        for(int i=0; i<Model.Bugs.Count; ++i)
        {
            if (Model.Bugs[i].Checked == false)
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
        <% }
            else
            {
                Session["selected"] = i;          
            %>
            <tr>
             <td><%= Html.TextBox("EMPID", Model.Bugs[i].EmpId)%></td>
            <td><%= Html.TextBox("REQUIREMENT", Model.Bugs[i].Requirement)%></td>
            <td><%= Html.TextBox("PROJECTNAME", Model.Bugs[i].ProjectName)%></td>
            <td><%= Html.TextBox("BUGDESC", Model.Bugs[i].BugDesc)%></td>
            <td><%= Html.TextBox("SEVERITYLEVEL", Model.Bugs[i].SeverityLevel)%></td>
            <td><%= Html.TextBox("SOLUTION", Model.Bugs[i].Solution)%></td>
            <td><%= Html.TextBox("DATEADDED", Model.Bugs[i].DateAdded)%></td>
            <td><%= Html.TextBox("LASTMODIFIEDDATE", Model.Bugs[i].LastModifiedDate)%></td>
            <td><%= Html.TextBox("RESOLVEDDATE", Model.Bugs[i].ResolvedDate)%></td>
            <td><input type="submit" value="save" /></td>
            </tr>

        <%  
           }
      } %>
      </table>
    </div>
    <% } %>
    <p/>

</asp:Content>

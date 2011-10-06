<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.GridModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
<script type="text/javascript" language="javascript">
    function validate() {
        var val = document.getElementById("PROJECTNAME").value;
        var result = true;
        var summary = "";

        /*System  Specific return value varies..*/
        if (val == null || val == "") {
            result = false;
            summary += "ENTER A PROJECT NAME <br/>";

        }
        val = document.getElementById("TITLE").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "Enter the Name Field For the New Bug Report <br/>";
        }
        val = document.getElementById("EMPID").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "Select Name Field <br/>";
        }
        val = document.getElementById("REQUIREMENT").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "Select Requirement Field <br/>";
        }
        if (result == false)
            document.getElementById("error").innerHTML = summary;
        return result;
    }

</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <h2><%:ViewData["Message"] %></h2>

    <p/>
    <% using (Html.BeginForm("Save", "BugReports"))
       { %>
    <div class="content">
      <table id="table1" border="1" cellpadding="2" cellspacing="2">
       <Headings>Update Details Of Selected Bug Report</Headings>
       <br /><br />
        <p id="error"></p>
      <%
        string debug = "";
        //foreach (GridCharacter c in Model.Characters)
        for(int i=0; i<Model.Bugs.Count; ++i)
        {
            
            if (Model.Bugs[i].Checked == true)
            {
          %>
        <%Session["selected"] = i;%>
              <tr><th>Report Made By</th> <td><%= Html.TextBox("EMPID", Model.Bugs[i].EmpId)%></td></tr>
              <tr></tr>
              <tr><th>Bug Report Title</th><td><%= Html.TextBox("TITLE", Model.Bugs[i].Title)%></td></tr>
              <tr></tr>
             <tr><th>Requirement</th><td><%= Html.TextBox("REQUIREMENT", Model.Bugs[i].Requirement)%></td></tr>
             <tr></tr>
             <tr><th>Project Name</th><td><%= Html.TextBox("PROJECTNAME", Model.Bugs[i].ProjectName)%></td></tr>
             <tr></tr>
             <tr><th>Severity Level</th><td><%= Html.TextBox("SEVERITYLEVEL", Model.Bugs[i].SeverityLevel)%></td></tr>
             <tr></tr>
             <tr><th>Date Bug Report Was Added</th><td><%= Html.TextBox("DATEADDED", Model.Bugs[i].DateAdded)%></td></tr>
             <tr></tr>
             <tr><th>Last Date Of Modification</th><td><%= Html.DatePicker("LASTMODIFIEDDATE", "/Content/images/calendar.gif", Model.Bugs[i].LastModifiedDate)%></td></tr>
             <tr></tr>
             <tr><th>Resolved Date</th><td><%= Html.DatePicker("RESOLVEDDATE","/Content/images/calendar.gif", Model.Bugs[i].ResolvedDate)%></td></tr>
             <tr></tr>
            <tr><th>Bug Description</th><td><%= Html.TextArea("BUGDESC", Model.Bugs[i].BugDesc,5,50,null)%></td></tr>
           <tr></tr>
           <tr><th>Solution</th><td><%= Html.TextArea("SOLUTION", Model.Bugs[i].Solution,5,50,null)%></td></tr>
             <tr></tr>
             <tr><td><input type="submit" value="save" onclick="javascript:return validate()"/></td></tr>
            
             <tr></tr>

        <%  
           }
      } %>
      </table>
    </div>
    <% } %>
    <p/>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.GridModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
<script type="text/javascript" language="javascript">
    function validate() {
        var val = document.getElementById("ProjectName").value;
        var result = true;
        var summary = "";

        /*System  Specific return value varies..*/
        if (val== null || val == "") {
            result = false;
            summary += "ENTER A PROJECT NAME <br/>";

        }
        val = document.getElementById("TITLE").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "Enter the Name Field For the New Bug Report <br/>";
        }
        val = document.getElementById("EmpId").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "Select Name Field <br/>";
        }
        val = document.getElementById("Requirement").value;
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
   <Headings>Fill Details To Create A New Bug Report</Headings>
   <br /><br />
   <p id="error"></p>
      <%using (Html.BeginForm("Insert", "BugReports"))
      { %>
      
    <table id="table1"border="1" cellpadding="2" cellspacing="2">
   
    <tr></tr>
    <tr>
    <th>Bug Report By</th><td><%=Html.DropDownList("EmpId",Model.EmpList,"Select Name")%></td>
     </tr>        
      <tr></tr>
      <tr>    
           <th>Bug Report Title</th>  <td><%= Html.TextBox("TITLE")%></td>
      </tr>      
      <tr>
      </tr>
      <tr>
      <th>REQUIREMENT NAME</th><td><%= Html.DropDownList("Requirement",Model.ReqList,"Select Requirement")%></td>
      </tr>
      <tr>
      </tr>
      
      <tr>
      <th>NAME OF THE PROJECT</th><td><%= Html.DropDownList("ProjectName",Model.ProjectList,"Select Project")%></td>
      </tr>      
      <tr>
      </tr>
   
            <tr>
            <td><input type="submit" value="Insert" onclick="javascript:return validate()"/></td>
            </tr>
    </table>
    <% }%>
    <br /><br />

       <table id="table2" border="1" cellpadding="2" cellspacing="2">
        <Headings> List Of Created Bug Reports</Headings>
        <br /><br />
        <tr>
          <th>BUG REPORT ID</th><th>EMPID</th><th>Bug Report Title</th><th>REQUIREMENT</th><th>PROJECT_NAME</th>
        </tr>
      <%
        string debug = "";
        //foreach (GridCharacter c in Model.Characters)
        for(int i=0; i<Model.Bugs.Count; ++i)
        { 
          %>
          <tr>
            <td><%=Model.Bugs[i].Id %></td>
            <td><%= Model.Bugs[i].EmpId%></td>
            <td><%= Html.ActionLink(Model.Bugs[i].Title, "Detail/" +i, "BugReports")%></td>
            <td><%= Model.Bugs[i].Requirement%></td>
            <td><%= Model.Bugs[i].ProjectName%></td>
          </tr>
           <% } %>
      </table>
      <br />
      <br />




</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.WorkPackageModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
<script type="text/javascript" language="javascript">
    function validate() {
        var val = document.getElementById("Wp_Title").value;
        var result = true;
        var summary = "";

        /*System  Specific return value varies..*/
        if (val== null || val == "") {
            result = false;
            summary += "ENTER A WORK PACKAGE NAME <br/>";

        }
        val = document.getElementById("ProjectID").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "SELECT THE PROJECT FOR THE REQUIREMENT <br/>";
        }
        val = document.getElementById("CreatedBy").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "ENTER THE NAME OF THE WHO CREATED THE WORK PACKAGE  <br/>";
        }
        if (result == false)
            document.getElementById("error").innerHTML = summary;
        return result;
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <%using (Html.BeginForm("Create", "WorkPackage"))
      { %>
      <Headings>Fill Details To Add A New WorkPackage</Headings>
      <br /><br />
      <p id="error"></p>
    <table id="table1"border="1" cellpadding="2" cellspacing="2">       
      <tr></tr>
      <tr>    
           <th>Work Package Title</th>  <td><%= Html.TextBox("Wp_Title")%></td>
      </tr>     
      <tr>
      </tr>
      <tr>
    <th>Project </th><td><%=Html.DropDownList("ProjectID", Model.ProjectList, "Select Project Name")%></td>   
       </tr>
       <tr>
       </tr>
       <tr>
       <th>Created By</th><td><%=Html.DropDownList("CreatedBy",Model.EmpList,"Select Employee Name") %></td>
       </tr>
            <tr>
            <td><input type="submit" value="Create" onclick="javascript:return validate()"/></td>
            </tr>
    </table>
    <br /><br />
    <% }%>
    <table id="table2" border="1" cellpadding="2" cellspacing="2">
       <Headings>List Of Inserted Work Packages</Headings>
        <br /><br />
        <tr>
          <th>Work Package ID</th><th>Work Package Title</th>
        </tr>
      <%
        string debug = "";
        //foreach (GridCharacter c in Model.Characters)
        for(int i=0; i<Model.WorkPackageList.Count; ++i)
        { 
          %>
          <tr>
            <td><%=Html.ActionLink(Model.WorkPackageList[i].Wp_Id.ToString(),"Detail/"+ Model.WorkPackageList[i].Wp_Id,"WorkPackage") %></td>
            <td><%= Html.ActionLink(Model.WorkPackageList[i].Wp_Title, "Detail/"+ Model.WorkPackageList[i].Wp_Id.ToString(), "WorkPackage")%></td>
          </tr>
           <% } %>
      </table>
      <br />
      <br />


    


</asp:Content>

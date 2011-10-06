<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.WorkPackageModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
<script type="text/javascript" language="javascript">
    function validate() {
        var val = document.getElementById("Wp_Title").value;
        var result = true;
        var summary = "";
//        reWhiteSpace = new RegExp(/^\s+$/);

        /*System  Specific return value varies..*/
        if (val == null || val == "") {
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
//        if(val== " "){
//            result = false;
//            summary += "NO WHITE SPACES ALLOWED FOR TITLE<br/>";
//        }
        if (result == false)
            document.getElementById("error").innerHTML = summary;
        return result;
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table id="table1" cellspacing="2px" cellpadding="2px" border="2">
    <Headings>Edit Details Of Selected Work Package</Headings>
    <br /><br />
    <p id="error"></p>
      <%using (Html.BeginForm("Submit","WorkPackage"))
       {%>
    <%for (int i = 0; i < Model.WorkPackageList.Count; i++)
      {
          if (Model.WorkPackageList[i].Wp_Id.ToString() == Model.selectedId)
          {
              Session["wpid"] = Model.selectedId;
        %>
       <tr></tr>
       <tr><th>ID</th><td><%=Model.WorkPackageList[i].Wp_Id%></td></tr>
       <tr><th>Issued On </th><td><%=Model.WorkPackageList[i].Wp_Date.ToShortDateString()%></td></tr>
       <tr><th>WOrk Package Title</th><td><%=Html.TextBox("Wp_Title",Model.WorkPackageList[i].Wp_Title)%></td></tr>
       <tr><th>Description</th><td><%=Html.TextArea("Wp_Description",Model.WorkPackageList[i].Wp_Description,5,50,null) %></td></tr>
        <tr> <th>Project</th><td><%=Html.DropDownList("ProjectID", Model.ProjectList, "Select Project Name") %></td></tr>
       <tr> <th>Created By</th><td><%=Html.DropDownList("CreatedBy",Model.EmpList,"Select Employee Name") %></td></tr>
   <tr>    </tr>
        <%}
      } %>
    </table>

<input type="submit" value="Submit" onclick="javascript:return validate()"/>
<%} %>

</asp:Content>


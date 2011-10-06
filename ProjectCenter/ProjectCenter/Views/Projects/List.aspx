<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.ProjectModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
<script type="text/javascript" language="javascript">
//    function isempty(x) {
//        if ((x.value.length == 0) ||
//   (x.value == null)) {
//            return true;
//        }
//        else {
//            return false; 
//      }
//    
//    }

    function validate() {
        var val = document.getElementById("ProjectName").value;
        var result = true;
        var summary = "";

        /*System  Specific return value varies..*/
        if (val == null || val == "") {
            result = false;
            summary += "ENTER A PROJECT NAME <br/>" ;
            
        }
        val = document.getElementById("ManagerID").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "CHOOSE A MANAGER FOR THE PROJECT <br/>";
        }
        if (result == false)
            document.getElementById("error").innerHTML=summary;
        return result;
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <Headings>Fill Details To Create A New Project</Headings>
    <br /><br />
    <p id="error"></p>
    <%using (Html.BeginForm("Create","Projects") )
      {%>
    <%=Html.TextBox("ProjectName") %>
    <%=Html.DropDownList("ManagerID",Model.ManagerList,"Select The Manager") %>
    <input type="submit" value="Create"  onclick="javascript:return validate()"/>
    <%} %>
    <br /><br />
    <table id="table1" cellpadding="1" cellspacing="1" border="2">
    <Headings>List Of Created Projects</Headings>
    <br /><br />
   <tr> <th>ProjectID</th>
    <th>ProjectName</th></tr>
    <%for (int i = 0; i < Model.ProjectList.Count; i++)
      {
          %> 
<tr>
<td style="width: 297px"><%=Html.ActionLink(Model.ProjectList[i].ProjectID.ToString(), "DetailView/" + Model.ProjectList[i].ProjectID, "Projects")%></td>
<td><%=Html.ActionLink(Model.ProjectList[i].ProjectName,"DetailView/"+Model.ProjectList[i].ProjectID,"Projects")%></td>
</tr>
   <% }%>
    </table>
   
</asp:Content>

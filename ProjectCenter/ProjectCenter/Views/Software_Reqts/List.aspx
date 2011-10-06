<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.SoftwareReqtsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
<script type="text/javascript" language="javascript">
    function validate() {
        var val = document.getElementById("Sr_Title").value;
        var result = true;
        var summary = "";

        /*System  Specific return value varies..*/
        if (val == null || val == "") {
            result = false;
            summary += "ENTER A SOFTWARE REQUIREMENT NAME <br/>";

        }
        val = document.getElementById("ProjectID").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "SELECT THE PROJECT FOR THE REQUIREMENT <br/>";
        }
        if (result == false)
            document.getElementById("error").innerHTML = summary;
        return result;
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <Headings>Fill Details To Create A New Software Requirement</Headings>
    <br /><br />
    <p id="error"></p>
    <%  using(Html.BeginForm("Create","Software_Reqts"))
        {%>
 <%=Html.TextBox("Sr_Title") %>
 <%=Html.DropDownList("ProjectID",Model.Pids,"Select Project") %>
  
    <input type="submit" value="Create" onclick="javascript:return validate()"/>
    <%} %>
    <br /><br />

    <table id="table1" cellpadding="1" cellspacing="1" border="2">
    <Headings>List Of Created Software Requirements</Headings>
    <br /><br />
        <tr> 
        <th>Requirement Number</th>
        <th>Requirement Title</th>
        </tr>
        <%for (int i = 0; i < Model.Sr.Count; i++)
          {
        %>
        <tr>
        <td><%=Html.ActionLink(Model.Sr[i].Sr_ID.ToString(),"DetailedView/"+Model.Sr[i].Sr_ID,"Software_Reqts") %></td>
        <td><%=Html.ActionLink(Model.Sr[i].Sr_Title,"DetailedView/"+Model.Sr[i].Sr_ID,"Software_Reqts") %></td>
       
        </tr>
        <%} %>
        
    </table>
    <br />
    

</asp:Content>

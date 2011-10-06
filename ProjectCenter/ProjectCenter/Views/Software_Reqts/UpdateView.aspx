<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.SoftwareReqtsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UpdateView
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

    <Headings>Update Details Of Selected Software Requirement</Headings>
    <br /><br />
    <p id="error"></p>
    <table id="table1" cellpadding="2px" cellspacing="2px" border="2">
    <br />
      <%using (Html.BeginForm("Submit","Software_Reqts"))
       {%>
    <%for (int i = 0; i < Model.Sr.Count; i++)
      {
          if (Model.Sr[i].Sr_ID.ToString() == Model.SelectedId)
          {
              Session["srid"] = Model.SelectedId;
        %>
       <tr></tr>
     <tr><th>ID</th><td><%=Model.Sr[i].Sr_ID%></td></tr>  
     <tr></tr>
    <tr> <th>Requirement Title</th><td><%=Html.TextBox("Sr_Title",Model.Sr[i].Sr_Title)%></td></tr>
     <tr></tr>
      <tr><th>Issued On </th><td><%=Model.Sr[i].Sr_Date.ToShortDateString()%></td>  </tr>
      <tr></tr>
      <tr><th>Parent Project</th><td><%=Html.DropDownList("ProjectID",Model.Pids,"Select Project Name")%></td></tr>
      <tr><th>Description</th> <td><%=Html.TextArea("Sr_Desc",Model.Sr[i].Sr_Desc,10,100,null) %></td></tr>
      <tr></tr>
      <tr><th>Issues And Concerns</th><td><%=Html.TextArea("Sr_IssuesText",Model.Sr[i].Sr_IssuesText,10,100,null) %></td></tr>
      <tr></tr>
      <tr><th colspan="2">Work Packages Included</th></tr>
        <% for (int j = 0; j < Model.Wp_used.Count; j++)
           { %>
            <tr><td colspan="2"><%=Model.Wp_used[j].Text %></td></tr>

           <%} %>
        <tr><th>Manage Work Packages</th><td><%=Html.ActionLink("MANAGE PACKAGES","ManageWorkPackages/"+Model.SelectedId,"Software_Reqts") %></td></tr>
     <tr></tr> 
       
        <%}
      } %>
    </table>

<input type="submit" value="Submit" onclick="javascript:return validate()"/>
<%} %>
</asp:Content>

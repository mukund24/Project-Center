<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.WorkPackageModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br /><br />

     <table id="table2" border="1" cellpadding="2" cellspacing="2">
        <Headings>Details Of Selected Wokr Package</Headings>
        <br /><br />
      <%
        string debug = "";
        //foreach (GridCharacter c in Model.Characters)
        for (int i = 0; i < Model.WorkPackageList.Count; ++i)
        {
            if (Model.WorkPackageList[i].Wp_Id.ToString() == Model.selectedId)
            {
                
          %>
          <tr>
           <th>Work Package ID</th> <td><%=Model.WorkPackageList[i].Wp_Id%></td></tr>
           <tr></tr>
           <tr><th>Work Package Title</th> <td><%=Model.WorkPackageList[i].Wp_Title%></td>
          </tr>
          <tr></tr>
          <tr><th>Date Added</th><td><%=Model.WorkPackageList[i].Wp_Date.ToShortDateString()%></td></tr>
          <tr></tr>
          <tr><th>Project Name</th><td><%=Model.WorkPackageList[i].Project.ProjectName%></td></tr>
          <tr></tr>
          <tr><th>Description</th><td><%=Model.WorkPackageList[i].Wp_Description%></td></tr>
          <tr></tr>
          <tr><th>Created By</th><td><%=Model.WorkPackageList[i].Employee.Fname + " " + Model.WorkPackageList[i].Employee.Lname%></td></tr>
          <tr></tr>
            <%if (Page.User.IsInRole("Manager"))
              { %>     
          <tr><td><%=Html.ActionLink("EDIT", "Edit/" + Model.selectedId, "WorkPackage")%></td><td><%=Html.ActionLink("DELETE", "Delete/" + Model.selectedId, "WorkPackage")%></td></tr>
           <% }
            }
           
            }%>,
      </table>
      <br />
      <br />

</asp:Content>

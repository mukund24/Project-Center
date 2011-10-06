<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.ProjectModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetailView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <Headings>Details Of Selected Project </Headings>
    <br /><br />
    <table id="table1" cellpadding="1" cellspacing="1" border="2">
    <tr>
   </tr>
    <%for (int i = 0; i < Model.ProjectList.Count; i++)
      {
          if (Model.ProjectList[i].ProjectID.ToString() == Model.SelectedId)
          {
       %>
       <tr></tr>
       <tr><th>ProjectID</th><td><%=Model.ProjectList[i].ProjectID%></td></tr>
       <tr></tr>
       <tr><th>ProjectName</th><td><%=Model.ProjectList[i].ProjectName%></td></tr>
       <tr></tr>
       <tr><th>Start Date</th><td><%=Model.ProjectList[i].Start_Date.ToShortDateString()%></td></tr>
        <tr></tr>
      <tr><th>Last Review Date</th> <td>
      <%if(Model.ProjectList[i].Last_Review_Date!=null) %>
      <%=Model.ProjectList[i].Last_Review_Date.Value.ToShortDateString()%>
      &nbsp;
      </td></tr>
       <tr></tr>
       <tr><th>End Date</th><td>
       <%if(Model.ProjectList[i].End_Date!=null) %>
       <%=Model.ProjectList[i].End_Date.Value.ToShortDateString()%>
       &nbsp;
       </td></tr>
      <tr></tr>
       <tr><th>Project Status ID</th><td><%=Model.ProjectList[i].ProjectStatus.StatusValue%></td></tr>
       <tr></tr>
       <tr><th>Project Description</th><td><%=Model.ProjectList[i].Project_Desc%></td></tr>
      <tr></tr>
      <tr><th>Manager Name</th> <td><%=Model.ProjectList[i].Employee.Fname + " " + Model.ProjectList[i].Employee.Lname %></td></tr>
       <tr></tr>
       <%if(Page.User.IsInRole("Manager"))
         { %>
       <tr><td><%=Html.ActionLink("EDIT","Edit/"+Model.SelectedId,"Projects") %></td>
       <td><%=Html.ActionLink("DELETE","Delete/"+Model.SelectedId,"Projects") %></td></tr>
       <tr></tr>
       <%} %>
       <%}
      }%>
      <tr><td><%=Html.ActionLink("BACK TO LIST VIEW","List/"+Model.SelectedId,"Projects") %></td></tr>
    </table>
</asp:Content>

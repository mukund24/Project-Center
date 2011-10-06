<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.SoftwareReqtsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ManageWorkPackages
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<Headings>Manage Work Packages Of The Selected Software Requirement</Headings>
   <br /><br />
    <%using (Html.BeginForm("WpSubmit","Software_Reqts",FormMethod.Post)) %>
     <table id="table1" cellpadding="2px" cellspacing="2px" border="2">
   <tr></tr> 
    
<tr><th colspan="2">Used Work Packages</th></tr>

<%Session["srid"] = Model.SelectedId;%>
            <%for(int j=0;j<Model.Wp_used.Count;j++) 
              {%>
              
              <tr><th><%=Model.Wp_used[j].Text %></th><td><input name="SelectedPackages" checked="checked" type="checkbox" value="<%=Model.Wp_used[j].Value %>" /></td></tr> 

        <%} %>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><th colspan="2">Unused Work Packages</th></tr>
        <%for (int i = 0; i < Model.Wp_unused.Count; i++)
          { %>
          
          <tr><th><%=Model.Wp_unused[i].Text %></th><td><input name="UnselectedPackages" type="checkbox" value="<%=Model.Wp_unused[i].Value %>" /></td></tr>
          <%} %>
<tr><td colspan="2"><input type="submit" value="Submit" /></td></tr>
        </table>

</asp:Content>

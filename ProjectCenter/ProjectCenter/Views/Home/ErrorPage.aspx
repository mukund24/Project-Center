<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ErrorPage
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ErrorPage</h2>
    <%=ViewData["message"] %>

</asp:Content>

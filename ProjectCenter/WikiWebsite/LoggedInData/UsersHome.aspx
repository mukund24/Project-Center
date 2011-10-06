<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsersHome.aspx.cs" Inherits="WikiWebsite.LoggedInData.UsersHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="sidebar" runat="server">



</div>
<asp:TextBox ID="TextBox1" runat="server" Width="466px" Visible="False"></asp:TextBox>
    <asp:button  ID="Post" runat="server" Text="Post" Visible="False" Width="63px" 
        onclick="Post_Click"/> 
    <asp:CheckBox ID="CheckBox1" runat="server" Text="Is Public?" Visible="False" />
<div id ="mainContent" runat="server">
    
</div>
</asp:Content>

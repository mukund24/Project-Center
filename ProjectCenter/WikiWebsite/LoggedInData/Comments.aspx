<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="WikiWebsite.LoggedInData.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="sidebar" runat="server">



</div>
<asp:TextBox ID="TextBox1" runat="server" Width="466px"></asp:TextBox>
    <asp:button  ID="Post" runat="server" Text="Post" Width="63px" 
        onclick="Post_Click"/> 
    
<div id ="mainContent" runat="server">
    
</div>
</asp:Content>

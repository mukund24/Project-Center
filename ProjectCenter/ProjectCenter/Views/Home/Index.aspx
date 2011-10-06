<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: ViewData["Message"] %></h2>
    <p>
    <canvas id="myCanvas" width="200" height="100">
Your browser does not support the canvas element.
</canvas>

<script type="text/javascript">

    var c = document.getElementById("myCanvas");
    var cxt = c.getContext("2d");
    cxt.fillStyle = "#FF0000";
    cxt.beginPath();
    cxt.arc(70, 45, 45, 0, Math.PI * 2, true);
    cxt.closePath();
    cxt.fill();

    cxt.fillStyle = "#00FF00";
    cxt.beginPath();
    cxt.arc(70, 45, 40, 0, Math.PI * 2, true);
    cxt.closePath();
    cxt.fill();

    cxt.fillStyle = "#0000FF";
    cxt.beginPath();
    cxt.arc(70, 45, 35, 0, Math.PI * 2, true);
    cxt.closePath();
    cxt.fill();


    cxt.fillStyle = "#0F0F00";
    cxt.beginPath();
    cxt.arc(70, 45, 30, 0, Math.PI * 2, true);
    cxt.closePath();
    cxt.fill();

    cxt.fillStyle = "#00F0F0";
    cxt.beginPath();
    cxt.arc(70, 45, 25, 0, Math.PI * 2, true);
    cxt.closePath();
    cxt.fill();


    cxt.fillStyle = "#F0F000";
    cxt.beginPath();
    cxt.arc(70, 45, 20, 0, Math.PI * 2, true);
    cxt.closePath();
    cxt.fill();

    cxt.fillStyle = "#F00F00";
    cxt.beginPath();
    cxt.arc(70, 45, 15, 0, Math.PI * 2, true);
    cxt.closePath();
    cxt.fill();
</script>

       <center>Welcome To The Project Center</center>
       </a>.
    </p>
</script>
</asp:Content>




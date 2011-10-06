<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AfterLogin.Master" Inherits="System.Web.Mvc.ViewPage<ProjectCenter.Models.ProjectModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
<script type="text/javascript" language="javascript">
    function validate() {
        var val = document.getElementById("ProjectName").value;
        var result = true;
        var summary = "";

        /*System  Specific return value varies..*/
        if (val == null || val == "") {
            result = false;
            summary += "ENTER A PROJECT NAME <br/>";

        }
        val = document.getElementById("ManagerID").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "CHOOSE A MANAGER FOR THE PROJECT <br/>";
        }
        val = document.getElementById("ProjectStatusID").value;
        if (val == null || val == "" || val < 1) {
            result = false;
            summary += "CHOOSE A PROJECT STATUS </br>"
        }
        if (result == false)
            document.getElementById("error").innerHTML = summary;
        return result;

//        value = document.getElementById("End_Date");
//        function isDate(value) {
//            try {
//                value = value.replace("-", "/").replace(".", "/");
//                var SplitValue = value.split("/");
//                var OK = true;
//                if (!(SplitValue[0].length == 1 || SplitValue[0].length == 2)) {
//                    OK = false;
//                }
//                if (OK && !(SplitValue[1].length == 1 || SplitValue[1].length == 2)) {
//                    OK = false;
//                }
//                if (OK && SplitValue[2].length != 4) {
//                    OK = false;
//                }
//                if (OK) {
//                    var Day = parseInt(SplitValue[0]);
//                    var Month = parseInt(SplitValue[1]);
//                    var Year = parseInt(SplitValue[2]);

//                    if (OK = ((Year > 1900) && (Year < new Date().getFullYear()))) {
//                        if (OK = (Month <= 12 && Month > 0)) {
//                            var LeapYear = (((Year % 4) == 0) && ((Year % 100) != 0) || ((Year % 400) == 0));

//                            if (Month == 2) {
//                                OK = LeapYear ? Day <= 29 : Day <= 28;
//                            }
//                            else {
//                                if ((Month == 4) || (Month == 6) || (Month == 9) || (Month == 11)) {
//                                    OK = (Day > 0 && Day <= 30);
//                                }
//                                else {
//                                    OK = (Day > 0 && Day <= 31);
//                                }
//                            }
//                        }
//                    }
//                }
//                return OK;
//            }
//            catch (e) {
//                return false;
//            }
//        }
    }
</script>
</asp:content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <Headings>Changes to Selected Project Details</Headings>
    <br /><br />
    <p id="error"></p>
    <table id="table1" cellspacing="2px" cellpadding="2px" border="2">
   
     <%using (Html.BeginForm("Submit","Projects"))
       {%>
    <%for (int i = 0; i < Model.ProjectList.Count; i++)
      {
          if (Model.ProjectList[i].ProjectID.ToString() == Model.SelectedId)
          {
              Session["prid"] = Model.SelectedId;
        %>
       <tr></tr>
       <tr><th>ProjectID</th><td><%=Model.ProjectList[i].ProjectID%></td></tr>
    <tr></tr>
    <tr><th>ProjectName</th> <td><%=Html.TextBox("ProjectName",Model.ProjectList[i].ProjectName)%></td></tr>
    <tr></tr>
    <tr><th>Start Date</th> <td><%=Model.ProjectList[i].Start_Date.ToShortDateString()%></td> </tr> 
    <tr></tr>
    <tr><th>Last Review Date</th>  <td><%=Html.DatePicker("Last_Review_Date","/Content/images/calendar.gif",Model.ProjectList[i].Last_Review_Date)%></td></tr>
    <tr></tr>
     <tr><th>End Date</th>  <td><%=Html.DatePicker("End_Date", "/Content/images/calendar.gif", Model.ProjectList[i].End_Date)%></td></tr>
    <tr></tr>
    <tr><th>Project Status ID</th>  <td><%=Html.DropDownList("ProjectStatusID",Model.StatusList,"Select Status")%></td> </tr>
     <tr></tr>
     <tr><th>Project Description</th> <td><%=Html.TextArea("Project_Desc",Model.ProjectList[i].Project_Desc,15,100,null) %></td></tr>
       <tr></tr>
       <tr><th>Manager Name</th><td><%=Html.DropDownList("ManagerID",Model.ManagerList,"Select The Manager")%></td> 

       </tr>
        <%}
      } %>
      </table>
     
      <input type="submit" value="Submit"  onclick="javascript:return validate()"/>
      <%} %>
</asp:Content>

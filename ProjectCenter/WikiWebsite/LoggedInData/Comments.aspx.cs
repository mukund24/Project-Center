using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WikiWebsite.LoggedInData
{
    public partial class Comments : System.Web.UI.Page
    {
        WikiDataDataContext db = new WikiDataDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulatePage();
        }

        private void PopulatePage()
        {
            PopulateSideBar();
            var q = from b in db.PostComments
                    where b.PostId == Int32.Parse(Request.QueryString["postid"])
                    select b.Comment;

            string Htm = "<div>" + "Reply to "+q.First<string>() + "</div>";
             Htm += "<table id=table1>";
            var query = from c in db.ReplyComments
                        where c.PostId == Int32.Parse(Request.QueryString["postid"])
                        select c;
            foreach (var m in query)
            {
                Htm += "<tr><th>" + m.ReplyText + "</th><th>" + m.ReplyDate + "</th>" + "<th>" + m.Employee.Fname + "</th></tr>";
              

            }
            Htm += "</table>";
            mainContent.InnerHtml = Htm;
        }
        private void PopulateSideBar()
        {
            string val = "<ul>";
            db = new WikiDataDataContext();
            var query = from p in db.Projects
                        select p;
            foreach (var q in query)
            {
                val += "<li><a href=\"UsersHome.aspx?prid=" + q.ProjectID + "\">" + q.ProjectName + "</a></li>";
            }
            val += "</ul>";
            sidebar.InnerHtml = val;
        }

        protected void Post_Click(object sender, EventArgs e)
        {
            ReplyComment rc=new ReplyComment();
            int id = Int32.Parse(Request.QueryString["postid"]);
            rc.ReplyText = TextBox1.Text;
            rc.ReplyDate = DateTime.Today;
            rc.PostId = id;
            var query = from emp in db.Employees
                        where emp.Fname == Page.User.Identity.Name
                        select emp;
            rc.EmpId = query.First<Employee>().EmpId;
            db.ReplyComments.InsertOnSubmit(rc);
            db.SubmitChanges();
            PopulatePage();
            TextBox1.Text = "";

        }
        
    
    }
}
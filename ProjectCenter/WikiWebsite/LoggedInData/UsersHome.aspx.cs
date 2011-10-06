using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WikiWebsite.LoggedInData
{
    public partial class UsersHome : System.Web.UI.Page
    {
        WikiDataDataContext db;
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulatePage();
        }

        private void PopulatePage()
        {
            PopulateSideBar();
            
            if (Request.QueryString["prid"] != null)
            {
                int i = Int32.Parse(Request.QueryString["prid"]);
                if (i != 0)
                {

                    Post.Visible = true;
                    TextBox1.Visible = true;
                    CheckBox1.Visible = true;
                    var query = from pc in db.PostComments
                                where pc.ProjectID == i
                                select pc;
                    var q2 = from b in db.Projects
                             where b.ProjectID == Int32.Parse(Request.QueryString["prid"])
                             select b.ProjectName;

                    string html = "<h2>" + q2.First<string>() + "</h2>";
                    html += "<table id=table1>";

                    foreach (var q in query)
                    {
                        html += "<tr><th colspan=\"2\">" + q.Comment + "</th><th>" + q.DateAdded + "</th></tr>";
                        html += "<tr><th>" + q.Employee.Fname + "</th><th>" + q.Project.ProjectName + "</th><th><a href=\"Comments.aspx?postid=" + q.PostId + "\">Comments</th></tr>";
                    }
                    html += "</table>";
                    mainContent.InnerHtml = html;
                }
                else {
                    var query = from pc in db.PostComments
                               where pc.IsPublic=='Y'
                                select pc;
                
                    string html = "<table id=table1>";

                    foreach (var q in query)
                    {
                        html += "<tr><td colspan=\"2\">" + q.Comment + "</th><th>" + q.DateAdded + "</th></tr>";
                        html += "<tr><th>" + q.Employee.Fname + "</th><th>" + q.Project.ProjectName + "</th><th><a href=\"Comments.aspx?postid=" + q.PostId + "\">Comments</th></tr>";
                    }
                    html += "</table>";
                    mainContent.InnerHtml = html;
                
                
                }
            }
            else
            {
                mainContent.InnerHtml = "<h3>Please Click on a project link to see the posts in that project</h3>";
            }
        }

        private void PopulateSideBar()
        {
            string val = "<ul>";
            db= new WikiDataDataContext();
            var query = from p in db.Projects
                        select p;
            val += "<li><a href=\"UsersHome.aspx?prid=" + 0 + "\"> Public </a></li>";
            foreach (var q in query)
            {
                val += "<li><a href=\"UsersHome.aspx?prid=" + q.ProjectID + "\">" + q.ProjectName + "</a></li>";
            }
            val += "</ul>";
            sidebar.InnerHtml = val;
        }

        protected void Post_Click(object sender, EventArgs e)
        {
            PostComment pc = new PostComment();
            pc.ProjectID = Int32.Parse(Request.QueryString["prid"].ToString());
            pc.DateAdded = DateTime.Today;
            pc.Comment = TextBox1.Text;
            var query = from emp in db.Employees
                        where emp.Fname == Page.User.Identity.Name
                        select emp;
            pc.EmpId = query.First<Employee>().EmpId;
            if (CheckBox1.Checked)
                pc.IsPublic = 'Y';
            db.PostComments.InsertOnSubmit(pc);
            db.SubmitChanges();
            PopulatePage();
            TextBox1.Text = "";
        }
    }
}
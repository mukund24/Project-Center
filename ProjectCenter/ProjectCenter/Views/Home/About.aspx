<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <Headings>WELCOME TO THE SOFTWARE DEVELOPEMENT PROJECT CENTER </Headings>
    <p>Final Project #1– Software Development Project Center    
Version #2	
due Last day of Class
</p>
<p>Purpose:
You are a software developer and have been asked to develop a website and associated web service to support development activities for projects in your company.  The site is required to support recording and management of software requirements, work package descriptions, bug reports, and status reports.  The site will also provide a Wiki, used for communication between teams and also between developers and management.  You are also asked to provide a WCF-based service that supports client side application access to the data stored on this site, and two client applications that can create, modify, and delete bug reports and status reports. 
</p>
<p>Requirements:</p>
<p>Requirements:</p>
    <ul>
    <li>
    1.	A website that supports creating, modifying, and deleting software requirements, work package descriptions, bug reports, and status reports.
a.	Software requirements are stored in an SQL Server database, have an immutable number, title, date, and text statement.  Any requirement may also have an associated issues text statement
b.	All bug reports are stored in (the same) XML file, have an immutable number, title, date, issue text, and resolution text, which initially is blank.
c.	Status reports are stored in the SQL Server database, have an immutable number, title, date, work package reference, and status text.
d.	All text fields in requirements, work packages, bug reports, and status reports must support text of an open-ended size and views of that text should present the equivalent of several paragraphs to the user for both viewing and for modification.
    </li>
    <li>
    2.	A WCF-based web service that provides create, review, update, and delete (CRUD) access for the bug and status reports.
    
    </li>
    <li>
    3.	Two WPF client applications that use this service to support CRUD operations.  You may also satisfy this requirement with one application with a tabbed display, one tab view for bug reports and one for status.
    </li>
    <li>
    4.	A separate website that supports a Wiki intended to provide communication across a development project and also inter-team communication.
a.	Please provide a project wide section to which everyone has read access but only the project manager and team leaders have write access.
b.	Provide the ability for each team to create a section in the Wiki for the team.  All project members have read access, but only team members, including the team lead, have write access.
</li>
<li>5.	You are required to implement one of these sites in Asp.Net and the other in Asp.Net MVC.
</li>
<li>
6.	Login access that forces a link to any page to verify that you are a valid user, by checking the current session to see if you are currently logged in, otherwise redirecting you to a login page.  You may  use the Asp.Net provided login code, Asp.Net MVC login code, or develop a user control for this that you will make part of every page.

</li>
<li>
7.	Your site shall use:
a.	Both SQL server database(s) and XML file(s), of your design, to store state of the site, as described above.
b.	Use LINQ to access state data.
c.	Either Silverlight or HTML5 for some parts of your site.
d.	Pages using each of the models: HTML with Javascript and CSS, Asp.Net, and Asp.Net MVC.  Note that you may use more than one project for your site.



</li>

    
    </ul>
       
   
</asp:Content>

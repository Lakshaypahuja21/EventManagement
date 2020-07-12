<%@page import="action.ContactUsAction"%>
<%@page import="beans.ContactUSBeans"%>
<%@page import="beans.RegisterBeansMun"%>
<%@page import="beans.RegisterBeansBuzz"%>
<%@page import="beans.RegisterBeans"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Admin Panel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style.css">
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="custom-menu">
					<button type="button" id="sidebarCollapse" class="btn btn-primary">
	          <i class="fa fa-bars"></i>
	          <span class="sr-only">Toggle Menu</span>
	        </button>
        </div>
				<div class="p-4 pt-5">
		  		<h1><a href="index.html" class="logo">67th MS</a></h1>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
	            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="#">Header Image Insert & View</a>
                </li>
                <li>
                    <a href="#">Home Images Insert & View</a>
                </li>
                <li>
                    <a href="#">>News Insert & View</a>
                </li>
	            </ul>
	          </li>
	          <li>
	              <a href="#">About</a>
	          </li>
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Highlights</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="#">Highlights Insert</a>
                </li>
                <li>
                    <a href="#">Highlights View</a>
                </li>
              </ul>
	          </li>
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Events</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="#">Insert Event</a>
                </li>
                <li>
                    <a href="#">View & Modify</a>
                </li>
              </ul>
	          </li>
	          <li>
              <a href="RegistrationDetailsAction">Registration Details</a>
	          </li>
	          <li>
              <a href="ContactDetailsAction">Contact Details</a>
	          </li>
	        </ul>

	        <div class="mb-5">
						<h3 class="h6">Subscribe for newsletter</h3>
						<form action="#" class="colorlib-subscribe-form">
	            <div class="form-group d-flex">
	            	<div class="icon"><span class="icon-paper-plane"></span></div>
	              <input type="text" class="form-control" placeholder="Enter Email Address">
	            </div>
	          </form>
					</div>

	        <div class="footer">
	        	<p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | <a>Event Management</a></p>
	        </div>

	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">

        <h2 class="mb-4">Welcome <%=request.getSession().getAttribute("username")%></h2>
        <p>
	  	<table width="100%" border="1">
		<tr style="background-color: #CA6F1E; color: #ffffff; font-weight: bold; font-size: 20px;; height: 35px;">	
		<td align="center">Contact Us Details</td>
		</tr>
		</table>
		<br/>
		<hr/>
		<br/>
	  
		<table width="100%" border="1">
		<tr style="background-color: blue; color: #ffffff; font-weight: bold; height: 35px;">	
		<td>ID</td>
		<td> Name</td>
		<td>Email</td>
		<td>Subject</td>
		<td>message</td>
		<td>Entry Date</td>
		</tr>
		<%
		List<ContactUSBeans> contactUsList = new ArrayList<ContactUSBeans>();
		contactUsList = (ArrayList<ContactUSBeans>) request.getSession().getAttribute("contactUsList");
		
		if(contactUsList != null && contactUsList.size()>0) {
			for(ContactUSBeans contactUSBeans : contactUsList) {
				%>
				<tr>
				<td><%=contactUSBeans.getId()%></td>
				<td><%=contactUSBeans.getName()%></td>
				<td><%=contactUSBeans.getEmail()%></td>
				<td><%=contactUSBeans.getSubject()%></td>
				<td><%=contactUSBeans.getMessage()%></td>
				<td><%=contactUSBeans.getEntry_date()%></td>
				</tr>
				<%
			}	
		}
		%>
		</table>
	  
	  </p>
      </div>
		</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>

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
		
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
		
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
                    <a href="headerImages.jsp">Header Image Insert & View</a>
                </li>
                <li>
                    <a href="HomeInsert.jsp">Home Images Insert & View</a>
                </li>
                <li>
                    <a href="HomeNewsAction">News Insert & View</a>
                </li>
	            </ul>
	          </li>
	         
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Highlights</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="highlightsinsert.jsp">Highlights Insert</a>
                </li>
                <li>
                    <a href="AdminHighlightDisplayAction">Highlights View</a>
                </li>
              </ul>
	          </li>
	          <li>
              <a href="#eventsSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Events</a>
              <ul class="collapse list-unstyled" id="eventsSubmenu">
                <li>
                    <a href="EventDetails.jsp">Insert Event</a>
                </li>
                <li>
                    <a href="AdminEventDisplayAction">View & Modify</a>
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

	    

	      </div>
    	</nav>
<%
		String username =(String) request.getSession().getAttribute("username");
		if(username == null) {
			response.sendRedirect("index.jsp");
		}
		%>
        <!-- Page Content  -->
        
        
      <div id="content" class="p-4 p-md-5 pt-5">
      

     
        <table width="100%">
        <tr>
        <td width="50%"><h2 class="mb-4">Welcome <%=request.getSession().getAttribute("username")%></h2></td>
        <td width="50%" valign="middle" align="right"><a href="LogoutAction"><img src="images/logout.png" width="50px" height="50px"></a></td>
        </tr>
        </table>        
        <hr/>
        
        <p>
        	<%String success_msg = (String)request.getAttribute("success_msg");
	          if(success_msg != null && success_msg.length()>0) {
	        	%><div style="font-size: 14px; font-weight: bold; color: green;" align="center"><%=success_msg%></div><%  
	          }
	          String error_msg = (String)request.getAttribute("error_msg");
	          if(error_msg != null && error_msg.length()>0) {
	        	%><div style="font-size: 14px; font-weight: bold; color: maroon;" align="center"><%=error_msg%></div><%  
	          }
	        %>
        <p>
	  	<table width="100%" border="1">
		<tr style="background-color: #CA6F1E; color: #ffffff; font-weight: bold; font-size: 20px;; height: 35px;">	
		<td align="center">Contact Us Details</td>
		</tr>
		</table>
		<br/>
		<hr/>
		<br/>
	  
		<table width="100%" border="1" id="contdtl" class="display">
		<thead>
		<tr style="background-color: blue; color: #ffffff; font-weight: bold; height: 35px;">	
		<td>ID</td>
		<td> Name</td>
		<td>Email</td>
		<td>Subject</td>
		<td>message</td>
		<td>Entry Date</td>
		</tr>
		</thead>
		<tbody>
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
		</tbody>
		</table>
	  
	  </p>
      </div>
		</div>
		

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    
     <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#contdtl').DataTable( {
			"pagingType": "full_numbers"
		} );
	} );
	</script>
  </body>
</html>

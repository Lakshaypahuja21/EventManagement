<!doctype html>
<%@page import="beans.AdminEventBeans"%>
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
    	<!-- security for pages -->
    	
<%
		String username =(String) request.getSession().getAttribute("username");
		if(username == null) {
			response.sendRedirect("index.jsp");
		}
		%>
        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">

        <h2 class="mb-4">Welcome <%=request.getSession().getAttribute("username")%></h2>
        <p>
        <%String success_msg = (String)request.getAttribute("success_msg");
          if(success_msg != null && success_msg.length()>0) {
        	%><div style="font-size: 14px; font-weight: bold; color: green;" align="center"><%=success_msg%></div><%  
          }
          String error_msg = (String)request.getAttribute("error_msg");
          if(error_msg != null && error_msg.length()>0) {
        	%><div style="font-size: 14px; font-weight: bold; color: maroon;" align="center"><%=error_msg%></div><%  
          }
          
          AdminEventBeans beans = new AdminEventBeans();
          beans = (AdminEventBeans) request.getSession().getAttribute("admineventbeans");	
        %>	        
        <form action="updateEventsDetails" method="POST">
        						<input type="hidden" name="eventid" value="<%=beans.getEid()%>"/>
					  			<div class="form-group">
					  				<label for="exampleInputEmail1">Event Name </label>
					  			    <input type="text" class="form-control" placeholder="Event Name" name="Ename" value="<%=beans.getEname()%>">
					  			</div>
					  			<div class="form-group">
					  			  	<label for="exampleInputPassword1">Event Description</label>
					  			  	<textarea class="form-control" rows="5" name="Edesc"><%=beans.getEdesc()%></textarea>
					  			</div>
					  			<div class="form-group">
					  			  	<label for="exampleInputFile">Upload Image Name</label>
					  			 	 <input type="text" class="form-control" placeholder="Image Name" name="ImageName" value="<%=beans.getImname()%>">					  			</div>
					  		   
					  			<div class="form-group">
					  				<label for="exampleInputEmail1">Provide Youtube URL of video</label>
					  			    <input type="url" class="form-control" placeholder="URL" name="Eyurl" value="<%=beans.getEyurl()%>">
					  			</div>
					  			<div class="form-group">
					  				<label for="exampleInputEmail1">Provide INSTA URL</label>
					  			    <input type="url" class="form-control" placeholder="URL" name="Eiurl" value="<%=beans.getEiurl()%>">
					  			</div>
					  			<table width="100%">
					  			<tr>
					  			<td width="48%">
					  				  <p>Choose a subject <select id="etype" name="Etype" class="form-control">
					  				  <%
					  				  if(beans.getEtype().equalsIgnoreCase("Technical")) {
					  					  %><option value="Technical" selected="selected">Technical</option><%
					  				  } else {
					  					 %><option value="Technical">Technical</option><%
					  				  }
					  				  
					  				  if(beans.getEtype().equalsIgnoreCase("Cultural")) {
					  					  %><option value="Cultural" selected="selected">Cultural</option><%
					  				  } else {
					  					 %><option value="Cultural">Cultural</option><%
					  				  }
					  				  
					  				  if(beans.getEtype().equalsIgnoreCase("Management")) {
					  					  %><option value="Management" selected="selected">Management</option><%
					  				  } else {
					  					 %><option value="Management">Management</option><%
					  				  }
					  				  
					  				  if(beans.getEtype().equalsIgnoreCase("Sports")) {
					  					  %><option value="Sports" selected="selected">Sports</option><%
					  				  } else {
					  					 %><option value="Sports">Sports</option><%
					  				  }
					  				  %>
      								  </select></p>
					  			</td>
					  			<td width="4%">&nbsp;</td>
					  			<td width="48%">
					  				<p>No of Seats <input type="number" class="form-control" placeholder="No of Seats" name="NoOfSeat" value="<%=beans.getNo_of_seat()%>"></p>
					  			</td>
					  			</tr>
					  			</table>
					  			<br/>
					  			<br/>
					  			<div align="center">
					  			<input type="submit" name="Update" value="Update" class="button button2">
					  			&nbsp;&nbsp; 
					  			<input type="button" name="Reset" value="Reset" class="button button1">
					  			</div>
					  		</form>
        
        
        </p>
      </div>
		</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
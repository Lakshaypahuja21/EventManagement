<!doctype html>
<%@page import="beans.AdminHighlightsBeans"%>
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
          
          AdminHighlightsBeans beans = new AdminHighlightsBeans();
          beans = (AdminHighlightsBeans) request.getSession().getAttribute("adminhighlightbeans");	
        %>	        
        <form action="UpdateHighlightDetails" method="POST">
        						<input type="hidden" name="hid" value="<%=beans.getHid()%>"/>
        						<label for="heading">Heading</label>
					  			 	<input type="text" class="form-control" placeholder="Heading" name="Head" value="<%=beans.getHead()%>">
								
							
								<label for="desc">Description</label>
					  			 	<input type="text" class="form-control" placeholder="Description" name="Desc" value="<%=beans.getDesc()%>">
								
								
							  
									
									<label for="exampleInputFile">Upload Image Name</label>
					  			 	<input type="text" class="form-control" placeholder="Image Name" name="Himage1" value="<%=beans.getHimage1()%>">	
					  			 	  
					  			 	 <label for="exampleInputFile">Upload 2nd Image Name</label>
					  			 	<input type="text" class="form-control" placeholder="Image Name" name="Himage2" value="<%=beans.getHimage2()%>">	
							    
  								
  								
  								<label for="exampleInputEmail1">Provide Youtube URL of video</label>
					  	    	<input type="text" name="Hurl1" class="form-control" value="<%=beans.getHurl1()%>">

					  			<label for="exampleInputEmail1">Provide Youtube URL of video</label>
					  	    	<input type="text" name="Hurl2" class="form-control" value="<%=beans.getHurl2()%>">
								
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
<!doctype html>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.HomeImageInsertBeans"%>
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
       
     
		  							
		  							<div class="row" id = "homeimages">
  								<div class = "col-lg-8" >
  								<h3>Select Images</h3>
  								<form action="HomeImageInsertAction" method="post">
								<label for="exampleInputFile">Upload Image1 Name</label>
								<input type="text" class="form-control" placeholder="Image Name1" name="Homeimage1">
										<label for="exampleInputFile">Upload Image2 Name</label>
								<input type="text" class="form-control" placeholder="Image Name2" name="Homeimage2">
										<label for="exampleInputFile">Upload Image3 Name</label>
								<input type="text" class="form-control" placeholder="Image Name3" name="Homeimage3">
										<label for="exampleInputFile">Upload Image4 Name</label>
								<input type="text" class="form-control" placeholder="Image Name4" name="Homeimage4">
										<label for="exampleInputFile">Upload Image5 Name</label>
								<input type="text" class="form-control" placeholder="Image Name5" name="Homeimage5">
										<label for="exampleInputFile">Upload Image6 Name</label>
								<input type="text" class="form-control" placeholder="Image Name6" name="Homeimage6">
					<label for="exampleInputFile">Upload Image7 Name</label>
								<input type="text" class="form-control" placeholder="Image Name7" name="Homeimage7">
										<label for="exampleInputFile">Upload Image8 Name</label>
								<input type="text" class="form-control" placeholder="Image Name8" name="Homeimage8">
											
				
				<br>
				<input type="submit" name="Submit" value="Submit" class="button button2">
  				</form>
							<hr>		
  
        <table width="100%" border="1">
			<tr style="background-color: #CA6F1E; color: #ffffff; font-weight: bold; font-size: 20px;; height: 35px;">	
			<td align="center">Images Database</td>
			</tr>
			</table>
			<hr/>
			<table width="100%" border="1">
			<tr style="background-color: blue; color: #ffffff; font-weight: bold; height: 35px;">
			<td>Head image1</td>
			<td>Head image2</td>
			<td>Head image3</td>
			<td>Head image4</td>
			<td>Head image5</td>
			<td>Head image6</td>
			<td>Head image7</td>
			<td>Head image8</td>
			
			</tr>
        	
        	<%
        	List<HomeImageInsertBeans> homeImagesList = new ArrayList<HomeImageInsertBeans>();
        	homeImagesList = (ArrayList<HomeImageInsertBeans>) request.getSession().getAttribute("homeimageslist");
			int val=1;

			if(homeImagesList != null && homeImagesList.size()>0) {
				for(HomeImageInsertBeans homeImagesInsertBeans : homeImagesList) {
					%>
					<tr>
					<td><%=homeImagesInsertBeans.getHomeimage1() %></td>
					<td><%=homeImagesInsertBeans.getHomeimage2() %></td>
					<td><%=homeImagesInsertBeans.getHomeimage3() %></td>
					<td><%=homeImagesInsertBeans.getHomeimage4() %></td>
					<td><%=homeImagesInsertBeans.getHomeimage5() %></td>
					<td><%=homeImagesInsertBeans.getHomeimage6() %></td>
					<td><%=homeImagesInsertBeans.getHomeimage7() %></td>
					<td><%=homeImagesInsertBeans.getHomeimage8() %></td>
									
					</tr>
					<%
				}
			} else {
				%>
				<tr>
				<td  colspan="11" align="center"><b>Data Not Found</b></td>
				</tr>
				<%
			}
        	%>
        	</table>

  								</div></div>												
						</div> </div>
	
		
		
		
		
		

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
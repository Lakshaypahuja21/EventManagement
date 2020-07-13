<%@page import="java.util.ArrayList"%>
<%@page import="beans.AdminEventBeans"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>Event Website</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="stylesheets/event.css">
<link rel="stylesheet" href="stylesheets/lib.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="stylesheets/lib2.css"> 
<link rel="stylesheet" href="stylesheets/carousel.css">
<link rel="stylesheet" href="stylesheets/event.css">
<link rel="stylesheet" href="design/css/font-awesome.min.css">
<link rel="stylesheet" href="design/css/font-awesome.css">
<link rel="stylesheet" href="stylesheets/bootstrap.min.css">

  
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="js/Lib/bootstrap.min.js"></script>



</head>
<body>

<!-- Navbar (sit on top) -->
<div class="ms-top">
  <div class="ms-right ms-hide-small">
      <a href="event.jsp#about" class="ms-bar-item ms-button">ABOUT</a>
      <a href="event.jsp#team" class="ms-bar-item ms-button"><i class="fa fa-user"></i> TEAM</a>
      <a href="manastrial.jsp" class="ms-bar-item ms-button"><i class="fa fa-music"></i> EVENTS</a>
      <a href="event.jsp#contact" class="ms-bar-item ms-button"><i class="fa fa-envelope"></i> CONTACT</a>
      <a href="register.jsp" class="ms-bar-item ms-button"><i class="fa fa-plus"></i> REGISTER</a>
        <a href="index.jsp" class="ms-bar-item ms-button"><i class="fa fa-key"></i> Admin</a>

    </div>    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="ms-bar-item ms-button ms-right ms-hide-large ms-hide-medium" onclick="ms_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="ms-sidebar ms-bar-block ms-black ms-card ms-animate-left ms-hide-medium ms-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="ms_close()" class="ms-bar-item ms-button ms-large ms-padding-16">Close ×</a>
  <a href="#about" onclick="ms_close()" class="ms-bar-item ms-button">ABOUT</a>
  <a href="#team" onclick="ms_close()" class="ms-bar-item ms-button">TEAM</a>
  <a href="event.jsp" onclick="ms_close()" class="ms-bar-item ms-button">EVENTS</a>
  <a href="#contact" onclick="ms_close()" class="ms-bar-item ms-button">CONTACT</a>
  <a href="#register" onclick="ms_close()" class="ms-bar-item ms-button">REGISTER</a>
  <a href="admin_signup.jsp" onclick="ms_close()" class="ms-bar-item ms-button">ADMIN</a>
</nav>

<!-- About Section -->
<div class="ms-container" style="padding:128px 16px" id="about">
  <h3 class="ms-center" style="font-size:32px">67th MILESTONE</h3>
  <p class="ms-center ms-large">A BML Munjal University Fest</p>
  <div class="ms-row-padding ms-center" style="margin-top:64px">
    <div class="ms-quarter">
      <i class="fa fa-music ms-margin-bottom ms-jumbo ms-center"></i>
      <p class="ms-large">Cultural Events</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
    </div>
    <div class="ms-quarter">
      <i class="fa fa-users ms-margin-bottom ms-jumbo"></i>
      <p class="ms-large">Management Events</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
    </div>
    <div class="ms-quarter">
      <i class="fa fa-microchip ms-margin-bottom ms-jumbo"></i>
      <p class="ms-large">Technical Events</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
    </div>
    <div class="ms-quarter">
      <i class="fa fa-futbol-o ms-margin-bottom ms-jumbo"></i>
      <p class="ms-large">Sports</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
    </div>
  </div>
</div>

<% 
List<AdminEventBeans> adminEventList = new ArrayList<AdminEventBeans>();
adminEventList = (ArrayList<AdminEventBeans>)request.getSession().getAttribute("admineventlist");
int i = 0;
if(adminEventList != null && adminEventList.size()>0) {
	for(AdminEventBeans beans : adminEventList) {
		%>
		<%if(i%2==0) {%>
		<div class="ms-container ms-light-grey"  style="padding:64px 16px; margin-top:80px;">
		<%} else {%>
		<div class="ms-container"  style="padding-top:64px;padding-bottom:64px; padding-left: 16px;padding-right:16px margin-top:80px;">
		<%}%>
  			<div class="ms-row-padding">
   				<div class="ms-col m7">
				     <H3><%=beans.getEname()%></H3>
				     <br>
				     <table width="100%">
				     <tr style="background: #866ec7; color: #fff; height: 50px; font-size: 18px;">
				     <td width="5%"></td>
				     <td width="30%">Event Date: <b>23-07-2020</b></td>
				     <td width="30%">No of Seats : <b><%=beans.getNo_of_seat() %></b></td>
				     <td width="30%">Available Seats : <b><%=beans.getAval_seat() %></b></td>
				     <td width="5%"></td>
				     </tr>
				     </table>
				     <br/>
				     <p><%=beans.getEdesc() %></p>
				     <br/>
				     <div>
    					<a href="<%=beans.getEyurl()%>" target="_blank"><img src="images/youtubelogo.png" width="70px" height="50px"></a>
    					&nbsp;&nbsp;&nbsp;
    					<a href="<%=beans.getEiurl()%>" target="_blank"><img src="images/instagramlogo.png" width="50px" height="50px"></a>
  	  				 </div>
    			</div>
    			<div class="ms-col m5">
 					<div class="container">
  	  					<img src="images/<%=beans.getImname()%>" alt="Concert1" class="image" style="width:650px ; height:384px;">
  					</div>
      			</div>
    		</div>
		</div>		
		<%
		i++;
	}	
}
%>




<!-- Footer -->
<footer class="ms-center ms-black ms-padding-64">
  <a href="#home" class="ms-button ms-light-grey"><i class="fa fa-arrow-up ms-margin-right"></i>To the top</a>
  <div class="ms-xlarge ms-section">
    <i class="fa fa-facebook-official ms-hover-opacity"></i>
    <i class="fa fa-instagram ms-hover-opacity"></i>
  </div>
  <p>67 Milestone</p>
</footer>
 
<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}


// Toggle between showing and hiding the sidebar when clicking the menu icon
var mySidebar = document.getElementById("mySidebar");

function ms_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
  } else {
    mySidebar.style.display = 'block';
  }
}

// Close the sidebar with the close button
function ms_close() {
    mySidebar.style.display = "none";
}
 function animate_no()
 {
    $(".ms-quarter").counterUp({delay:10,time:1000})
  }  

</script>

</body>
</html>
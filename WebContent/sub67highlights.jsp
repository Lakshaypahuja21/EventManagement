<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="beans.AdminHighlightsBeans"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<html>
<head>
<title>sub 67 milestone 2020</title>
<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="C:\Users\parik\Desktop\webpage\bootstrap-3.4.1-dist\css\bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="67milestone.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="stylesheets/67milestone.css">
<link rel="stylesheet" href="stylesheets/lib.css">
<link rel="stylesheet" href="stylesheets/lib2.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="stylesheets/event.css">
<link rel="stylesheet" href="stylesheets/font.css">
<link rel="stylesheet" href="stylesheets/fontsmin.css">
<link rel="stylesheet" href="design/css/font-awesome.min.css">


</head>
<body>
 


 <!-- Navbar (sit on top) -->
<div class="ms-top">
  <div class="ms-bar ms-white ms-card" id="myNavbar">
    <a href="file:///C:/Users/parik/Desktop/webpage/event.html#about" class="ms-bar-item ms-button ms-wide">67th Milestone</a>
    <!-- Right-sided navbar links -->
    <div class="ms-right ms-hide-small">
      <a href="event.jsp#about" class="ms-bar-item ms-button">ABOUT</a>
      <a href="event.jsp#team" class="ms-bar-item ms-button"><i class="fa fa-user"></i> TEAM</a>
      <a href="manastrial.jsp" class="ms-bar-item ms-button"><i class="fa fa-music"></i> EVENTS</a>
      <a href="event.jsp#contact" class="ms-bar-item ms-button"><i class="fa fa-envelope"></i> CONTACT</a>
      <a href="register.jsp" class="ms-bar-item ms-button"><i class="fa fa-plus"></i> REGISTER</a>
        <a href="index.jsp" class="ms-bar-item ms-button"><i class="fa fa-key"></i> Admin</a>

    </div>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="ms-bar-item ms-button ms-right ms-hide-large ms-hide-medium" onclick="ms_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="ms-sidebar ms-bar-block ms-black ms-card ms-animate-left ms-hide-medium ms-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="ms_close()" class="ms-bar-item ms-button ms-large ms-padding-16">Close ×</a>
  <a href="file:///C:/Users/parik/Desktop/webpage/event.html#about" onclick="ms_close()" class="ms-bar-item ms-button">ABOUT</a>
  <a href="file:///C:/Users/parik/Desktop/webpage/event.html#team" onclick="ms_close()" class="ms-bar-item ms-button">TEAM</a>
  <a href="file:///C:/Users/parik/Desktop/webpage/event.html#pricing" onclick="ms_close()" class="ms-bar-item ms-button">EVENTS</a>
  <a href="file:///C:/Users/parik/Desktop/webpage/event.html#contact" onclick="ms_close()" class="ms-bar-item ms-button">CONTACT</a>
  <a href="#register" onclick="ms_close()" class="ms-bar-item ms-button">REGISTER</a>
</nav>

<!-- Header with full-height image -->
<header class="bgimg-1 ms-display-container ms-grayscale-min" id="home">
  <div class="ms-display-left ms-text-white" style="padding:48px">
    <span class="ms-jumbo ms-hide-small">Star Nights</span><br>
    <span class="ms-xxlarge ms-hide-large ms-hide-medium">Star Nights</span><br>
    <span class="ms-large">The night of Goosebumps</span>
  </div> 
  <div class="ms-display-bottomleft ms-text-grey ms-large" style="padding:24px 48px">
    <i class="fa fa-facebook-official ms-hover-opacity"></i>
    <i class="fa fa-instagram ms-hover-opacity"></i>
  </div>
</header>
  
 <h1 class="paddings" style="text-align: left; margin: 80px 0px 40px 20px;">Highlights</h1>








<% 
List<AdminHighlightsBeans> adminHighlightList = new ArrayList<AdminHighlightsBeans>();
adminHighlightList = (ArrayList<AdminHighlightsBeans>)request.getSession().getAttribute("adminhighlightlist");
int i = 0;
if(adminHighlightList != null && adminHighlightList.size()>0) {
	for(AdminHighlightsBeans beans : adminHighlightList) {
		%>
		<%if(i%2==0) {%>
		<div class="ms-container ms-light-grey"  style="padding:64px 16px; margin-top:80px;">
		<%} else {%>
		<div class="ms-container"  style="padding-top:64px;padding-bottom:64px; padding-left: 16px;padding-right:16px margin-top:80px;">
		<%}%>
			<h3 class="ms-center"><%=beans.getHead()%></h3>
  			<p class="ms-center ms-large"><%=beans.getDesc()%></p>
  			<div class="ms-row-padding">
   				<div class="ms-col m6">
				     <div class="container">
  	  					<img src="images/<%=beans.getHimage1()%>" alt="Concert1" class="image" style="width:650px ; height:384px;">
  					 </div>
    			</div>
    			<div class="ms-col m6">
 					 
 					 <iframe width="650" height="384" src="https://www.youtube.com/embed/<%=beans.getHurl1()%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      			</div>
    		</div>
    		<br>
    		<div class="ms-row-padding">
   				<div class="ms-col m6">
				     <div class="container">
  	  					<img src="images/<%=beans.getHimage2()%>" alt="Concert1" class="image" style="width:650px ; height:384px;">
  					 </div>
    			</div>
    			<div class="ms-col m6">
 					 					 <iframe width="650" height="384" src="https://www.youtube.com/embed/<%=beans.getHurl2()%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

      			</div>
    		</div>
		</div>		
		<%
		i++;
	}	
}
%>













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
</script>

</body>
</html>
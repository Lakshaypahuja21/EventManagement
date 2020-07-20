<%@page import="beans.HomeImageInsertBeans"%>
<%@page import="action.HomeImageInsertAction"%>
<%@page import="beans.HeaderImagesBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="beans.HomeNewsBeans"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
.bgimg-1 
{
  background-position: center;
  background-size: cover;
  background-image: url(ltbest.jpg);
  min-height: 100%;
}
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}


@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>






<meta charset="ISO-8859-1">
<title>Event Website</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="stylesheets/lib.css">
<link rel="stylesheet" href="stylesheets/lib2.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="stylesheets/event.css">
<link rel="stylesheet" href="stylesheets/font.css">
<link rel="stylesheet" href="stylesheets/bootstrap.css">
<link rel="stylesheet" href="stylesheets/fontsmin.css">
<link rel="stylesheet" href="design/css/font-awesome.min.css">

<script src="js/bootstrap.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.mySlides {display:none;}
</style>

<script type="text/javascript">
function checkContactUsForm() {
	
	var name = $("#name").val();
	var email = $("#email").val();
	
	if(name == '') {
		alert("Name should not be blank !");
		return false;
	}
	if(email == '') {
		alert("Email should not be blank !");
		return false;
	}
	//regex neet to implement for email validation
	return true;
}

</script>
<script>
var myIndex = 1;
carousel();

function carousel() {
   var i;
   for (i = 1; i <= 3; i++) {
	   $("#myslide"+i).hide();  
   }
   
   if (myIndex == 4) {myIndex = 1}    
   $("#myslide"+myIndex).show(); 
   myIndex++;
   setTimeout(carousel, 2000); // Change image every 2 seconds
 }
</script>






</head>
<body>

<!-- Navbar (sit on top) -->
<div class="ms-top">
  <div class="ms-bar ms-white ms-card" id="myNavbar">
    <a href="#home" class="ms-bar-item ms-button ms-wide">67th Milestone</a>
    <!-- Right-sided navbar links -->
    <div class="ms-right ms-hide-small">
      <a href="#about" class="ms-bar-item ms-button">ABOUT</a>     
      <a href="showEventsDetails" class="ms-bar-item ms-button"><i class="fa fa-music"></i> EVENTS</a>
      <a href="register.jsp" class="ms-bar-item ms-button"><i class="fa fa-plus"></i> REGISTER</a>      
       <a href="#team" class="ms-bar-item ms-button"><i class="fa fa-address-book"></i> TEAM</a>
       <a href="#contact" class="ms-bar-item ms-button"><i class="fa fa-envelope"></i> CONTACT</a>     
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
  <a href="#about" onclick="ms_close()" class="ms-bar-item ms-button">ABOUT</a>
  <a href="#team" onclick="ms_close()" class="ms-bar-item ms-button">TEAM</a>
  <a href="#events" onclick="ms_close()" class="ms-bar-item ms-button">EVENTS</a>
  <a href="#contact" onclick="ms_close()" class="ms-bar-item ms-button">CONTACT</a>
  <a href="register.jsp" onclick="ms_close()" class="ms-bar-item ms-button">REGISTER</a>
  <a href="index.jsp" onclick="ms_close()" class="ms-bar-item ms-button">Admin</a>
</nav>

<!-- Header with full-height image -->
<% 
List<HeaderImagesBeans> imgList = new ArrayList<HeaderImagesBeans>();

imgList = (ArrayList<HeaderImagesBeans>)request.getSession().getAttribute("headerImagesList");
int i = 0;
if(imgList != null && imgList.size()>0) {
	for(HeaderImagesBeans beans : imgList) {

		%>
<header class="bgimg-1 ms-display-container ms-grayscale-min" id="home" style="background-image:url(images/<%=beans.getHeadimage()%>)" >

<%}
	}
	%>
	
<!-- <header class="bgimg-1 ms-display-container ms-grayscale-min" id="home" style="background-image:url(images/ltbest.jpg)" >
  --><div class="ms-display-left ms-text-white" style="padding:48px">
    <span class="ms-jumbo ms-hide-small" style="color:white">Educate to Elevate</span><br>
    <span class="ms-xxlarge ms-hide-large ms-hide-medium">Educate to Elevate</span><br>
    <span class="ms-large" style="color:white">Fest for a cause</span>
    <p><a href="#about" class="ms-button ms-white ms-padding-large ms-large ms-margin-top ms-opacity ms-hover-opacity-off
      ">A Techno-Cultural-Management and Sports Fest</a></p>
  </div> 
  <div class="ms-display-bottomleft ms-text-grey ms-large" style="padding:24px 48px">
    <a href="https://www.bmu.edu.in/"><i class="fa fa-creative-commons"> </i> </a>
    <a href="https://www.instagram.com/bmlmunjaluniversity/?hl=en"><i class="fa fa-instagram ms-hover-opacity"></i></a>
  </div>
</header>

<!-- About Section -->
<div class="ms-container" style="padding:128px 16px" id="about">
  <h3 class="ms-center" style="font-size:32px">67th MILESTONE</h3>
  <p class="ms-center ms-large">A BML Munjal University Fest</p>
  <div class="ms-row-padding ms-center" style="margin-top:64px">
    <div class="ms-quarter">
      <i class="fa fa-music ms-margin-bottom ms-jumbo ms-center"></i>
      <p class="ms-large">Cultural Events</p>
      <p>Your body speaks. Dance expresses your emotions. Singing makes you feel on the inside. Theatre unveils your thoughts into action. How about trying out letting our body loose and let it speak? Register now and hold onto the marvelous opportunity in this journey!</p>
    </div>
    <div class="ms-quarter">
      <i class="fa fa-users ms-margin-bottom ms-jumbo"></i>
      <p class="ms-large">Management Events</p>
      <p>Managing is an art. And an art is how you manage. The art of management is not easy. But is easy once you try it passionately. It is not how you manage, it is much more than that. It reaches you through experience and you experience it through opportunities. So, register now for the amazing experience showcasing your management skills!</p>
    </div>
    <div class="ms-quarter">
      <i class="fa fa-microchip ms-margin-bottom ms-jumbo"></i>
      <p class="ms-large">Technical Events</p>
      <p>Learning is feasty when you get a reward for it. Learning is fun when you enjoy it. Learning takes you to another whole level of development. So, to gain all of it as an experience and showcase your skills with unique techniques, register now!</p>
    </div>
    <div class="ms-quarter">
      <i class="fa fa-futbol-o ms-margin-bottom ms-jumbo"></i>
      <p class="ms-large">Sports</p>
      <p>Sports develops personality, Builds stamina, principles of discipline, correction of mistakes, and unity.  A sport speaks its own language, doesn't differentiate amongst the players. All it sees is the hardwork and discipline it has brought to  life and of course, honesty. Register now to be a part of an amazing event and unleashing your talent in sports!</p>
    </div>
  </div>
</div>


<!-- News and Update Section -->
<div class="ms-container ms-light-grey ms-padding-64" style="margin-bottom:80px">
  <div class="ms-row-padding">
    <div class="ms-col m6">
      <h3>News and Updates</h3>
    </div>
    
    <% 
    List<HomeNewsBeans> newsList = new ArrayList<HomeNewsBeans>();	
	newsList = (ArrayList<HomeNewsBeans>)request.getSession().getAttribute("newwsList");
	
	if(newsList != null && newsList.size()>0) {
		%> <marquee class="GeneratedMarquee" direction="left" scrollamount="11" behavior="scroll" style="height: 60px;  font-size: 24px;"><%
		for(HomeNewsBeans beans : newsList) {
			out.print(beans.getNewsheadline());
			%>&nbsp;&nbsp;| &nbsp; &nbsp;<%
		} 
		%></marquee><%
	} %>
    </div>
  </div>


<!-- About university" -->
<div class="ms-container ms-light-grey" style="padding:128px 16px">
  <div class="ms-row-padding">
    <div class="ms-col m6">
      <h3>BML Munjal University</h3>
      <p>Named after the chairman and founder of the Hero Group, Dr. Brijmohan Lall Munjal, BML Munjal University is engaged in creating, preserving and imparting internationally benchmarked knowledge and skills to a diverse community of students from across the world. BMU’s aim is to nurture ethical leaders who are skilled, knowledgeable and have the life skills needed to lead organisations to success.</p>
      <p><a href="https://www.bmu.edu.in/" class="ms-button ms-black"><i class="fa fa-th"> </i> View university website</a></p>
      <a href="https://www.instagram.com/bmlmunjaluniversity/?hl=en"><i class="fa fa-instagram ms-hover-opacity"></i></a>
    </div>
    <div class="ms-col m6">
      <img class="ms-image ms-round-large" src="images/bml_photo.jpg" alt="bml" width="700" height="394">
    </div>
  </div>
</div>


<!-- About Fest" -->
<div class="ms-container ms-light-grey" style="padding:128px 16px; margin-top:80px;">
  <div class="ms-row-padding">
    <div class="ms-col m6">
      <h3>67th Milestone</h3>
      <p>The 67th Milestone is a themed fest hosting a wide range of artists, performers, athletes and technicians from colleges all over North India, especially Delhi and Delhi NCR. The uniqueness of the 67th Milestone lies in the opportunities and once in a lifetime experiences for it’s attendees.We at BMU strive at being founts of values and virtues sources that emanate values and virtues that create better societies and Education is one of the most significant tools to do so. With the aim of Elevating through Education we are trying to establish a connecting link between the resourceful and the deprived.</p>
      <p><a href="UserHighlightDetails" class="ms-button ms-black"><i class="fa fa-th"> </i> View previous edition highlights</a></p>
      <a href="https://www.instagram.com/67thmilestone_heroschallenge/?hl=en"><i class="fa fa-instagram ms-hover-opacity"></i></a>
    </div>
    <div class="ms-col m6">
      <img class="ms-image ms-round-large" src="images/concert3.jpg" alt="Concert3" width="700" height="394">
    </div>
  </div>
</div>



<!-- Promo Section "Statistics" -->
<div class="ms-container ms-row ms-center ms-dark-grey ms-padding-64">
  <div class="ms-quarter">
    <span class="ms-xxlarge">25+</span>
    <br>Events
  </div>
  <div class="ms-quarter">
    <span class="ms-xxlarge">15+</span>
    <br>Sponsors
  </div>
  <div class="ms-quarter">
    <span class="ms-xxlarge">4000+</span>
    <br>Last year footfall
  </div>
  <div class="ms-quarter">
    <span class="ms-xxlarge">80+</span>
    <br>Winners
  </div>
</div>

<!-- Star Night Highlights -->
<!-- Header with full-height image -->
<% 
List<HomeImageInsertBeans> HomeList = new ArrayList<HomeImageInsertBeans>();

HomeList = (ArrayList<HomeImageInsertBeans>)request.getSession().getAttribute("homeimageslist");
int j = 0;
if(HomeList != null && HomeList.size()>0) {
	for(HomeImageInsertBeans beans : HomeList) {

		%>


<div class="ms-container" style="padding:60px 16px" id="work">
  <h3 class="ms-center">Star Night Highlights</h3>
  <p class="ms-center ms-large">Rock n Roll</p>

  <div class="ms-row-padding" style="margin-top:64px">
    <div class="ms-col l3 m6">
      <img src="images/<%=beans.getHomeimage1()%>" style="width:100%" onclick="onClick(this)" class="ms-hover-opacity" alt="A microphone">
    </div> 
    <div class="ms-col l3 m6">
      <img src="images/<%=beans.getHomeimage2()%>" style="width:100%" onclick="onClick(this)" class="ms-hover-opacity" alt="A phone">
    </div>
    <div class="ms-col l3 m6">
      <img src="images/<%=beans.getHomeimage3()%>" style="width:100%" onclick="onClick(this)" class="ms-hover-opacity" alt="A drone">
    </div>
    <div class="ms-col l3 m6">
      <img src="images/<%=beans.getHomeimage4()%>" style="width:100%" onclick="onClick(this)" class="ms-hover-opacity" alt="Soundbox">
    </div>
  </div>

  <div class="ms-row-padding ms-section">
    <div class="ms-col l3 m6">
      <img src="images/<%=beans.getHomeimage5()%>" style="width:100%" onclick="onClick(this)" class="ms-hover-opacity" alt="A tablet">
    </div>
    <div class="ms-col l3 m6">
      <img src="images/<%=beans.getHomeimage6()%>"  style="width:100%" onclick="onClick(this)" class="ms-hover-opacity" alt="A camera">
    </div>
    <div class="ms-col l3 m6">
      <img src="images/<%=beans.getHomeimage7()%>" style="width:100%" onclick="onClick(this)" class="ms-hover-opacity" alt="A typewriter">
    </div>
    <div class="ms-col l3 m6">
      <img src="images/<%=beans.getHomeimage8()%>" style="width:100%" onclick="onClick(this)" class="ms-hover-opacity" alt="A tableturner">
    </div>
  </div>
</div>
<%}
	}
	%>

<!-- Modal for full size images on click-->
<div id="modal01" class="ms-modal ms-black" onclick="this.style.display='none'">
  <span class="ms-button ms-xxlarge ms-black ms-padding-large ms-display-topright" title="Close Modal Image">×</span>
  <div class="ms-modal-content ms-animate-zoom ms-center ms-transparent ms-padding-64">
    <img id="img01" class="ms-image">
    <p id="caption" class="ms-opacity ms-large"></p>
  </div>
</div>




  
  
  <div class="container">
  <h3 style="text-align:center;">Events </h3>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="images/concert1.jpg" alt="Los Angeles" style="width:1110px; height:550px;">
      </div>

      <div class="item">
        <img src="images/concert2.jpg" alt="Chicago" style="width:1110px; height:550px;">
      </div>
    
      <div class="item">
        <img src="images/concert3.jpg" alt="New york" style="width:1110px; height:550px;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
  
  
  
  

<!-- Team Section -->
<div class="ms-container" style="padding:128px 16px" id="team">
  <h3 class="ms-center">THE TEAM</h3>
  <p class="ms-center ms-large">The ones who run this Fest</p>
  <div class="ms-row-padding ms-grayscale" style="margin-top:64px">
    <div class="ms-col l4 m4 sm12 ms-margin-bottom">
      <div class="ms-card">
        <img src="images/parikshit.jpeg" alt="Parikshit" style="width:100%; height:550px;">
        <div class="ms-container">
          <h3>Parikshit</h3>
          <p class="ms-opacity">Marketing Head</p>
          <p> At the helm of the marketing department is the marketing director, tasked with overseeing the development and implementation of marketing strategies, and with guiding the team that executes them. Both online and offline marketing is taken by Marketing head.<br></p>
        <p><a href="https://www.linkedin.com/in/parikshit-palsania-883919188/" class="ms-button ms-light-grey ms-block"><i class="fa fa-envelope"></i>Contact</a></p>
        </div>
      </div>
    </div>
    <div class="ms-col l4 m4 sm12 ms-margin-bottom">
      <div class="ms-card">
        <img src="images/manas.png" alt="Manas" style="width:100%; height:550px;">
        <div class="ms-container">
          <h3>Manas Yadav</h3>
          <p class="Sponsorship head">Art Director</p>
          <p>Art directors are responsible for overseeing the care of valuable art pieces within a collection. This role also requires managing staff to ensure the proper care for different pieces of art, as well as ensuring strict guidelines exist that help determine how each piece of art is handled.
</p>
         <p><a href="https://www.linkedin.com/in/manas-yadav-83b25a171/" class="ms-button ms-light-grey ms-block"><i class="fa fa-envelope"></i>Contact</a></p>
        </div>
      </div>
    </div>
    <div class="ms-col l4 m4 sm12 ms-margin-bottom" >
      <div class="ms-card">
        <img src="images/lakshay.jpeg" alt="Lakshay" style="width:100%; height:550px;">
        <div class="ms-container">
          <h3>Lakshay</h3>
          <p class="ms-opacity">Web Designer</p>
          <p>A Web Developer is responsible for the coding, design and layout of a website according to a company's specifications. As the role takes into consideration user experience and function, a certain level of both graphic design and computer programming is necessary.</p>
         <p><a href="https://www.linkedin.com/in/lakshay-pahuja-684270168/" class="ms-button ms-light-grey ms-block"><i class="fa fa-envelope"></i>Contact</a></p>
        </div>
      </div>
    </div>
    <!-- <div class="ms-col l3 m6 ms-margin-bottom">
      <div class="ms-card">
        <img src="#" alt="Dev" style="width:100%">
        <div class="ms-container">
          <h3>Dev</h3>
          <p class="ms-opacity">Core Team</p>
          <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
          <p><button class="ms-button ms-light-grey ms-block"><i class="fa fa-envelope"></i> Contact</button></p>
        </div>
      </div>-->
    </div>
  </div>
</div>
 

<!-- Contact Section -->

	<div class="ms-container ms-light-grey" style="padding:40px 16px" id="contact">
	  <h3 class="ms-center">CONTACT</h3>
	  <p class="ms-center ms-large">Lets get in touch. Send us a message:</p>
	   <%String success_msg = (String)request.getAttribute("success_msg");
	          if(success_msg != null && success_msg.length()>0) {
	        	%><div style="font-size: 14px; font-weight: bold; color: green;" align="center"><%=success_msg%></div><%  
	          }
	          String error_msg = (String)request.getAttribute("error_msg");
	          if(error_msg != null && error_msg.length()>0) {
	        	%><div style="font-size: 14px; font-weight: bold; color: maroon;" align="center"><%=error_msg%></div><%  
	          }
	        %>	
	  <div style="margin-top:48px">
    
    <br>
	
    <form action="ContactUsAction" method="post" onsubmit="return checkContactUsForm();">
      <p><input class="ms-input ms-border" type="text" placeholder="Name" name="Name" id="name"></p>
      <p><input class="ms-input ms-border" type="text" placeholder="Email" name="Email" id="email"></p>
      <p>Choose a subject <select id="subject" name="subject" class="ms-input ms-border" >
      <option value="Buzz">Buzz</option>
      <option value="Mun">MUN</option>
      <option value="Bts">BTS</option>
      </select></p>
      <p><textarea name="message" id="message" rows="5" cols="229" placeholder="Message (Max limit: 100 words)" class="ms-input ms-border" ></textarea></p>

      <p>
        <button class="ms-button ms-black" type="submit">
          <i class="fa fa-paper-plane"></i> SEND MESSAGE
        </button>
      </p>
    </form>
    <br/>
    <br/>
    <br/>
    <table width="100%">
    <tr>
    <td width="20%" valign="top">
    <p><i class="fa fa-map-marker fa-fw ms-xxlarge ms-margin-right"  style="margin-top:30px"></i> Gurgaun, Haryana</p>
    <p><i class="fa fa-phone fa-fw ms-xxlarge ms-margin-right"></i> Phone: 11223344</p>
    <p><i class="fa fa-envelope fa-fw ms-xxlarge ms-margin-right"> </i> Email: bmu.edu.in</p>
    </td>
    <td width="80%" valign="top">
     <iframe width="100%" height="400" id="gmap_canvas" src="https://maps.google.com/maps?q=bml%20munjal%20university&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://www.embedgooglemap.net/blog/nordvpn-coupon-code/"></a>
   	</td>
    
    </table>
    <p>
    </div>
    </p>  
</div>
</div>




<br>


<!-- footer -->
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
<script type="text/javascript" "js/bootstrap.js"></script>
</body>
</html>
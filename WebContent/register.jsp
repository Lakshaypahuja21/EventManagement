<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Events </title>
	<link rel="stylesheet" type="text/css" href="stylesheets/bootmin.css" >
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="js/register.js"></script>
	<script type="text/javascript" src="js/register.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheets/register.css">
	

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<link rel="stylesheet" href="stylesheets/lib.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" href="stylesheets/lib2.css">
	<link rel="stylesheet" type="text/css" href="design/cssfont-awesome.min.css">
	<link rel="stylesheet" href="stylesheets/font.css">
	<link rel="stylesheet" href="stylesheets/fontsmin.css">
	<link rel="stylesheet" href="design/css/font-awesome.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


											<!--  alert dialogs -->
											
											
<script type="text/javascript">
function checkRegisterForm() {

	var name = $("#exampleInputEmail1").val();
	var name = $("#contactphone").val();
	var name = $("#").val();
	var name = $("#").val();
	var name = $("#").val();
}

</script>

		<!-- ---------------------------------------------form ----------------------------------------------------------- -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

function showRegForm() {
	var subject = $("#subject").val();
	if(subject == 'bts') {
		$("#form1").show();
		$("#form2").hide();
		$("#form3").hide();
	} else if(subject == 'mun') {
		$("#form2").show();
		$("#form1").hide();
		$("#form3").hide();
	} else if(subject == 'Buzz') {
		$("#form3").show();
		$("#form2").hide();
		$("#form1").hide();
	}
}
</script>
<!-- -------------------------------------------------------------------------------------------------------- -->

</head>
<body style="background-image: url(images/ltbest.jpg);">
	<div class="ms-top">
		<div class="ms-bar ms-white ms-card" id="myNavbar">
    		<a href="#home" class="ms-bar-item ms-button ms-wide">67th Milestone</a>
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


		<div class="ms-container ms-row ms-center ms-dark-grey ms-padding-64" style="background-image: url(images/IMG_3631-01.jpeg);">
		   <H1>Registration Page </H1></div>		
		<br><br>
		<div class= "container">
		<div class="jumbotron">
		<div class ="row"> 
			<div class="col-lg-6 col-md-6" id="form" >
				<div class="dropdown">
				<p><h3>Choose Event </h3>
				<select id="subject" name="subject" onchange="showRegForm();">
   					<option value="bts" id="id_1">Beat The Sreet</option>
    				<option value="mun" id="id_2">Siera MUN</option>
     				<option value="Buzz" id="id_3">BUZZ</option>
   			    </select>
  				</div>
<!--------------------------------------------------- bts form starts here------------------------------------- -->
  				<div id="form1" style = "align:center ;">
  				<form class="bts form" action="RegisterAction" method="POST" onsubmit="return checkRegisterForm();">
  				
  					<%
          String error_msg = (String)request.getAttribute("error_msg");
          if(error_msg != null && error_msg.length()>0) {
        	%><div style="font-size: 14px; font-weight: bold; color: maroon;" align="center"><%=error_msg%></div><%  
          }String success_msg = (String)request.getAttribute("success_msg");
          if(success_msg != null && success_msg.length()>0) {
        	%><div style="font-size: 14px; font-weight: bold; color: green;" align="center"><%=success_msg%></div><%  
          }
        %>	
  					<div class="form-row">
    					<div class="col">
    						<label >First Name</label>
    						<input type="text" class="form-control" placeholder="First name"  name="firstnamebts" required>
    					</div>
    					<div class="col">
    						 <label >Last Name</label>
     						<input type="text" class="form-control" placeholder="Last name" name="lastnamebts" required>
   					 	</div>
  					</div>
  				
  					<div class="form-group" >
   						 <label for="exampleInputEmail1">Email address</label>
   						 <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email" name="emailbts" required>
 					</div>
 					<div class="form-group">
 						<label for="quantity">Contact No</label>
    					<input type="text" class="form-control" id="contactphone" placeholder="10 Digit No." name="contactbts" required>
    				</div>
    				<div class="form-group">
    					<label >School/College Name</label>
     					<input type="text" class="form-control" placeholder="Last name" name="collegebts" required>
   					</div>
   					<div class="form-group">
 						 <label for="quantity">Team Members</label>
    					<input type="number" class="form-control" placeholder="Max 30" min="1" max = "30" name="teambts" required>
    				</div>
  					<!--<div class="checkbox" >
  						<label>
      						<input type="checkbox" value=" 1" name="transportbts" > Transportation Required
      					</label>
  					</div> -->
 						<button type="submit" class="mutton">Submit</button> 
            
				</form>
				</div>
<!------------------------------------------------- mun form starts  here ---------------------------------------------------- -->
				
				<div id="form2" style="display: none">
				<form class="mun form" action="RegisterActionMun" method="POST" onsubmit="return checkRegisterForm();">
				<%
          String error_msg1 = (String)request.getAttribute("error_msg");
          if(error_msg1 != null && error_msg1.length()>0) {
        	%><div style="font-size: 14px; font-weight: bold; color: maroon;" align="center"><%=error_msg1%></div><%  
          }String success_msg1 = (String)request.getAttribute("success_msg");
          if(success_msg1 != null && success_msg1.length()>0) {
        	%><div style="font-size: 14px; font-weight: bold; color: green;" align="center"><%=success_msg1%></div><%  
          }
        %>	
  					<div class="form-row">
    					<div class="col">
    						 <label >First Name</label>
    						<input type="text" class="form-control" placeholder="First name" name="firstnamemun" required>
    					</div>
    					<div class="col">
    						<label >Last Name</label>
     						<input type="text" class="form-control" name="lastnamemun" placeholder="Last name" required>
   					 	</div>
  					</div>
  				
  					<div class="form-group" >
   						 <label for="exampleInputEmail1">Email address</label>
   						 <input type="email" class="form-control" id="exampleInputEmail1" name="emailmun" placeholder="Email" required>
 					</div>
 					<div class="form-group">
 						<label for="quantity">Contact No</label>
    					<input type="number" class="form-control" name="contactmun" placeholder="10 Digit No." required>
    				</div>
    				<div class="form-group">
    					<label >School/College Name</label>
     					<input type="text" class="form-control" placeholder="Last name" name="collegemun" required>
 					 </div>

 					<label class="my-1 mr-2" for="inlineFormCustomSelectPref">Committee</label>
  					<select name="committeemun" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
					    <option selected>Choose committee</option>
					    <option value="1">AIPPM</option>
					    <option value="2">UNSC</option>
					    <option value="3">UNEP</option>
					</select>
					<label class="my-1 mr-2" for="inlineFormCustomSelectPref">Portfolio</label>
					<select name="portfoliomun" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
					    <option selected>Choose portfolio</option>
					    <option value="1">Arvind Kejriwal</option>
					    <option value="2">Narendra Modi</option>
					    <option value="3">Shashi Tharoor</option>
					</select>
 					 
  					
 					<button type="submit" class="mutton">Submit</button>
				</form>
				</div>
<!-------------------------------------------- buzz form starts her-e ------------------------------------->		

				<div id="form3" style="display: none;">
				<form class="buzz form" action="RegisterActionBuzz" method="POST" onsubmit="return checkRegisterForm();">
				<%
          String error_msg2 = (String)request.getAttribute("error_msg");
          if(error_msg2 != null && error_msg2.length()>0) {
        	%><div style="font-size: 14px; font-weight: bold; color: maroon;" align="center"><%=error_msg2%></div><%  
          }
       String success_msg2 = (String)request.getAttribute("success_msg");
          if(success_msg2 != null && success_msg2.length()>0) {
        	%><div style="font-size: 14px; font-weight: bold; color: green;" align="center"><%=success_msg2%></div><%  
          } %>	
  					<div class="form-row">
    					<div class="col">
    						<label >First Name</label>
    						<input type="text" class="form-control" placeholder="First name" name="firstnamebuzz" required>
    					</div>
    					<div class="col">
    						<label >Last Name</label>
     						<input type="text" class="form-control" placeholder="Last name" name="lastnamebuzz" required>
   					 	</div>
  					</div>
  				
  					<div class="form-group" >
   						<label for="exampleInputEmail1">Email address</label>
   						<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email" name="emailbuzz" required>
 					</div>
 					<div class="form-group">
 						<label for="quantity">Contact No</label>
    					<input type="number" class="form-control" placeholder="10 Digit No." name="contactbuzz">
    				</div>
    				<div class="form-group">
    					<label >School/College Name</label>
     					<input type="text" class="form-control" placeholder="Last name" name="collegebuzz">
  					</div>
  					<div class="form-group">
 						<label for="quantity">Team Members</label>
    					<input type="number" class="form-control" placeholder="Max 4" min="1" max = "4" name="teambuzz">
    				</div>
  
  					<button type="submit" class="mutton">Submit</button>				
				</form>
									
	       
	     											 <!--  form ends --> 
	     											 
	       
	       
	        </div>
	    	<div class="col-lg-6 col-md-6" id="details">
				
			</div>	        
	    </div>
	</div></div></div>
	<br>

	<footer class="ms-center ms-black ms-padding-64">
  <a href="#home" class="ms-button ms-light-grey"><i class="fa fa-arrow-up ms-margin-right"></i>To the top</a>
  <div class="ms-xlarge ms-section">
    <i class="fa fa-facebook-official ms-hover-opacity"></i>
    <i class="fa fa-instagram ms-hover-opacity"></i>
  </div>
  <p>67 Milestone</p>
</footer>

 

	<script type="text/javascript" src="stylesheets/register.css"></script>
</body>
</html>
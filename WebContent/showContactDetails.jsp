<%@page import="action.ContactUsAction"%>
<%@page import="beans.ContactUSBeans"%>
<%@page import="beans.RegisterBeansMun"%>
<%@page import="beans.RegisterBeansBuzz"%>
<%@page import="beans.RegisterBeans"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<title>AdminSite</title>
</head>
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 14px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

.dropbtn {
  background-color: #4CAF50;
  width: 100%;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;

}

.dropbtn2 {
  background-color: #439546;
  width: 100%;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;

}

.dropdown {

}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
font-size: 14px;
  color: black;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
<body>
<div class="sidenav">
  <div class="dropdown">
  <button class="dropbtn">Home Page</button>
  <div class="dropdown-content">
  	<a href="#">Header Image Insert & View </a><hr/>					    	
	<a href="#">Home Images Insert & View </a><hr/>
	<a href="#">News Insert & View</a>
  </div>
</div>
<div class="dropdown">
  <button class="dropbtn2">Highlights</button>
  <div class="dropdown-content">
  	<a href="#">Highlights Insert </a> <hr/>
	<a href="#">Highlights View </a>
  </div>
</div>
<div class="dropdown">
  <button class="dropbtn">Events</button>
  <div class="dropdown-content">
  	<a href="#">Insert Event</a> <hr/>
	<a href="#">View & Modify</a>
  </div>
</div>
<a href="ContactDetailsAction"><button class="dropbtn2">Contact Us</button></a>
<a href="RegistrationDetailsAction"><button class="dropbtn">Registration</button></a>
</div>

<div class="main">
  <h2>Welcome <%=request.getSession().getAttribute("username")%></h2>
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

</body>
</html>

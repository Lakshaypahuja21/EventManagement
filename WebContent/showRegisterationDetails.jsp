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
	<td align="center">Registration Details</td>
	</tr>
	</table>
	<br/>
	<hr/>
	<br/>
	<table width="100%" border="1">
	<tr style="background-color: maroon; color: #ffffff; font-weight: bold; height: 35px;">
	<td colspan="8" align="center">BDS</td>
	</tr>
	<tr style="background-color: blue; color: #ffffff; font-weight: bold; height: 35px;">
	<td>ID</td>
	<td>First Name</td>
	<td>Last Name</td>
	<td>Email</td>
	<td>Contact</td>
	<td>College</td>
	<td>Team Size</td>
	<td>Entry Date</td>
	</tr>
	
	<%
	List<RegisterBeans> registerList = new ArrayList<RegisterBeans>();
	registerList = (ArrayList<RegisterBeans>) request.getSession().getAttribute("registerList");
	
	if(registerList != null && registerList.size()>0) {
		for(RegisterBeans registerBeans : registerList) {
			%>
			<tr>
			<td><%=registerBeans.getId()%></td>
			<td><%=registerBeans.getFirstnamebts()%></td>
			<td><%=registerBeans.getLastnamebts()%></td>
			<td><%=registerBeans.getEmailbts()%></td>
			<td><%=registerBeans.getContactbts()%></td>
			<td><%=registerBeans.getCollegebts()%></td>
			<td><%=registerBeans.getTeambts()%></td>
			<td><%=registerBeans.getEntry_date()%></td>
			</tr>
			<%
		}	
	}
	%>
	</table>
	<br/><br/>
	<!--                                   tbale for BUZZ                       -->
	<table width="100%" border="1">
	<tr style="background-color: maroon; color: #ffffff; font-weight: bold; height: 35px;">
	<td colspan="8" align="center">BUZZ Details</td>
	</tr>
	<tr style="background-color: blue; color: #ffffff; font-weight: bold; height: 35px;">
	<td>ID</td>
	<td>First Name</td>
	<td>Last Name</td>
	<td>Email</td>
	<td>Contact</td>
	<td>College</td>
	<td>Team Size</td>
	<td>Entry Date</td>
	</tr>
	
	<%
	List<RegisterBeansBuzz> registerListBuzz = new ArrayList<RegisterBeansBuzz>();
	registerListBuzz = (ArrayList<RegisterBeansBuzz>) request.getSession().getAttribute("registerListBuzz");
	
	if(registerListBuzz != null && registerListBuzz.size()>0) {
		for(RegisterBeansBuzz registerBeansBuzz : registerListBuzz) {
			%>
			<tr>
			<td><%=registerBeansBuzz.getId()%></td>
			<td><%=registerBeansBuzz.getFirstnamebuzz()%></td>
			<td><%=registerBeansBuzz.getLastnamebuzz()%></td>
			<td><%=registerBeansBuzz.getEmailbuzz()%></td>
			<td><%=registerBeansBuzz.getContactbuzz()%></td>
			<td><%=registerBeansBuzz.getCollegebuzz()%></td>
			<td><%=registerBeansBuzz.getTeambuzz()%></td>
			<td><%=registerBeansBuzz.getEntry_date()%></td>
			</tr>
			<%
		}	
	}
	%>
	</table>
	<br/><br/>
	<!--                                   tabale for MUN                       -->
	<table width="100%" border="1">
	<tr style="background-color: maroon; color: #ffffff; font-weight: bold; height: 35px;">
	<td colspan="10" align="center">MUN Details</td>
	</tr>
	<tr style="background-color: blue; color: #ffffff; font-weight: bold; height: 35px;">
	<td>ID</td>
	<td>First Name</td>
	<td>Last Name</td>
	<td>Email</td>
	<td>Contact</td>
	<td>College</td>
	<td>Committee</td>
	<td>Portfolio</td>
	<td>Team Size</td>
	<td>Entry Date</td>
	</tr>
	
	<%
	List<RegisterBeansMun> registerListMun = new ArrayList<RegisterBeansMun>();
	registerListMun = (ArrayList<RegisterBeansMun>) request.getSession().getAttribute("registerListMun");
	
	if(registerListMun != null && registerListMun.size()>0) {
		for(RegisterBeansMun registerBeansMun : registerListMun) {
			%>
			<tr>
			<td><%=registerBeansMun.getId()%></td>
			<td><%=registerBeansMun.getFirstnamemun()%></td>
			<td><%=registerBeansMun.getLastnamemun()%></td>
			<td><%=registerBeansMun.getEmailmun()%></td>
			<td><%=registerBeansMun.getContactmun()%></td>
			<td><%=registerBeansMun.getCollegemun()%></td>
			<td><%=registerBeansMun.getCommitteemun()%></td>
			<td><%=registerBeansMun.getPortfoliomun()%></td>
			<td><%=registerBeansMun.getTeammun()%></td>
			<td><%=registerBeansMun.getEntry_date()%></td>
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
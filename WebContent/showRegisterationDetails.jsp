<%@page import="beans.RegisterBeansMun"%>
<%@page import="beans.RegisterBeansBuzz"%>
<%@page import="beans.RegisterBeans"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Details</title>
</head>
<body>
<table width="100%" border="1">
<tr>
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
<tr>
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
<tr>
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

</body>
</html>
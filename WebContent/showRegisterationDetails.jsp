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
</body>
</html>
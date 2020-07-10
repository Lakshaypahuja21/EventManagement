<%@page import="action.ContactUsAction"%>
<%@page import="beans.ContactUSBeans"%>
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
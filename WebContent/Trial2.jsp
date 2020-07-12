<%@page import="action.AdminHighlightAction"%>
<%@page import="beans.AdminHighlightsBeans"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
	List<AdminHighlightsBeans> adminHighlightList = new ArrayList<AdminHighlightsBeans>();
	adminHighlightList = (ArrayList<AdminHighlightsBeans>) request.getSession().getAttribute("adminhighlightbeans");
	
	if(adminHighlightList != null && adminHighlightList.size()>0) {
		for(AdminHighlightsBeans adminHighlighBeans : adminHighlightList) {
			%>
			<tr>
			<td><%=adminHighlighBeans.getHid()%></td>
			<td><%=adminHighlighBeans.getHead()%></td>
			<td><%=adminHighlighBeans.getDesc()%></td>
			<td><%=adminHighlighBeans.getHurl1()%></td>
			<td><%=adminHighlighBeans.getHurl2()%></td>
			</tr>
			<%
		}	
	}
	%>
	</table>
</body>
</html>
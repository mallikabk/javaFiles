<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.cms.pojo.Customer,com.cms.daoImpl.CustomerDaoImpl"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>

	<h1 style="text-align: center; color: blue;">
		<u>All Customers Information</u>
	</h1>
	<table class="table table-striped">

		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Address</th>

		</tr>
		<%
		List<Customer> custlist = (List<Customer>) request.getAttribute("view");
		%>
		<%
		if (!custlist.isEmpty()) {
		%>
		<%
		for (Customer c : custlist) {
		%>

		<tr>
			<td><%=c.getCid()%></td>
			<td><%=c.getName()%></td>
			<td><%=c.getAdd()%></td>
			<td><a href="edit?id=<%=c.getCid()%>">Edit</a></td>
			<td><a href="edit?id=<%=c.getCid()%>">Edit</a></td>
		</tr>
		<%
		}
		}
		%>
	</table>

</body>
</html>
<%@page import="pojo.Courses"%>
<%@page import="student.dao.CourseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>CourseDetail</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
<jsp:include page="includes/navbar.jsp" /><br> <br> <br> <br> 
<% 
Courses c=CourseDAO.getCourseDetailByName(request.getParameter("course_name"));
%>
<table style="border-style:solid; width:1000px; text-align: center">
<tr>
<th>name</th>
<th>category</th>
<th>Total seat</th>
<th>available seat</th>
<th>duration</th>
<th>fee</th>
<th>Status</th>
<th>Link</th>
</tr>
<tr>
<td><%=c.getCourse_name() %></td>
<td><%=c.getCategory() %></td>
<td><%=c.getTotal() %></td>
<td><%=c.getAvailable() %></td>
<td><%=c.getDuration() %></td>
<td><%=c.getFee() %></td>
<td><% if(c.getIsAvailable().equalsIgnoreCase("y")){
		out.print("available");}else out.print("Not Available");%></td>
		

<%if(c.getIsAvailable().equalsIgnoreCase("y")){ %>
<td><a href="courseselected?name=<%out.print(c.getCourse_name());%>&fee=<%=c.getFee()%>">Register</a></td>
<%}else out.print("<td>Register<td>");%>
</tr>
</table>



<a href="catalog"><H3>OTHER AVAILABLE COURSES</H3></a>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
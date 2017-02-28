<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
  <%@page import="student.dao.CourseDAO" %>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="java.util.ArrayList"%>
  <%@page import="pojo.Courses"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Catalog</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
<jsp:include page="../includes/navbar.jsp" /><br><br><br><br>
<h1>COURSES</h1>
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
<%
ArrayList<Courses> list =CourseDAO.getCourses();
for(int i=0;i<list.size();i++){
%>

<tr>

<td><%=list.get(i).getCourse_name() %></td>
<td><%=list.get(i).getCategory() %></td>
<td><%=list.get(i).getTotal() %></td>
<td><%=list.get(i).getAvailable() %></td>
<td><%=list.get(i).getDuration() %></td>
<td><%=list.get(i).getFee() %></td>
<td><% if(list.get(i).getIsAvailable().equalsIgnoreCase("y")){
		out.print("available");}else out.print("Not Available");%></td>

<td>
<%if(list.get(i).getIsAvailable().equalsIgnoreCase("y")){ %>
<a href="courseselected?name=<%out.print(list.get(i).getCourse_name());%>&fee=<%=list.get(i).getFee()%>">Register</a></td>
<%}else out.print("Register");%>
</tr>

<%
}
%>

</table>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
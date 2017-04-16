<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
  <%@page import="generalDAO.CourseDAO" %>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="java.util.ArrayList"%>
  <%@page import="pojo.Courses"%>
  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>catalog</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" />
  </head>
  <body>
<jsp:include page="../includes/navbar.jsp" />
<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">							
				<li><a href="home">Home</a></li>
				<li>Admin</li>
				<li><a href="admin-dashboard">Dashboard</a></li>
				<li>Add Student</li>
				<li>Catalog</li>					
			</div>		
		</div>	
</div>
	
<div class="container">
<h1 class="list-group-item-info">COURSES</h1>
<div class="table-responsive">
<table class="table ">
<thead class=" btn-primary">
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
</thead>
 <tbody class="btn-info">
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
<a class="btn-danger" href="courseselected?name=<%out.print(list.get(i).getCourse_name());%>&fee=<%=list.get(i).getFee()%>">Register</a></td>
<%}else out.print("Register");%>
</tr>

<%
}
%>
 </tbody>
</table>
</div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
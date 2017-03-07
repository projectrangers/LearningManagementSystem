<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="generalDAO.CategoryDAO"%>
<%@page import="pojo.Courses"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
if(session.getAttribute("email")!=null && session!=null){
	if(!session.getAttribute("user").equals("admin")){
		response.sendRedirect("error?message=Sorry!!You are not authorized to view this page");
	    }
	}else
if(session.getAttribute("login")==null)
	response.sendRedirect("error?message=Sorry!!Please login First!");
		%>
<html>
<head>
<title>Add New Course</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
<jsp:include page="../includes/navbar.jsp" /> <br><br><br><br>
<% ArrayList<String> l=CategoryDAO.getCourseCategories();%>
<s:fielderror name="message"></s:fielderror>

<form action="add" method="post" >
NAME:<input name="courseName" type="text" required>
<br>CATEGORY:
<select name="course_category" required>
<% 
for(int j=0;j<l.size();j++){%>
<option ><%=l.get(j).toUpperCase()%></option>
<%} %>
</select>
<br>TOTAL SEAT:
<input name="total"  required>


<br>AVAILABLE SEAT:
<input name="available" required>

<br>IS AVAILABLE:

<select name="is_available" required>
<option>Y</option>
<option>N</option>
</select>

<br>DURATION:
<input name="duration" required>

<br>FEE:
<input name="fee" required >
<br><input type="submit" value="ADD">
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="student.dao.CourseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- navbar start -->

<nav class="navbar navbar-default navbar-fixed-top">
<div class="container">
<button type="button" class="navbar-toggle"
data-toggle="collapse"
data-target=".navbar-collapse">
<span class="sr-only">Toggle Navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a href="#" class="navbar-brand">My Institute</a>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav navbar-right">
<li class="active"><a href="home">HOME</a>
<li class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown">COURSES<b class="caret"></b ></a>
<ul class="dropdown-menu" width="500px">
<%
ArrayList<String> catList=CourseDAO.getCourseCategories();
for(int i=0;i<catList.size();i++){ %>
<li class="dropdown-header"><%=catList.get(i) %></li>
<%
ArrayList<String> courseList=CourseDAO.getCoursesByCategory(catList.get(i));
for(int j=0;j<courseList.size();j++){ %>
<li><a href="courseDetail.jsp?course_name=<%= courseList.get(j) %>"><%=courseList.get(j) %></a></li>
<%}} %>
</ul>
</li>



<% 
if(session.getAttribute("login")!=null && session!=null){
 String email=(String)session.getAttribute("email");
 out.print("<li class='dropdown'>"+
		 "<a class='dropdown-toggle' data-toggle='dropdown'>"+email+"<b class='caret'></b ></a>"+
		 "<ul class='dropdown-menu' width='500px'>"+
		"<li><a href='"+session.getAttribute("user").toString()+"-dashboard'>DASHBOARD</a>"+
		 "<li><a href='logout'>LOGOUT</a>"+
		 "</ul>");
 }else{
  %>

<li class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown">LOGIN/REGISTER<b class="caret"></b ></a>
<ul class="dropdown-menu" width="500px">
<li><a href="student-login">STUDENT</a>
<li><a href="login">STAFF</a></li>
<li><a href="login">ADMIN</a>
</ul>
</li>

<%} %>





<li><a href="about.jsp">ABOUT</a>
</ul>
</div>
</div>
</nav>
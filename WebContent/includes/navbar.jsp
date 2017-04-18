<%@page import="java.util.ArrayList"%>
<%@page import="generalDAO.CourseDAO"%>
<%@page import="generalDAO.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- navbar start -->
	<header>		
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navigation">
				<div class="container">					
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<div class="navbar-brand">
							<a href="home"><h1><span>Learning</span>System</h1></a>
						</div>
					</div>
					<br>
					
					<div class="navbar-collapse collapse " style="float:right">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="home" class="active">Home</a></li>
<li class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown" href="#">Courses<b class="caret"></b ></a>
<ul class="dropdown-menu" width="500px">
<%
ArrayList<String> catList=CategoryDAO.getCourseCategories();
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
		 "<a class='dropdown-toggle' data-toggle='dropdown' href='#'>"+email+"<b class='caret'></b ></a>"+
		 "<ul class='dropdown-menu' width='500px'>"+
		"<li ><a href='"+session.getAttribute("user").toString()+"-dashboard'>DASHBOARD</a>"+
		 "<li><a href='logout'>LOGOUT</a>"+
		 "</ul>");
 }else{
  %>

<li class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown" href="#">LOGIN/REGISTER<b class="caret"></b ></a>
<ul class="dropdown-menu" width="500px">
<li role="presentation"><a href="student-login">STUDENT</a>
<li role="presentation"><a href="staff-login">STAFF</a></li>
<li role="presentation"><a href="admin-login">ADMIN</a></li>
</ul>
</li>

<%} %>
<li role="presentation" ><a href="about">ABOUT</a></li>	
					
					
												
							</ul>
							
						
						
						</div>
					</div>						
				</div>
			</div>	
		</nav>		
	</header>



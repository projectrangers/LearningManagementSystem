<%@page import="generalDAO.CategoryDAO"%>
<%@page import="pojo.Courses"%>
<%@page import="java.util.ArrayList"%>
<%@page import="generalDAO.CourseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin</title>

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
				<li><a href="admin">Dashboard</a></li>	
				<li>Staff Registration</li>			
			</div>		
		</div>	
	</div>
<% CourseDAO dao=new CourseDAO();
ArrayList<Courses> list=dao.getCourses();
%>
<div class="container">
<div class="col-sm-8 col-sm-offset-2">
<form action="regSuccess" method="POST" role="form" class="contactForm">
<h2>STAFF REGISTRATION</h2>
<div class="form-group">
<select class="form-control" name="preference">
<option>---Select Courses Preference----</option>
<% for(int i=0;i<list.size();i++){ %>
<option><%=list.get(i).getCourse_name() %></option>
<%} %>
</select>
</div>

<div class="form-group">
<input class="form-control" required type="text" name="name" placeholder="enter full name">
</div>
<div class="form-group">
<input class="form-control" required type="tel" name="mobile" placeholder="enter Mobile number" maxlength="10">
</div>
<div class="form-group">
<input class="form-control" required type="email" name="email" placeholder="enter email address">
</div>
<div class="form-group">
<input class="form-control" required type="password" name="password" placeholder="enter password">
</div>
<div class="form-group">
<input class="form-control" required type="hidden" name="role" value="staff">
</div>
<div class="form-group">
<input class="btn btn-primary" required type="submit" value="Register">
</div>
</form>
</div>
</div>
<footer>
		<div class="footer navbar-fixed-bottom">
			<jsp:include page="../includes/footer.jsp" />
		</div>
	</footer>
	
   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-2.1.1.min.js"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>  
	<script src="js/wow.min.js"></script>
	<script src="js/functions.js"></script>
	
</body>
</html>
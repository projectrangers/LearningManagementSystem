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
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Category</title>

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
				<li>Add Category</li>
							
			</div>		
		</div>	
</div>

<div class="container">
 <div class="row contact-wrap"> 
               
                <div class="col-sm-6 col-sm-offset-3">
             <br>  <br>  <br>
             <h2>Add New Category</h2>
        <span style="color:red">     <s:fielderror name="message"></s:fielderror> </span>
<form role="form" class="contactForm" action="addCategory" method="post" >
  <strong> 
<div class="form-group">
<input class="form-control"  type="text" name="name" required="required" placeholder="category name">
</div>
<div class="form-group">
<select class="form-control"  required="required" name="isactive">
<option value="y">Keep ACTIVE</option>
<option value="n">Keep DEACTIVE</option>
</select>
</div>
<div class="form-group">
<button class="btn-primary btn">SAVE</button>
</div>
</strong>

</form>

<a href="categoryList">Back to category List</a>
</div>
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
    <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
	<script src="js/functions.js"></script>
    <script src="contactform/contactform.js"></script>
    
</body>
</html>

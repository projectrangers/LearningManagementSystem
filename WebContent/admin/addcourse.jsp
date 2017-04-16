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
    <title>Student Registration</title>

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
				<li>Add New Course</li>				
			</div>		
		</div>	
</div>
<% ArrayList<String> l=CategoryDAO.getCourseCategories();%>
<div class="container">
<div class="col-sm-6 col-sm-offset-3">
<span style="color:red"><s:fielderror name="message"></s:fielderror></span>
<form action="add" method="post" role="form" class="contactForm">
<h2 >Add New Course</h2>
<strong>
<div class="form-group">
<input placeholder="Enter Course name" class="form-control" name="courseName" type="text" required>
</div>

<div class="form-group">
<h5>CATEGORY:</h5>
<select class="form-control"  name="course_category" required>
<% 
for(int j=0;j<l.size();j++){%>
<option ><%=l.get(j).toUpperCase()%></option>
<%} %>
</select>
</div>

<div class="form-group">
<input type="number" placeholder="TOTAL SEAT" class="form-control" name="total"  required>
</div>

<div class="form-group">
<input type="number" placeholder="AVAILABLE SEAT" class="form-control" name="available" required>
</div>

<div class="form-group">
<h5>IS SEAT AVAILABLE?</h5>
<select class="form-control" name="is_available" required>
<option value="Y">YES</option>
<option value="N">NO</option>
</select>
</div>


<div class="form-group">
<input type="number" placeholder="COURSE DURATION" class="form-control" name="duration" required>
</div>


<div class="form-group">
<input type="number" placeholder="COURSE FEE" class="form-control" name="fee" required >
</div>

</strong>
<input class="btn btn-warning" type="submit" value="ADD">
</form>

</div>
</div>

<br><br>
<footer>
		<div class="footer">
			<div class="container">
				<div class="social-icon">
					<div class="col-md-4">
						<ul class="social-network">
							<li><a href="#" class="fb tool-tip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="twitter tool-tip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="gplus tool-tip" title="Google Plus"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#" class="linkedin tool-tip" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#" class="ytube tool-tip" title="You Tube"><i class="fa fa-youtube-play"></i></a></li>
						</ul>	
					</div>
				</div>
				
				<div class="col-md-4 col-md-offset-4">
					<div class="copyright">
						&copy; Company Theme. All Rights Reserved.
                        <div class="credits">
                            <!-- 
                                All the links in the footer should remain intact. 
                                You can delete the links only if you purchased the pro version.
                                Licensing information: https://bootstrapmade.com/license/
                                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Company
                            -->
                            <a href="https://bootstrapmade.com/free-business-bootstrap-themes-website-templates/">Business Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                        </div>
					</div>
				</div>						
			</div>
			<div class="pull-right">
				<a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
			</div>
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
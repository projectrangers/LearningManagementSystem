<%@page import="pojo.Courses"%>
<%@page import="generalDAO.CourseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Detail</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" />
  </head>
  <body>
<jsp:include page="includes/navbar.jsp" />
<% 
Courses c=CourseDAO.getCourseDetailByName(request.getParameter("course_name"));
%>
<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">							
				<li><a href="home">Home</a></li>
				<li>courses</li>	
				<li><%=c.getCourse_name() %></li>				
			</div>		
		</div>	
</div>


<div class="container">
<h1 class="list-group-item-info">COURSE DETAIL</h1>
<div class="table-responsive">
<table class="table">
<thead class=" btn-primary">

<tr>
<th>NAME</th>
<th>CATEGORY</th>
<th>TOTAL SEAT</th>
<th>AVAILABLE SEAT</th>
<th>DURATION</th>
<th>FEE</th>
<th>STATUS</th>
<th>LINK</th>
</tr>
</thead>
 <tbody class="btn-info">
<tr>
<td><%=c.getCourse_name().toUpperCase() %></td>
<td><%=c.getCategory().toUpperCase() %></td>
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
</tbody>
</table>
</div>
</div>


<br><br><br><br><br><br><br><br><br><br><br>
<a class="btn btn-warning" href="catalog"><H4>OTHER AVAILABLE COURSES</H4></a>


<footer>
		<div class="footer navbar-fixed-bottom">
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
	<script src="js/functions.js"></script>
	
</body>
</html>
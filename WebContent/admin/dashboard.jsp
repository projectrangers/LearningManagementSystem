<%@page import="staff.DAO.StaffProfileDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="student.dao.StudentDAO"%>
<%@page import="generalDAO.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
    <%@ page import="generalDAO.CourseDAO" %>
    <%@page import="pojo.Courses" %>
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
				<li>Dashboard</li>				
			</div>		
		</div>	
	</div>

<div class="container">
<%
if(session.getAttribute("email")!=null && session!=null){
	if(session.getAttribute("user").equals("admin")){
		%>

<div class="container">
  <h2>ADMIN PANEL</h2>
  <ul class="nav nav-tabs nav-justified btn-warning">
    <li class="active"><a data-toggle="tab" href="#student">STUDENT</a></li>
    <li><a data-toggle="tab" href="#staff">STAFF</a></li>
    <li><a data-toggle="tab" href="#category">CATEGORY</a></li>
    <li><a data-toggle="tab" href="#courses">COURSES</a></li>
      <li><a data-toggle="tab" href="#account">CHANGE PASSWORD</a></li>
   
  </ul>
 <!--                            ACCOUNT                              -->
  <div class="tab-content">
  
  
  <div id="student" class="tab-pane fade in active container">
    <h4>STUDENTS</h4>
 <div class="row">     
<div class=" col-sm-3">    <a class="btn btn-primary" href="catalog">Add Student </a></div>
<div class=" col-sm-3">   <a class="btn btn-primary" href="showStudentList">Show Students</a><span class="badge"><%=StudentDAO.countStudent() %></span></div>  
   </div>      
 </div>

    
    
   
  
  
  
    <div id="account" class="tab-pane fade">
      <h4 >ACCOUNT SETTING</h4>
      <p >CHANGE PASSWORD</p>
      <s:if test="hasActionMessages()">
   <div class="welcome">
  <span style="color:red">    <s:actionmessage/></span>
   </div>
</s:if>
<span style="color:red"><s:fielderror name="mesage"></s:fielderror></span>
<div class=" btn-primary col-sm-6">
<br>
      <form action="change-password" method="post">
      <div class="form-group">
      <input class="form-control" type="password" name="oldPassword" placeholder="old password">
    </div> 
    <div class="form-group">
     <input class="form-control" type="password" name="newPassword" placeholder="new password">
      </div>
      <input class="btn btn-primary" type="submit" value="change" onclick="return confirm('Are you sure?')">
      </form>
  </div>    
    </div>
    
    
    <div id="staff" class="tab-pane fade container">
    <h4>STAFF</h4>
      
 <div class=" col-sm-3">   <a href="addStaff">   <button type="button" class="btn btn-primary" >Add Staff</button> </a></div>
 <div class=" col-sm-3">       <a href="showStaff"><button type="button" class="btn btn-primary">Show Staff </button></a><span class="badge"><%=StaffProfileDAO.countStaff() %></span> </div>      
    </div>
    
    
    
    
   
    
    <div id="category" class="tab-pane fade">
      <h4>CATEGORY</h4>
  
 <div class=" col-sm-4">    <a href="addnewcategory"><button type="button" class="btn btn-primary">Add New Category<span class="badge"></span></button></a>  </div>
  <div class="col-sm-4"> <a href="categoryList"><button type="button" class="btn btn-primary">Show Categories </button></a><span class="badge"><%=CategoryDAO.countCategory() %></span> </div>           
           </div>
    
     <div id="courses" class="tab-pane fade">
      <h4>COURSES</h4>
    
    <div class="col-sm-4">  <a href="addnewcourse"><button type="button" class="btn btn-primary">Add new Course<span class="badge"></span></button></a>  </div>
      <div class=" col-sm-4">      <a href="courseList"><button type="button" class="btn btn-primary">Show Courses</button></a>  <span class="badge"><%=CourseDAO.countCourse() %></span> </div> 
       <%-- <s:a action="addnewcourse">Add New Course</s:a> --%>
      
     
    </div>
    
    
    
    
    
    
    
    
  </div>
</div>









<%}else
response.sendRedirect("error.jsp?message=Sorry You are Not authorized to view this Page");
}else
	response.sendRedirect("student-login?message=Please Login First"); 
%>

</div>
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
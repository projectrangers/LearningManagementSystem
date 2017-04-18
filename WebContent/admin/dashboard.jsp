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
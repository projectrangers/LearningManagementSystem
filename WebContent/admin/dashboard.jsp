
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
    <%@ page import="generalDAO.CourseDAO" %>
    <%@page import="pojo.Courses" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>DASHBOARD</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" >
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<link href="../css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
<jsp:include page="../includes/navbar.jsp" /> <br><br>
<div class="container">
<%
if(session.getAttribute("email")!=null && session!=null){
	if(session.getAttribute("user").equals("admin")){
		%>

<div class="container">
  <h2>ADMIN PANEL</h2>
  <ul class="nav nav-tabs">
   <li class="active"><a data-toggle="tab" href="#account">ACCOUNT</a></li>
    <li><a data-toggle="tab" href="#student">STUDENT</a></li>
    <li><a data-toggle="tab" href="#staff">STAFF</a></li>
    <li><a data-toggle="tab" href="#category">CATEGORY</a></li>
    <li><a data-toggle="tab" href="#courses">COURSES</a></li>
      
  </ul>
 <!--                            ACCOUNT                              -->
  <div class="tab-content">
    <div id="account" class="tab-pane fade in active">
      <h3><u>Account Settings</u></h3>
      <p>CHANGE PASSWORD</p>
      <s:if test="hasActionMessages()">
   <div class="welcome">
      <s:actionmessage/>
   </div>
</s:if>
<s:fielderror name="mesage"></s:fielderror>
      <form action="change-password" method="post">
      <input type="password" name="oldPassword" placeholder="old password">
      <input type="password" name="newPassword" placeholder="new password">
      <input type="submit" value="change" onclick="return confirm('Are you sure?')">
      </form>
      
    </div>
    
    
    
    <div id="student" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    
    
    <div id="staff" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    
    <div id="category" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
    
     <div id="courses" class="tab-pane fade">
      <h3>Courses</h3>
      <a href="courseList">show courses</a>
      <s:a action="addnewcourse">Add New Course</s:a>
      
     
    </div>
    
    
    
    
    
    
    
    
  </div>
</div>









<%}else
response.sendRedirect("../error.jsp?message=Sorry You are Not authorized to view this Page");
}else
	response.sendRedirect("student-login?message=Please Login First"); 
%>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>
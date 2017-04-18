
<%@page import="generalDAO.CourseDAO"%>
<%@page import="pojo.Category"%>
<%@page import="generalDAO.CategoryDAO"%>
<%@page import="pojo.Courses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Categories</title>

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
				<li>Show Categories</li>
							
			</div>		
		</div>	
</div>


<% if(session.getAttribute("email")!=null && session!=null){
	  if(!session.getAttribute("user").equals("admin")){
		response.sendRedirect("error?message=Sorry!!You are not authorized to view this page");
       }}else
      if(session.getAttribute("login")==null)
	    response.sendRedirect("error?message=Sorry!!Please login First!");
%>

<div class="container">
   <div class="row">
		<div class="col-md-8">
             <h1 class="btn-primary">Available Categories</h1>
                  <span style="color:red"><s:fielderror name="message"></s:fielderror></span>
<ul class="list-group">
 <% ArrayList<Category> list=CategoryDAO.getCategories();
 for(int i=0;i<list.size();i++){
 %>
 <li class="list-group-item"> 
 <div class="row ">

 <form action="editSuccess" method="post"> 
  <div class="col-sm-4 ">
 <input class="btn btn-info" readOnly="readOnly" name="name" type="text" value="<%=list.get(i).getName().toString().toUpperCase() %>" id="cat<%=i %>" >
  </div>
  <div class="col-sm-4">
  <%if(list.get(i).getIs_Available().toString().equalsIgnoreCase("y")){
   %>
	  <button class="btn btn-success " name="isactive" value="N" onclick='return confirm("do You really want to Deactivate")' >DEACTIVE</button>
	  <%
    } else{ %>
    	<button class="btn  btn-success " name="isactive" value="Y" onclick='return confirm("do You really want to Activate")'>ACTIVE</button>
 <% }%> 
</div>
  </form> 


<form action="deletecat" method="post">
 <div class="col-sm-4">
<input type="hidden" name="name" value="<%=list.get(i).getName().toString().toUpperCase() %>">
<button class="btn  btn-danger " onclick='return confirm("do You really want to Deactivate")' >DELETE</button>
</div>
</form>

</div>
</li>
</ul>
                         
 <%} %>

 

<br><br><br><br> <a class="btn btn-primary" href="admin-dashboard">Back To Dashboard</a>
</div>

</div>


 </div>




<footer>
		<div class="footer navbar-fixed-bottom">
				<jsp:include page="../includes/footer.jsp" />
		</div>
	</footer>
	  
	  
	  <script>

function setEnable(id){
	document.getElementById(id).readOnly=false;
}
function makeReadOnly(id){
	document.getElementById(id).readOnly=true;
}
function activatesave(id){
	document.getElementById(id).disabled=false;
	  }
</script>
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
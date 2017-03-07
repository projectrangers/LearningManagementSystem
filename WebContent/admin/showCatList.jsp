
<%@page import="generalDAO.CourseDAO"%>
<%@page import="pojo.Category"%>
<%@page import="generalDAO.CategoryDAO"%>
<%@page import="pojo.Courses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Categories</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>

<body>
<jsp:include page="../includes/navbar.jsp" /> <br><br><br><br>

<% if(session.getAttribute("email")!=null && session!=null){
	  if(!session.getAttribute("user").equals("admin")){
		response.sendRedirect("error?message=Sorry!!You are not authorized to view this page");
       }}else
      if(session.getAttribute("login")==null)
	    response.sendRedirect("error?message=Sorry!!Please login First!");
%>

<div class="container">
   <div class="row">
		<div class="col-md-6 offset6">
             <h1>Available Categories</h1>
                  <s:fielderror name="message"></s:fielderror>
<ul class="list-group">

 <% ArrayList<Category> list=CategoryDAO.getCategories();
 for(int i=0;i<list.size();i++){
 %>
 <form action="editSuccess" method="post"> 
 <li class="list-group-item">
 <input readOnly="readOnly" name="name" type="text" value="<%=list.get(i).getName().toString().toUpperCase() %>" id="cat<%=i %>" >
  <%if(list.get(i).getIs_Available().toString().equalsIgnoreCase("y")){
	  %>
	  <button class="btn btn-success btn-xs" name="isactive" value="N" onclick='return confirm("do You really want to Deactivate")' >DEACTIVE</button>
	  <%
    } else{ %>
    	<button class="btn btn-success btn-xs" name="isactive" value="Y" onclick='return confirm("do You really want to Activate")'>ACTIVE</button>
 <% }%> 
             </li>   </form>                   
 <%} %>

 

</ul>
</div>
</div>
</div>
 <a href="admin-dashboard">Back To Dashboard</a>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Success</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
<jsp:include page="../includes/navbar.jsp" /> <br><br><br><br>

 <h1>SUCCESSFULLY REGISTERD</h1>
  DEFAULT PASSWORD IS :12345
  <br><h5>IMPORTANT:</h5>PLEASE LOGIN AND CHANGE YOUR PASSWORD!!!!!
<% 

if(session.getAttribute("email")!=null && session!=null){
	if(session.getAttribute("user").equals("admin")){

  %>
 
  <h2><a href="catalog">ADD MORE</a></h2>
  <%}}%>
  


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
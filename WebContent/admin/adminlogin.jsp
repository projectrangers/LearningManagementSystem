<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% if(session.getAttribute("login")!=null){
	RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
	rd.forward(request, response);
} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>StudentLogin</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
<jsp:include page="../includes/navbar.jsp" /><br><br><br><br>
<s:fielderror name="message"></s:fielderror>
<form action="adminlogin" method="post">
Email:<input type="email" name="email"> 
Password<input type="password" name="password">
<input type="submit" value="Login"/>
</form>






<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
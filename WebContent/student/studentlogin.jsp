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
<link rel="stylesheet" href="css/general.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Studentlogin</title>
</head>
<body>
<s:fielderror name="message"></s:fielderror>
<form action="studentlogin" method="post">
Email:<input type="email" name="email"> 
Password<input type="password" name="password">
<input type="submit" value="Login"/>
</form>

<s:a href="catalog">Register Here</s:a>

</body>
</html>
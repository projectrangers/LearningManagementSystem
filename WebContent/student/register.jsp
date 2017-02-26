<%@page import="xtra.EnrollmentFor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
<h1>ENROLLMENT FOR:<%= EnrollmentFor.getName()%></h1>
<h2>Amount to paid:Rs.<%=EnrollmentFor.getFee() %></h2>
<form action="regprocess" method="post">
<s:fielderror></s:fielderror>
NAME:<input type="text" name="name" required="required"></input><br>
DOB<input type="date" name="dob" required="required"></input><br>
COURSE<input readonly="readonly" type="text" name="course"value="<%=EnrollmentFor.getName()%>"></input><br>
qualification<input type="text" name="qualification" ></input><br>
mobile<input type="text" name="mobile" ></input><br>
EMAIL<input type="email" name="email" required="required"></input><br>
<h2>Payment Information:</h2>
<input type="radio" name="paymethod" value="dd" >DEMAND DRAFT
<input type="radio" name="paymethod" value="chek" >CHEK
<input type="radio" name="paymethod" value="cash">CASH<br>

DDNO<input type="text" name="ddno" ></input><br>
check no.<input type="text" name="chekno" ></input><br>
Amount<input type="number" name="depamount" maxlength="6"></input>

<input type="submit"></input>
</form>

<a href="home">HOME</a>
</body>
</html>
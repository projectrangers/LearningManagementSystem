<%@page import="xtra.EnrollmentFor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags"  %>
    <% if((request.getAttribute("name")==null)||request.getAttribute("name")==""){
	 RequestDispatcher rd=request.getRequestDispatcher("catalog");
	rd.forward(request, response); 
	//response.sendRedirect();
} %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Registration</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" />
	<style>
	.form-control{
	font-weight:bold;}
	
	</style>
  </head>
  <body>
<jsp:include page="../includes/navbar.jsp" />
<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">							
				<li><a href="home">Home</a></li>
				<li>Admin</li>
				<li><a href="admin-dashboard">Dashboard</a></li>
				<li>Add Student</li>
				<li><a href="catalog">Catalog</a></li>
				<li>Register|<%= EnrollmentFor.getName()%></li>					
			</div>		
		</div>	
</div>
<div class="container">
<h2 ><span class="btn-primary"><%= EnrollmentFor.getName().toUpperCase()%></span></h2>
<h2 class="btn btn-danger">Amount to be paid: Rs.<%=EnrollmentFor.getFee() %></h2>
 <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                 <center>    <h5 style="color:red"><s:fielderror name="message"></s:fielderror></h5></center>
<div class="col-sm-6 col-sm-offset-3 btn-primary">
<form action="regprocess" method="post" role="form" class="contactForm">
<h2 class="btn-info">General Information</h2>
  <div class="form-group">
<input class="form-control" readonly="readonly" type="text" name="course"value="<%=EnrollmentFor.getName()%>"></input>
</div>


 <div class="form-group">
<input placeholder="Enter Full Name" class="form-control"  type="text" name="name" required="required"></input>
</div>

 <div class="form-group">
<input placeholder="Date Of Birth" class="form-control"  type="date" name="dob" required="required"></input>
 </div>
 

<div class="form-group">
<input placeholder="Enter your Qualification" class="form-control"  type="text" name="qualification" ></input>
</div>

<div class="form-group">
<input placeholder="Enter Mobile Number" class="form-control"  type="tel" maxlength="10" name="mobile" ></input>
</div>

<div class="form-group">
<input placeholder="Email Address" class="form-control"  type="email" name="email" required="required"></input>
</div>

<div class="form-group">
<input placeholder="Create Password" class="form-control"  type="password" name="password" required="required"></input>
</div>


<h2 class="btn-info">Payment Information:</h2>
<div class="btn-warning">
<div class="radio-inline">
<label><input onChange="handleChange(this.id);"  type="radio" name="paymethod" value="dd" >DEMAND DRAFT</label>
</div>
<div class="radio-inline">
<label><input onChange="handleChange(this.id);"  type="radio" name="paymethod" value="chek" >CHEK</label>
</div>
<div class="radio-inline">
<label><input onChange="handleChange(this.id);"  type="radio" name="paymethod" value="cash">CASH</label>
</div>
</div>
<div class="form-group">
<input placeholder="Enter DD NUMBER" class="form-control"  type="text" name="ddno" ></input>
</div>
<div class="form-group">
<input placeholder="Enter CHEK Number" class="form-control" type="text" name="chekno" ></input><br>
</div>
<div class="form-group">
<input placeholder="Enter Amount Deposited at this time" class="form-control" type="number" name="depamount" maxlength="6"></input>
</div>
<div class="form-group">
<input class="btn btn-info" type="submit"></input>
</div>
</form>
</div>

</div>
<br><br>
</div>


<footer>
		<div class="footer ">
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
    <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
	<script src="js/functions.js"></script>
    <script src="contactform/contactform.js"></script>
    
</body>
</html>
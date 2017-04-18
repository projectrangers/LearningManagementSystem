<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Success</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" />
	<style>
	.lbl{
	font-weight:bold;
	}
	</style>
  </head>
  <body>
	<jsp:include page="../includes/navbar.jsp" />

	<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">							
				<li><a href="home">Home</a></li>
				<li>STAFF</li>
				<li>REGISTRATION</li>
			    <li>SUCCESS</li>
						
			</div>		
		</div>	
	</div>
	<br>

 <h1>SUCCESSFULLY REGISTERD</h1>

 
  <h2><s:a action="stafflogin">Go to Dashboard</s:a></h2>
  


<footer>
		<div class="footer navbar-fixed-bottom">
	<jsp:include page="../includes/footer.jsp" />
		
<footer>


</body>
</html>
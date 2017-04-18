<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% if(session.getAttribute("login")!=null){
	 RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
	rd.forward(request, response); 
	//response.sendRedirect();
} %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Login</title>

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
				<li>Student</li>
				<li>Login</li>				
			</div>		
		</div>	
	</div>
	<br><br><br>

	
	<section id="contact-page">
        <div class="container">
            <div class="center">        
                <h2>STUDENT LOGIN</h2>
                
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <div class="col-md-6 col-md-offset-3">
                   <s:fielderror style="color:red" name="message"></s:fielderror>
<%if(request.getParameter("message")!=null) out.print("<strong style='color:red'>"+request.getParameter("message")+"</strong>");  %>


                    <form action="student" method="post" role="form" class="contactForm">
                          
                            <div class="form-group">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-msg="Please enter a valid email" />
                                    <div class="validation"></div>
                            </div>
                            <div class="form-group">
                                    <input type="password" class="form-control" name="password" id="email" placeholder="Enter Password" data-msg="Please enter a valid password" />
                                    <div class="validation"></div>
                            </div>
                           
                        <div class="text-center"><button type="submit" name="submit" class="btn btn-primary btn-lg" required="required">Log In</button></div>
                    </form> 
                    
<s:a action="catalog">Register Here</s:a>
<span style="float:right"><s:a href="staff-login">Not Student?</s:a></span>                      
                </div>
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->
	<br><br><br><br><br><br>
	<footer>
		<div class="footer">
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
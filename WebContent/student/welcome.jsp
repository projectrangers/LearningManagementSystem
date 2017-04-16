<%@page import="pojo.StudentNotification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="student.dao.StudentDAO"%>
<%@page import="pojo.Student"%>
<jsp:useBean id="student" class="pojo.Student"/>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin</title>

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
	.welcome{
	
	color:red;
	font-weight:bold;}
	
	</style>
  </head>
  <body>
	<jsp:include page="../includes/navbar.jsp" />

	<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">							
				<li><a href="home">Home</a></li>
				<li>STUDENT</li>
				<li>PROFILE</li>
						
			</div>		
		</div>	
	</div>
	<br>
	
	<% 
ArrayList<Student> list;

if(session.getAttribute("email")!=null && session!=null){
	if(session.getAttribute("user").equals("student")){
String email=(String)session.getAttribute("email");
   //out.print("LoggedIn: "+email); 
   StudentDAO dao=new StudentDAO();
   list=dao.getStudentData(email); 
  
  %>

<div class="container">
  <ul class="nav nav-tabs btn-warning  nav-justified">
    <li class="active"><a data-toggle="tab" href="#profile">PROFILE</a></li>
     <li><a data-toggle="tab" href="#course">COURSE</a></li>
      <li><a data-toggle="tab" href="#payment">PAYMENT INFO</a></li>
       <li><a data-toggle="tab" href="#message">MESSAGE</a></li>
       <li><a data-toggle="tab" href="#password">CHANGE PASSWORD</a></li>
   
  </ul>
  

 <!--                            ACCOUNT                              -->
  <div class="tab-content">
     
  <div id="profile" class="tab-pane fade in active container">
   
  <h3>PROFILE</h3>
  <div class="row">
 <div class="col-sm-2 btn-info">
 <h4>ID:</h4>
  </div>
   <div class="col-sm-2 btn-info">
 <h4> <% out.print(list.get(0).getStudent_id()); %></h4>
  </div>
  </div>

 <div class="row ">
 <div class="col-sm-2 btn-info">
<h4>NAME:</h4>
 </div>
   <div class="col-sm-2 btn-info">
 <h4><% out.print(list.get(0).getName().toUpperCase()); %></h4>
 </div>
 </div>
 
 <div class="row">
 <div class="col-sm-2 btn-info">
 <h4>REGISTRED ON:</h4>
</div>

 <div class="col-sm-2 btn-info">
 <h4><% out.print(list.get(0).getRegistered_on()); %></h4>
</div>
</div>
 
  <div class="row ">
 <div class="col-sm-2 btn-info">
  <h4>DOB:</h4>
 </div>
  <div class="col-sm-2 btn-info">
  <h4><% out.print(list.get(0).getDob()); %></h4>
 </div>
 </div>
  <div class="row ">
 <div class="col-sm-2 btn-info">
  <h4>QUALIFIACATION:</h4>
 </div>
   <div class="col-sm-2 btn-info">
  <h4><% out.print(list.get(0).getQualification()); %></h4>
 </div>
 </div>
  <div class="row ">
 <div class="col-sm-2 btn-info">
  <h4>MOBILE:</h4>
 </div>
   <div class="col-sm-2 btn-info">
  <h4><% out.print(list.get(0).getMobile()); %></h4>
 </div>
 </div>
 <div class="row ">
 <div class="col-sm-2 btn-info">
  <h4>EMAIL:</h4>
 </div>
  <div class="col-sm-2 btn-info">
  <h4><% out.print(list.get(0).getEmail()); %></h4>
 </div>
 </div>
 <div class="row ">
 <div class="col-sm-2 btn-info">
  <h4>ACTIVE:</h4>
 </div>
   <div class="col-sm-2 btn-info">
  <h4><% out.print(list.get(0).getIsActive()); %></h4>
 </div>
 </div>

  </div>
  






  <div id="course" class="tab-pane fade in  container">
   
  <h3>COURSE</h3> 
  

  
  <div class="row">
 <div class="col-sm-2 btn-info">
 <h4>COURSE CAT:</h4>
</div>
 <div class="col-sm-2 btn-info">
 <h4><% out.print(list.get(0).getCourse_category());%></h4>
</div>
</div>
  
  
  <div class="row">
 <div class="col-sm-2 btn-info"> 
 <h4>COURSE-NAME:</h4>
</div>
 <div class="col-sm-2 btn-info"> 
 <h4><% out.print(list.get(0).getCourse_enrolled()); %></h4>
</div>
</div>





<div class="row">
 <div class="col-sm-2 btn-info">
 <h4>DURATION:</h4>
</div>
 <div class="col-sm-2 btn-info">
 <h4><% out.print(list.get(0).getCourse_duration());%></h4>
</div>
</div>



<div class="row">
 <div class="col-sm-2 btn-info">
 <h4>COURSE FEE:</h4>
</div>
 <div class="col-sm-2 btn-info">
 <h4>Rs.<% out.print(list.get(0).getCourse_fee());%></h4>

</div>
</div>
</div>


  
  <div id="payment" class="tab-pane fade in  container">
   <h3>PAYMENT INFO</h3> 
   
   
<div class="row">
 <div class="col-sm-2 btn-info">  
 <h4>Paid Amount </h4>
 </div>
  <div class="col-sm-2 btn-info">  
<h4><%out.print(list.get(0).getAmountpaid());%></h4>
</div>
 </div>
   
   
 <div class="row">
 <div class="col-sm-2 btn-info">  
 <h4> Mode of payment:</h4>
  </div>
  <div class="col-sm-2 btn-info">  
 <h4> <% out.print(list.get(0).getPaymentmethod().toUpperCase());%></h4>
  </div>
</div>



 <div class="row">
<%
if(!list.get(0).getPaymentmethod().equals("cash")){
   if(list.get(0).getPaymentmethod().equals("dd")){
	   out.print("<div class='col-sm-2 btn-info'><h4>DDNO:<h4></div>"+" <div class='col-sm-2 btn-info'> <h4>"+list.get(0).getDdNo()+"</h4></div>");
   }else
	   out.print("<div class='col-sm-2 btn-info'><h4>chek no.</h4></div>"+"<div class='col-sm-2 btn-info'><h4>"+list.get(0).getChekNo()+"<h4></div>");
}
%>
 </div> 
 
 
 
<div class="row">
 <div class="col-sm-2 btn-info">   
<h4>Is Due?:</h4>
</div>
<div class="col-sm-2 btn-info">   
<h4><% out.print(list.get(0).getIsDue()); %></h4>
</div>
</div>




<div class="row">
 <div class="col-sm-2 btn-info">  
 <h4>Due Amount </h4>
 </div>
  <div class="col-sm-2 btn-info">  
<h4><%out.print(list.get(0).getDueAmount());%></h4>
</div>

 </div>
 </div>
  
  
  
 
  
  <div id="message" class="tab-pane fade in container">
   
   <div class="container">
    <h3>MESSAGE FROM ADMIN</h3><br><br>
  <% 
  ArrayList<StudentNotification> l=StudentDAO.getMessage(list.get(0).getStudent_id());
  if(l.size()>0){
for(int i=0;i<list.size();i++){
	%>
   <div class="row">
     <hr>	
     
  <a onclick="confirm('ARE YOU SURE?')" class=" btn btn-danger glyphicon glyphicon-floppy-remove" href="deleteMessage?id=<%=l.get(i).getIdPrimary() %>"></a><div class="btn-info btn"><% out.print(l.get(i).getTime());%></div> <div class="badge"><% out.print(l.get(i).getMessage());%></div>
	</div>
	<br><br>
	<%}}else{
		out.print("<h4>!!!No Message To Show!!<h4>");
	}%>
  </div>
  </div>
  
  
  
 <!-- <<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>> -->
  
  
  <div id="password" class="tab-pane fade in container col-sm-4">
   <h3>CHANGE PASSWORD</h3>
    <div class="welcome">
     <s:fielderror name="message"></s:fielderror>
  <s:if test="hasActionMessages()">
  <s:actionmessage/>
    </s:if> 
   </div>

 <form action="changePassword" method="post" >
 <input class="form-control" type="password" name="oldPassword" placeholder="old password"><br>
 <input class="form-control" type="password" name="newPassword" placeholder="new password">
 <input type="hidden" name="email" value="<% out.print(list.get(0).getEmail()); %>">
<input class="btn btn-primary" type="submit" onclick="return confirm('Are you sure?')">
</form>
 </div> 
 </div>
  
 <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>  -->










<%
} else 
	response.sendRedirect("error.jsp?message=Sorry You are Not authorized to view this Page");
} else 
  response.sendRedirect("student-login?message=Please Login First");  %>
 
 
 </div>
 <br><br><br><br><br><br><br>

<footer>
		<div class="footer navbar-fixed-bottom">
			<div class="container">
				<div class="social-icon">
					<div class="col-md-4">
						<ul class="social-network">
							<li><a href="#" class="fb tool-tip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="twitter tool-tip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="gplus tool-tip" title="Google Plus"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#" class="linkedin tool-tip" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#" class="ytube tool-tip" title="You Tube"><i class="fa fa-youtube-play"></i></a></li>
						</ul>	
					</div>
				</div>
				
				<div class="col-md-4 col-md-offset-4">
					<div class="copyright">
						&copy; Company Theme. All Rights Reserved.
                        <div class="credits">
                            <!-- 
                                All the links in the footer should remain intact. 
                                You can delete the links only if you purchased the pro version.
                                Licensing information: https://bootstrapmade.com/license/
                                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Company
                            -->
                            <a href="https://bootstrapmade.com/free-business-bootstrap-themes-website-templates/">Business Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                        </div>
					</div>
				</div>						
			</div>
			<div class="pull-right">
				<a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
			</div>
		</div>
	</footer>
	
   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-2.1.1.min.js"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>  
	<script src="js/wow.min.js"></script>
	<script src="js/functions.js"></script>
	
</body>
</html>
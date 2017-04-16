<%@page import="pojo.Student"%>
<%@page import="pojo.Staff"%>
<%@page import="staff.DAO.StaffProfileDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="student.dao.StudentDAO"%>
<%@page import="generalDAO.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
    <%@ page import="generalDAO.CourseDAO" %>
    <%@page import="pojo.Courses" %>
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
	</style>
  </head>
  <body>
	<jsp:include page="../includes/navbar.jsp" />

	<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">							
				<li><a href="home">Home</a></li>
				<li>STAFF</li>
				<li>DASHBOARD</li>
						
			</div>		
		</div>	
	</div>
	<br>
<div class="container">
<%!Staff staff;  %>

<%
if(session.getAttribute("email")!=null && session!=null){
	if(session.getAttribute("user").equals("staff")){
		%>
<% staff=StaffProfileDAO.getfullProfile(session.getAttribute("email").toString()); %>
<div class="container">
 <h3 class=" btn-primary">Staff DashBoard:<%=staff.getCourse_preference().toUpperCase()%></h3>
  <ul class="nav nav-tabs nav-justified btn-warning">
    <li class="active"><a data-toggle="tab" href="#profile">PROFILE</a></li>
     <li><a data-toggle="tab" href="#student">ALOTTED STUDENT</a></li>
   
  </ul>
 <!--                            ACCOUNT                              -->
  <div class="tab-content">
     
  <div id="profile" class="tab-pane fade in active container">
   
  <h3>PROFILE</h3>   
  
  <span style="color:red"><s:fielderror name="message"></s:fielderror></span>
	
	<div class="row">
<div class="col-sm-9 col-md-offset-2 btn-primary">
  <form role="form" action="update_profile" method="POST" >
 
 <div class="form-group ">
            <div class="row">
		        <div class="col-sm-3 lbl">Preferred Course</div>
                    <div class="col-sm-6">
			            <input readOnly name="preference" type="text" class="form-control" value="<%=staff.getCourse_preference()%>">
				   </div>
           </div>
</div> 
 
 
        <div class="form-group ">
            <div class="row">
		        <div class="col-sm-3 lbl">Name:</div>
                    <div class="col-sm-6">
			            <input name="name" type="text" class="form-control" value="<%=staff.getName() %>" >
				   </div>
           </div>
		</div> 
		
<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Email:</div>
                    <div class="col-sm-6">
			            <input readOnly name="email" type="email" class="form-control" value="<%=staff.getEmail() %>" >
				   </div>
           </div>
		</div> 
<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Mobile:</div>
                    <div class="col-sm-6">
			            <input name="mobile" type="tel" maxlength="10" class="form-control" value="<%= staff.getMobile()%>">
				   </div>
           </div>
</div> 

<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Qualification:</div>
                    <div class="col-sm-6">
			            <input name="qualification" type="text" class="form-control" value="<%= staff.getQualification()%>">
				   </div>
           </div>
</div> 

<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Experience(years):</div>
                    <div class="col-sm-6">
                  <input readOnly type="text" class="form-control" value="<%= staff.getExperience()%>">
				 <strong> Change:</strong>
			           <select name="experience" class="form-control">
			              <option value="Not choosen Yet">--SELECT ONE--</option>
			              <option>0-1</option>
			              <option>1-2</option>
			              <option>2-3</option>
			              <option>3-4</option>
			              <option>>4</option>
			              
			           </select>
				   </div>
           </div>
</div>


<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Address:</div>
                    <div class="col-sm-6">
			            <textarea name="address" class="form-control" >
			            <%=staff.getAddress() %>
			            </textarea>
				   </div>
           </div>
</div> 



<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Password(change)</div>
                    <div class="col-sm-6">
			            <input name="password" type="password" class="form-control" value="<%=staff.getPassword() %>" >
				   </div>
           </div>
</div> 	
		
	<input type="hidden" name="role" value="staff">	
	<input type="submit" value="Update" class="btn btn-info">
  </form> 
</div>
</div>
	<br><br><br>
</div>

   
         


  
    
    
    
    
<div id="student" class="tab-pane fade in container">

<h3><%out.print("STUDENTS ("+staff.getCourse_preference().toString().toUpperCase()+")"); %></h3> 
  <%
  String course=staff.getCourse_preference().toString();
  ArrayList<Student> list=StudentDAO.getStudentByCourse(course); %>
  <div class="container ">
  <div class="list-group col-sm-8 col-sm-offset-2">
  <% for(int i=0;i<list.size();i++){ %>

  <a class=" lbl btn-primary list-group-item" href="#" data-toggle="modal" data-target="#myModal<%=i %>" ><%=i+1 %>.  <%=list.get(i).getName().toString().toUpperCase() %> [SHOW DETAILS]</a> 

 
  

   
  <!-- Modal -->
  <div class="modal fade" id="myModal<%=i %>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><%=list.get(i).getName().toString().toUpperCase() %></h4>
        </div>
        <div class="modal-body">
          <p>
          <div class="well btn-primary">
         <form role="form" action="update_profile" method="POST">
 
<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Registered On:</div>
                    <div class="col-sm-6">
			            <input readOnly name="preference" type="text" class="form-control" value="<%=list.get(i).getRegistered_on() %>">
				   </div>
           </div>
</div>
<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Active:</div>
                    <div class="col-sm-6">
			            <input readOnly name="preference" type="text" class="form-control" value="<%=list.get(i).getIsActive() %>">
				   </div>
           </div>
</div> 

<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Qualification:</div>
                    <div class="col-sm-6">
			            <input readOnly name="preference" type="text" class="form-control" value="<%=list.get(i).getQualification() %>">
				   </div>
           </div>
</div>
<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Email:</div>
                    <div class="col-sm-6">
			            <input readOnly name="preference" type="text" class="form-control" value="<%=list.get(i).getEmail() %>">
				   </div>
           </div>
</div>
<div class="form-group">
            <div class="row">
		        <div class="col-sm-3 lbl">Mobile:</div>
                    <div class="col-sm-6">
			            <input readOnly name="preference" type="text" class="form-control" value="<%=list.get(i).getMobile() %>">
				   </div>
           </div>
</div> 
            </form>
 
          </div>
          
        
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
  
  
  
  
  <% } %>
  </div>
  </div>
  </div>   
   </div>
   </div>
   




<%}else
response.sendRedirect("../error.jsp?message=Sorry You are Not authorized to view this Page");
}else
	response.sendRedirect("student-login?message=Please Login First"); 
%>

</div>


<footer>
		<div class="footer">
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
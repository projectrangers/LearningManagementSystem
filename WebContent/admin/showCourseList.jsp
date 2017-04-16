
<%@page import="generalDAO.CourseDAO"%>
<%@page import="generalDAO.CategoryDAO"%>
<%@page import="pojo.Courses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>courses</title>

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
				<li>Admin</li>
				<li><a href="admin-dashboard">Dashboard</a></li>
				<li>Course List</li>
							
			</div>		
		</div>	
</div>

<% if(session.getAttribute("email")!=null && session!=null){
	  if(!session.getAttribute("user").equals("admin")){
		response.sendRedirect("error?message=Sorry!!You are not authorized to view this page");
       }}else
      if(session.getAttribute("login")==null)
	    response.sendRedirect("error?message=Sorry!!Please login First!");
%>


<div class="container">
  <h2>Available courses</h2>
             <span style="color:red">
                  <s:fielderror name="message"></s:fielderror></span>
   <div class="panel-group" id="accordion">
  
                                            
 <% ArrayList<Courses> course=CourseDAO.getCourses();
 ArrayList<String> l=CategoryDAO.getCourseCategories();
 for(int i=0;i<course.size();i++){
 %>  
 <div class="panel panel-default">
  <div class="panel-heading">
   
     
    <div class="col-sm-2">    <span class="badge"><%=course.get(i).getCategory() %></span>  </div> 
      <div class="col-sm-2"><a class="btn btn-info">    <%=course.get(i).getCourse_name().toUpperCase() %></a>
      </div> 
     <div class="col-sm-2">
     <a class="btn btn-danger" onclick="return confirm('Are you sure?')" href="deleteCourse?courseName=<%=course.get(i).getCourse_name()  %>">
        DELETE</a></div>
  
   <a class="btn btn-primary" data-toggle="collapse" data-parent="#accordion" href="#<%=i %>">
         EDIT</a>
        
   </div>    


                                                                                                                                                                      
<div id="<%=i %>" class="panel-collapse collapse">
<div class="panel-body">
<% Courses c=CourseDAO.getCourseDetailByName(course.get(i).getCourse_name().toString()); %>
<div class="container">
 <div class="row contact-wrap"> 
               
 <div class="col-sm-6 col-sm-offset-3">
             <h2>EDIT COURSE</h2>
        <span style="color:red">     <s:fielderror name="message"></s:fielderror> </span>
<form role="form" class="contactForm" action="editcourse" method="post" >
<div class="row">
<div class="col-sm-2">
<h5>COURSE NAME:</h5>
</div>
<div class="col-sm-4">
<div class="form-group">
<input class="form-control"  name="courseName" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave()" id="name<%=i%>" type="text" 
value="<%=c.getCourse_name() %>"/></div>
</div>
<%-- <div class="col-sm-4">
<a data-toggle="tooltip" title="click to edit" 
href="#" id="name<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a>
</div> --%>
</div>

<div class="row">

<div class="col-sm-2">
<h5>CATEGORY:</h5>
</div>

<div class="col-sm-4">
<div class="form-group">
<select class="form-control"   onchange="setcategoryvalue(this.id,<%=i%>)" id="category<%=i%>" disabled >
<% 
for(int j=0;j<l.size();j++){%>
<option><%=l.get(j).toUpperCase()%></option>
<%} %>
</select>
</div>
</div>
<div class="col-sm-4">
<div class="form-group">
<input class="form-control"  name="course_category" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave(<%=i%>)" id="category<%=i%>field" type="text" 
value="<%=c.getCategory() %>" />
</div>
</div>


<div class="col-sm-2">
<a data-toggle="tooltip" title="click to edit" 
href="#" id="category<%=i%>" onclick="setEnable(this.id)">
<i class="glyphicon glyphicon-edit"></i></a>
</div>
</div>

<div class="row">
<div class="col-sm-2">
<h5>TOTAL SEAT:</h5>
</div>

<div class="col-sm-8">
<div class="form-group">
<input class="form-control" name="total" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave(<%=i%>)" id="tot<%=i%>" type="number" 
value="<%=c.getTotal() %>"/>
</div>
</div>

<div class="col-sm-2">
<a data-toggle="tooltip" title="click to edit" 
href="#" id="tot<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a>
</div>
</div>

<div class="row">
<div class="col-sm-2">
<h5>AVAILABLE SEAT:</h5>.
</div>
<div class="col-sm-8">
<div class="form-group">
<input class="form-control" name="available" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave(<%=i%>)" id="av<%=i%>" type="number" 
value="<%=c.getAvailable() %>"/>
</div>
</div>
<div class="col-sm-2">
<a data-toggle="tooltip" title="click to edit" 
href="#" id="av<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a>
</div>
</div>

<div class="row">
<div class="col-sm-2">
<h5>IS AVAILABLE:</h5>
</div>

<div class="col-sm-4">
<div class="form-group">
<select class="form-control"  onchange="setIsAvalue(this.id,<%=i%>)" id="isavailable<%=i%>" disabled >
<option>Y</option>
<option>N</option>
</select>
</div>
</div>

<div class="col-sm-4">
<div class="form-group">
 <input class="form-control" name="is_available" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave(<%=i%>)" id="isavailable<%=i%>field" type="text" 
value="<%=c.getIsAvailable() %>"/>
</div>
</div>

<div class="col-sm-2">
<a data-toggle="tooltip" title="click to edit" 
href="#" id="isavailable<%=i%>" onclick="setEnable(this.id)">
<i class="glyphicon glyphicon-edit"></i></a>
</div>
</div>



<div class="row">
<div class="col-sm-2">
<h5>DURATION:</h5>
</div>
<div class="col-sm-8">
<div class="form-group">
<input class="form-control" name="duration" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave(<%=i%>)" id="dur<%=i%>" type="number" 
value="<%=c.getDuration() %>"/>
</div>
</div>
<div class="col-sm-2">
<a data-toggle="tooltip" title="click to edit" 
href="#" id="dur<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a>
</div>
</div>



<div class="row">
<div class="col-sm-2">
<h5>FEE:</h5>
</div>
<div class="col-sm-8">
<div class="form-group">
<input class="form-control" name="fee" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave(<%=i%>)" id="fee<%=i%>" type="number" 
value="<%=c.getFee() %>"/>
</div>
</div>
<div class="col-sm-2">
<a data-toggle="tooltip" title="click to edit" 
href="#" id="fee<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a>
</div>
</div>

<input class="btn btn-primary" type="submit" disabled id="save" value="SAVE" >
</form>
  </div>
  </div>
  </div>
 	            
 </div>
 </div>
 </div>

      <%
      }
      if(course.size()==0){
    	  out.print("<h3>Sorry!!!NO COURSE To SHOW!</h3>");
      }
      %>
       </div>
      </div>
         
      
   

<br><br><br><br><br><br><br><br><br><br><br><br>
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
	<script>
function setedible(id){
   document.getElementById(id).readOnly=false;
   document.getElementById(id).focus();
}

function makeReadOnly(id){
	document.getElementById(id).readOnly=true;
}



function setcategoryvalue(id,i) {
var x=document.getElementById(id).value;
document.getElementById(id+"field").value=x;     //ok
activatesave(i);
}

function setIsAvalue(id,i) {
	var x=document.getElementById(id).value;
	document.getElementById(id+"field").value=x;       //ok
	activatesave(i);
	}

function setEnable(id){
	document.getElementById(id).disabled=false;
}
function activatesave(i){
	document.forms[i].save.disabled=false;

}
</script>  
	  
	
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
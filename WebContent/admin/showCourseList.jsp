
<%@page import="generalDAO.CourseDAO"%>
<%@page import="pojo.Courses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>CourseList</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<script>
function setedible(id){
   document.getElementById(id).readOnly=false;
   document.getElementById(id).focus();
}

function makeReadOnly(id){
	document.getElementById(id).readOnly=true;
}

function activatesave(){
	document.getElementById("save").disabled=false;
	  document.getElementById("save").style.visibility="visible";
}

function disablesavebutton(){
	document.getElementById("save").style.visibility="hidden";
}

function setcategoryvalue(id) {
var x=document.getElementById(id).value;
document.getElementById("catfield").value=x; 
activatesave();
}
function setIsAvalue(id) {
	var x=document.getElementById(id).value;
	alert("slect option value:"+x);
	document.getElementById("isafield").value=x; 
	activatesave();
	}

</script>

</head>


<body>
<jsp:include page="../includes/navbar.jsp" /> <br><br><br><br>

<% if(session.getAttribute("email")!=null && session!=null){
	  if(!session.getAttribute("user").equals("admin")){
		response.sendRedirect("error?message=Sorry!!You are not authorized to view this page");
       }}else
      if(session.getAttribute("login")==null)
	    response.sendRedirect("error?message=Sorry!!Please login First!");
%>


<div class="container">
   <div class="row">
		<div class="col-md-6 offset6">
             <h1>Available courses</h1>
                  <s:fielderror name="message"></s:fielderror>
                       <ul class="list-group">
                         
 <% ArrayList<Courses> course=CourseDAO.getCourses();
 ArrayList<String> l=CourseDAO.getCourseCategories();
 for(int i=0;i<course.size();i++){
 %>  
 
 <li class="list-group-item">
   <div class="col-sm-3"> <%=course.get(i).getCourse_name() %></div> 
    	<span class="badge"><%=course.get(i).getCategory() %></span>
             <a onclick="return confirm('Are you sure?')" href="deleteCourse?courseName=<%=course.get(i).getCourse_name()  %>">
               <button class="btn btn-danger btn-xs">Delete</button>
              </a>
                <button onclick="disablesavebutton()" class="btn btn-primary btn-xs" data-toggle="collapse" data-target="#<%=i %>">Edit</button>
                                                                                                                                                                      
<div id="<%=i %>" class="collapse"> 
<% Courses c=CourseDAO.getCourseDetailByName(course.get(i).getCourse_name().toString()); %>
<form action="editcourse" method="post" >
NAME:
<input name="courseName" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave()" id="name<%=i%>" type="text" 
value="<%=c.getCourse_name() %>"/>
<%-- <a data-toggle="tooltip" title="click to edit" 
href="#" id="name<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a><br> --%>
<br>
CATEGORY:
<select  onchange="setcategoryvalue(this.id)" id="category<%=i%>" disabled >
<% 
for(int j=0;j<l.size();j++){%>
<option><%=l.get(j).toUpperCase()%></option>
<%} %>
</select>
<input name="course_category" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave()" id="catfield" type="text" 
value="<%=c.getCategory() %>" />
<a data-toggle="tooltip" title="click to edit" 
href="#" id="category<%=i%>" onclick="setEnable(this.id)">
<i class="glyphicon glyphicon-edit"></i></a><br>

TOTAL SEAT:
<input name="total" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave()" id="tot<%=i%>" type="number" 
value="<%=c.getTotal() %>"/>
<a data-toggle="tooltip" title="click to edit" 
href="#" id="tot<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a><br>


AVAILABLE SEAT:
<input name="available" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave()" id="av<%=i%>" type="number" 
value="<%=c.getAvailable() %>"/>
<a data-toggle="tooltip" title="click to edit" 
href="#" id="av<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a><br>

IS AVAILABLE:

<select  onchange="setIsAvalue(this.id)" id="isavailable<%=i%>" disabled >
<option>Y</option>
<option>N</option>
</select>
 <input name="is_available" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave()" id="isafield" type="text" 
value="<%=c.getIsAvailable() %>"/>
<a data-toggle="tooltip" title="click to edit" 
href="#" id="isavailable<%=i%>" onclick="setEnable(this.id)">
<i class="glyphicon glyphicon-edit"></i></a><br>

DURATION:
<input name="duration" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave()" id="dur<%=i%>" type="number" 
value="<%=c.getDuration() %>"/>
<a data-toggle="tooltip" title="click to edit" 
href="#" id="dur<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a><br>

FEE:
<input name="fee" readOnly="readonly" onblur="makeReadOnly(this.id)" 
onchange="activatesave()" id="fee<%=i%>" type="number" 
value="<%=c.getFee() %>"/>
<a data-toggle="tooltip" title="click to edit" 
href="#" id="fee<%=i%>" onclick="setedible(this.id)">
<i class="glyphicon glyphicon-edit"></i></a><br>

<input type="submit" disabled="disabled" id="save" value="SAVE" on>
</form>
    	              
    	</div>
  </li>
      <%
      }
      if(course.size()==0){
    	  out.print("<h3>Sorry!!!NO COURSE To SHOW!</h3>");
      }
      %>
      </ul>
   </div>
  </div>
 </div>
  




<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
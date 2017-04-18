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
    <title>StudentList</title>

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
				<li><a href="showStudentList">Student list</a></li>
				<li>Student Detail</li>					
			</div>		
		</div>	
</div>


<%!int id;
ArrayList<Student> list;
%> 
<% 


if(session.getAttribute("email")!=null && session!=null){
	if(session.getAttribute("user").equals("admin")){
 String email=request.getParameter("id");	
   StudentDAO dao=new StudentDAO();
   list=dao.getStudentData(email); 
   id= list.get(0).getStudent_id();
  %>
 
  <div class="container">
 <h1 class="btn-primary" align="center"><% out.print(list.get(0).getName()); %></h1>
 <s:if test="hasActionMessages()">
   <div class="welcome">
      <s:actionmessage/>
   </div>
</s:if>
<s:fielderror name="mesage"></s:fielderror>
<div class="row">
 <div class="col-md-4 btn-info">
 <h2>PROFILE</h2>

 Student_ID:<input class="form-control" type="text" value="<% out.print(list.get(0).getStudent_id()); %>" disabled>
 <br> 
 StudentNAME:<input class="form-control" type="text" value="<% out.print(list.get(0).getName()); %>" readOnly>
 Registered ON:<input class="form-control" type="text" value="<% out.print(list.get(0).getRegistered_on()); %>" readOnly>
 DOB:<input class="form-control" type="date" value="<% out.print(list.get(0).getDob()); %>" readOnly>
 QUALIFIACATION:<input class="form-control" type="text" value="<% out.print(list.get(0).getQualification());%>" readOnly>
 MOBILE:<input class="form-control" type="number" value="<% out.print(list.get(0).getMobile()); %>" readOnly>
 EMAIL:<input class="form-control" type="email" value="<% out.print(list.get(0).getEmail()); %>" readOnly>
 Status(IsActive?):<input class="form-control" type="text" value="<% out.print(list.get(0).getIsActive()); %>" readOnly >
<br><br>

</div>

<div class="col-md-4 btn-warning">
<h2>COURSE</h2>
COURSE-ENROLLED:<input class="form-control"  type="text" value="<% out.print(list.get(0).getCourse_enrolled()); %>" readOnly><br>
Course Id:<input class="form-control"  type="text" value="<% out.print(list.get(0).getCourse_category());%>" readOnly><br>

duration:<input class="form-control"  type="text" value="<% out.print(list.get(0).getCourse_duration());%>" readOnly><br>
course Fee:Rs.<input class="form-control"  type="text" value="<% out.print(list.get(0).getCourse_fee());%>" readOnly><br>

<br><br><br><br><br><br><br><br><br>
</div>





<div class="col-md-4 btn-info">
<h2>payment Info</h2>

Method of payment:<input class="form-control"  type="text" value="<% out.print(list.get(0).getPaymentmethod());%>" readOnly><br>
<%
if(!list.get(0).getPaymentmethod().equals("cash")){
   if(list.get(0).getPaymentmethod().equals("dd")){
	   out.print("DDNO:<input class='form-control'  type='text' value='"+list.get(0).getDdNo()+"' readOnly>");
   }else
	   out.print("Chek No.:<input class='form-control'  type='text' value='"+list.get(0).getChekNo()+"' readOnly>");
}
%>

<br>Is Due?:<input class="form-control"  type="text" value="<% out.print(list.get(0).getIsDue());%>" readOnly>
<br>DUE AMOUNT?:<input class="form-control"  type="text" value="<% out.print(list.get(0).getDueAmount());%>" readOnly>
<br><br><br><br><br><br><br><br><br><br>



<%
} else 
	response.sendRedirect("error.jsp?message=Sorry You are Not authorized to view this Page");
} else 
  response.sendRedirect("student-login?message=Please Login First");  %>
 </div>
 </div>
<br><br>


<!-- ROW BOTTOM -->

<div class="row">
 <div class="container">
  <h3 class="btn-primary">MESSAGES</h3> 


  <% 
 
ArrayList<StudentNotification> l=StudentDAO.getMessage(id);
  if(l.size()>0){
for(int i=0;i<list.size();i++){
	
	%>
	  <%=l.get(i).getIdPrimary() %>
   <div class="row">	
    <hr>
  <a onclick="confirm('ARE YOU SURE?')" class=" btn btn-danger glyphicon glyphicon-floppy-remove" href="deleteMessage?id=<%=l.get(i).getIdPrimary() %>"></a><div class="btn-info btn"><% out.print(l.get(i).getTime());%></div><div class="badge"><% out.print(l.get(i).getMessage());%></div>
	</div>
	<br>
	<%}%>
	<%}else{
		out.print("<h3>NO MESSAGE TO SHOW!!<h3>");
	} %>
  </div>
</div>




</div>




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

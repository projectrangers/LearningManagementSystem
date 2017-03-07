<%@page import="java.util.ArrayList"%>
<%@page import="student.dao.StudentDAO"%>
<%@page import="pojo.Student"%>
<jsp:useBean id="student" class="pojo.Student"/>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>STUDENTDetails</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript">
function printAction(){
	window.print();
}
</script>
</head>
<body>

<jsp:include page="../includes/navbar.jsp" /> <br><br><br><br>


 
<% 
ArrayList<Student> list;

if(session.getAttribute("email")!=null && session!=null){
	if(session.getAttribute("user").equals("admin")){
 String email=request.getParameter("id");	
   StudentDAO dao=new StudentDAO();
   list=dao.getStudentData(email); 
  
  %>
  <div class="container">
  <button class="btn btn-info" onclick="printAction()">Print</button>
 <h1 align="center"><% out.print(list.get(0).getName()); %></h1><hr>
 <div class="col-md-4">
 <h2>PROFILE</h2>
 Student_ID:<input type="text" value="<% out.print(list.get(0).getStudent_id()); %>" disabled>
 <br>
 StudentNAME:<input type="text" value="<% out.print(list.get(0).getName()); %>" readOnly><br>
 Registered ON:<input type="text" value="<% out.print(list.get(0).getRegistered_on()); %>" readOnly><br>
 DOB:<input type="date" value="<% out.print(list.get(0).getDob()); %>" readOnly><br>
 QUALIFIACATION:<input type="text" value="<% out.print(list.get(0).getQualification());%>" readOnly><br>
 MOBILE:<input type="number" value="<% out.print(list.get(0).getMobile()); %>" readOnly><br>
 EMAIL:<input type="email" value="<% out.print(list.get(0).getEmail()); %>" readOnly><br>
 Status(IsActive?):<input type="text" value="<% out.print(list.get(0).getIsActive()); %>" readOnly >
 <br>
 
 <hr>
<s:if test="hasActionMessages()">
   <div class="welcome">
      <s:actionmessage/>
   </div>
</s:if>
<s:fielderror name="mesage"></s:fielderror>
</div>

<div class="col-md-4">
<h2>COURSE</h2>
COURSE-ENROLLED:<input type="text" value="<% out.print(list.get(0).getCourse_enrolled()); %>" readOnly><br>
Course Id:<input type="text" value="<% out.print(list.get(0).getCourse_category());%>" readOnly><br>

duration:<input type="text" value="<% out.print(list.get(0).getCourse_duration());%>" readOnly><br>
course Fee:Rs.<input type="text" value="<% out.print(list.get(0).getCourse_fee());%>" readOnly><br>
</div>
<div class="col-md-4">
<h2>payment Info</h2>

Method of payment:<input type="text" value="<% out.print(list.get(0).getPaymentmethod());%>" readOnly><br>
<%
if(!list.get(0).getPaymentmethod().equals("cash")){
   if(list.get(0).getPaymentmethod().equals("dd")){
	   out.print("DDNO:<input type='text' value='"+list.get(0).getDdNo()+"' readOnly>");
   }else
	   out.print("Chek No.:<input type='text' value='"+list.get(0).getChekNo()+"' readOnly>");
}
%>

<br>Is Due?:<input type="text" value="<% out.print(list.get(0).getIsDue());%>" readOnly>
<br>DUE AMOUNT?:<input type="text" value="<% out.print(list.get(0).getDueAmount());%>" readOnly>




<%
} else 
	response.sendRedirect("error.jsp?message=Sorry You are Not authorized to view this Page");
} else 
  response.sendRedirect("student-login?message=Please Login First");  %>
 </div>
 <br> <br> <br> <br> <br> <br> <br>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>

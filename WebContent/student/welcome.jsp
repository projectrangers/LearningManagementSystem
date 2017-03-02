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
<title>DASHBOARD</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>

<jsp:include page="../includes/navbar.jsp" /> <br><br><br><br>


 <h1>STUDENT DASHBOARD</h1><hr>
<% 
ArrayList<Student> list;

if(session.getAttribute("email")!=null && session!=null){
	if(session.getAttribute("user").equals("student")){
String email=(String)session.getAttribute("email");
   //out.print("LoggedIn: "+email); 
   StudentDAO dao=new StudentDAO();
   list=dao.getStudentData(email); 
  
  %>
 <h2>Profile</h2>
 Student_ID: <% out.print(list.get(0).getStudent_id()); %><br>
 StudentNAME:<% out.print(list.get(0).getName()); %><br>
 DATE OF BIRTH:<% out.print(list.get(0).getQualification()); %><br>
 MOBILE:<% out.print(list.get(0).getMobile()); %><br>
 EMAIL:<% out.print(list.get(0).getEmail()); %><br>
 Active:<% out.print(list.get(0).getIsActive()); %><br>
 
 <hr>
<s:if test="hasActionMessages()">
   <div class="welcome">
      <s:actionmessage/>
   </div>
</s:if>
<s:fielderror name="mesage"></s:fielderror>

 <form action="changePassword" method="post" >
<input type="password" name="oldPassword" placeholder="old password">
 <input type="password" name="newPassword" placeholder="new password">
 <input type="hidden" name="email" value="<% out.print(list.get(0).getEmail()); %>">
<input type="submit" onclick="return confirm('Are you sure?')">
</form>

<hr>
<h2>COURSE</h2>
COURSE-ENROLLED:<% out.print(list.get(0).getCourse_enrolled()); %><br>
Course Id:<% out.print(list.get(0).getCourse_category());%><br>
Registered ON:<% out.print(list.get(0).getRegistered_on()); %><br>
duration:<% out.print(list.get(0).getCourse_duration());%><br>
course Fee:Rs.<% out.print(list.get(0).getCourse_fee());%><br>

<h2>payment Info</h2>

Method of payment:<% out.print(list.get(0).getPaymentmethod());%><br>
<%
if(!list.get(0).getPaymentmethod().equals("cash")){
   if(list.get(0).getPaymentmethod().equals("dd")){
	   out.print("DDNO:"+list.get(0).getDdNo()+"<br>");
   }else
	   out.print("chek no."+list.get(0).getChekNo()+"<br>");
}
%>
Is Due?:<% out.print(list.get(0).getIsDue()+"<br>");
out.print("due Amount:"+list.get(0).getDueAmount());

%>
<h2>Messages</h2>
<% 
for(int i=0;i<list.size();i++){
	out.print("<br><li>"+list.get(i).getMessage());
}
	%>



<%
} else 
	response.sendRedirect("error.jsp?message=Sorry You are Not authorized to view this Page");
} else 
  response.sendRedirect("student-login?message=Please Login First");  %>
 
 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
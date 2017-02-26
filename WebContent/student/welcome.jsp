<%@page import="java.util.ArrayList"%>
<%@page import="dao.student.StudentDAO"%>
<%@page import="pojo.Student"%>
<jsp:useBean id="student" class="pojo.Student"/>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.actionMessage{
	color:red;
}
</style>
<link rel="stylesheet" href="css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome</title>
</head>
<body>
 <h1>STUDENT DASHBOARD</h1><hr>
<% 
ArrayList<Student> list;
if(session.getAttribute("email")!=null && session!=null){
String email=(String)session.getAttribute("email");
   out.print("LoggedIn: "+email); 
   StudentDAO dao=new StudentDAO();
   list=dao.getStudentData(email); 
  
  %>





 <s:a action="logout">Logout</s:a>
 <hr>
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

 <form action="changePassword" method="post">
<input type="password" name="oldPassword" placeholder="old password">
 <input type="password" name="newPassword" placeholder="new password">
 <input type="hidden" name="email" value="<% out.print(list.get(0).getEmail()); %>">
<input type="submit">
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
  response.sendRedirect("studentlogin.jsp"); %>
 
 
 

 
 
</body>
</html>
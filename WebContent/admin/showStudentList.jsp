<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="student.dao.StudentDAO" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="pojo.Student" %>
    <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>StudentList</title>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
}
</style>
<script type="text/javascript">
function printAction(){
	window.print();
}
</script>
</head>
<body>
 <button class="btn btn-info" onclick="printAction()">Print</button>
<% StudentDAO dao=new StudentDAO();
ArrayList<Student> list= dao.getStudentList(); %>
<s:fielderror name="message"></s:fielderror>
<table width="50%">
<tr>
<th>S.No.</th>
<th>ID</th>
<th>NAME</th>
<th>EMAIL</th>
<th>IsDue</th>
<th>IsActive</th>
<th>FULL DETAILS</th>
<th>DELETE</th>
<th>Status</th>
</tr>
<%for(int i=0;i<list.size();i++){ %>
<tr>
<td><%=i+1 %></td>
<td><%=list.get(i).getStudent_id() %></td>
<td><%=list.get(i).getName() %></td>
<td><%=list.get(i).getEmail() %></td>
<td><%=list.get(i).getIsDue() %></td>
<td><%=list.get(i).getIsActive() %></td>
<td><a href="getStudent?id=<%=list.get(i).getEmail() %>">SHOW</a></td>
<td><a href="deleteStudent?id=<%=list.get(i).getEmail() %>" onclick="return confirm('ARE YOU SURE??')">DELETE</a></td>
<td>
<%if(list.get(i).getIsActive().toString().equalsIgnoreCase("yes")){%>
<a href="deactiveStudent?id=<%=list.get(i).getEmail() %>" onclick="return confirm('ARE YOU SURE??')">Deactivate</a></td>
<%}else{ %>
<a href="activateStudent?id=<%=list.get(i).getEmail() %>" onclick="return confirm('ARE YOU SURE??')">Activate</a></td>
<%} %>
</tr>
<%} %>


</table>
<a href="admin-dashboard">BAck To DAshboard</a>
</body>
</html>
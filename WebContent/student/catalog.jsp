<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
  <%@page import="dao.student.CourseDAO" %>
  <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CourseCatalog</title>
</head>
<body>
<table style="border-style:solid; width:200px;">
<tr>
<th>name</th>
<th>category</th>
<th>Available seat</th>
<th>Duration</th>
<th>fee</th>
</tr>
<%
ResultSet rs=CourseDAO.getCourses();

while(rs.next()){
%>

<tr>

<td><%=rs.getString("course_name") %></td>
<td><%=rs.getString("category") %></td>
<td><%=rs.getString("available") %></td>
<td><%=rs.getString("isavailable") %></td>
<td><%=rs.getString("duration") %></td>
<td><%=rs.getString("fee") %></td>
<td>
<a href="courseselected?name=<%out.print(rs.getString("course_name"));%>&fee=<%=rs.getString("fee") %>">proceed</a></td>
</tr>

<%
}
%>
</table>
</body>
</html>
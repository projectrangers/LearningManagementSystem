<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="student.dao.StudentDAO" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="pojo.Student" %>
    <%@taglib prefix="s" uri="/struts-tags"%>
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
	<style>
	.lbl{
	font-weight: bold;
	font-color:black;
	}
	</style>
  </head>
  <body>
<jsp:include page="../includes/navbar.jsp" />
<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">							
				<li><a href="home">Home</a></li>
				<li>Admin</li>
				<li><a href="admin-dashboard">Dashboard</a></li>
				<li>Student LIST</li>				
			</div>		
		</div>	
</div>


<% StudentDAO dao=new StudentDAO();
ArrayList<Student> list= dao.getStudentList(); %>

<div class="container">
<h1 class="list-group-item-info">STUDENT LIST</h1><h4 style="color:red"><s:fielderror name="message"></s:fielderror></h4>
<div class="table-responsive">
<table class="table ">
<thead class=" btn-primary">
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
<th>Send Message</th>
</tr>
</thead>
 <tbody class="btn-info">
<%for(int i=0;i<list.size();i++){ %>
<tr>
<td><%=i+1 %></td>
<td><%=list.get(i).getStudent_id() %></td>
<td><%=list.get(i).getName() %></td>
<td><%=list.get(i).getEmail() %></td>
<td><%=list.get(i).getIsDue() %></td>
<td><%=list.get(i).getIsActive() %></td>
<td><a class="btn btn-warning" href="getStudent?id=<%=list.get(i).getEmail() %>">SHOW</a></td>
<td><a class="btn btn-danger" href="deleteStudent?id=<%=list.get(i).getEmail() %>" onclick="return confirm('ARE YOU SURE??')">DELETE</a></td>

<%if(list.get(i).getIsActive().toString().equalsIgnoreCase("yes")){%>
<td><a class="btn btn-info" href="deactiveStudent?id=<%=list.get(i).getEmail() %>" onclick="return confirm('ARE YOU SURE??')">Deactivate</a></td>
<%}else{ %>
<td><a class="btn btn-success" href="activateStudent?id=<%=list.get(i).getEmail() %>" onclick="return confirm('ARE YOU SURE??')">Activate</a></td>
<%} %>

<td><a class="btn btn-default" data-toggle="modal" data-target="#<%=i%>" >SEND</a></td>
</tr>

<!--Message Modal -->
<div id="<%=i %>"  class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Send Message TO, <%=list.get(i).getName().toUpperCase() %></h4>
        
      </div>
      <div class="modal-body">
     <form action="sendMessage" method="post">
      <input name="id" type="hidden" value="<%=list.get(i).getStudent_id() %>">
       <h4> Type Your Message:</h4>
      <textarea name="message" class="btn-info form-control lbl" rows="10;">
      </textarea>
       <input type="submit" class="btn btn-primary" value="SEND">
     </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        
      </div>
    </div>

  </div>
</div>
<%} %>



</table>
<a class="btn btn-info" href="admin-dashboard">Back To Dashboard</a>
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

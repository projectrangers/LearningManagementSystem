<%@page import="staff.DAO.StaffProfileDAO"%>
<%@page import="pojo.Staff"%>
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
    <title>Admin</title>

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
				<li><a href="admin">Dashboard</a></li>	
				<li>Staff List</li>			
			</div>		
		</div>	
	</div>
<%
ArrayList<Staff> list=StaffProfileDAO.getAllStaff();
//System.out.print("this is test staff list:"+list.get(1).getName());
%>
<s:fielderror name="message"></s:fielderror>
<div class="container">
<h1 class="list-group-item-info">STAFF LIST</h1>
<div class="table-responsive">
<table class="table ">
<span style="color:red"><s:fielderror name="message"></s:fielderror></span>
<thead class=" btn-primary">
<tr>
<th>S.No.</th>
<th>NAME</th>
<th>Role</th>
<th>Mobile</th>
<th>Preferred Course</th>
<th>Email</th>
<th>Address</th>
<th>Experience</th>
<th>Qualification</th>
<th>DELETE</th>
</tr>
</thead>
 <tbody class="btn-info">
<%for(int i=0;i<list.size();i++){ %>
<tr>
<td><%=i+1 %></td>
<td><%=list.get(i).getName() %></td>
<td><%=list.get(i).getRole() %></td>
<td><%=list.get(i).getMobile() %></td>
<td><%=list.get(i).getCourse_preference() %></td>
<td><%=list.get(i).getEmail() %></td>
<td><%=list.get(i).getAddress() %></td>
<td><%=list.get(i).getExperience() %></td>
<td><%=list.get(i).getQualification() %></td>
<td><a class="btn btn-danger" href="deleteStaff?email=<%=list.get(i).getEmail() %>" onclick="return confirm('ARE YOU SURE??')">DELETE</a></td>
</tr>
<%} %>
</tbody>

</table>
<a class="btn btn-primary" href="admin-dashboard">BAck To DAshboard</a>
</div>
</div>

<br>
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
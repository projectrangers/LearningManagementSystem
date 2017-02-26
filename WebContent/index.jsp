<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LearningManangementSystem</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="css/general.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>

<!-- navbar start -->

<nav class="navbar navbar-default navbar-fixed-top">
<div class="container">
<button type="button" class="navbar-toggle"
data-toggle="collapse"
data-target=".navbar-collapse">
<span class="sr-only">Toggle Navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a href="#" class="navbar-brand">WELCOME BRAND</a>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav navbar-right">
<li class="active"><a href="#">HOME</a>
<li class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown">COURSES<b class="caret"></b ></a>
<ul class="dropdown-menu" width="500px">
<%for(int j=0;j<3;j++){ %>
<li class="dropdown-header">category</li>
<% for(int i=0;i<=5;i++){ %>
<li><a href="#">cat k ander</a></li>
<%}} %>
</ul>
</li>


<li class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown">LOGIN/REGISTER<b class="caret"></b ></a>
<ul class="dropdown-menu" width="500px">
<li><a href="student">STUDENT</a>
<li><a href="staff">STAFF</a></li>
<li><a href="admin">ADMIN</a>
</ul>
</li>

<li><a href="admin">ABOUT</a>
</ul>
</div>
</div>
</nav>
<!-- banner -->
 <div class="banner-bg img-responsive" id="top">
            <div class="banner-overlay"></div>
                 <div class="welcome-text">
                    <h2>Welcome to My INSTITUTE</h2>
                    <h5>
                        This is Reputed Institute in Greater Noida.This is Reputed Institute in Greater Noida.
                      This is Reputed Institute in Greater Noida.This is Reputed Institute in Greater Noida.
                    This is Reputed Institute in Greater Noida.This is Reputed Institute in Greater Noida.
                    This is Reputed Institute in Greater Noida.This is Reputed Institute in Greater Noida.
                    </h5>
                  </div>
 </div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
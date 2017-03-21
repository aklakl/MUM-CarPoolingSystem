<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
 <%@ page import="Model.Users" %>
 
<!DOCTYPE html>
<html lang="en" class=" js no-touch">
<head>
  <title>RideShare Carpools</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,600|Raleway:600,300|Josefin+Slab:400,700,600italic,600,400italic' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="assets/css/slick-team-slider.css"/>
  <link rel="stylesheet" type="text/css" href="assets/css/style.css">
  
</head>
<body>


<%
session.removeAttribute("logedinuser");
%>


	
<!--HEADER START-->
	<div class="main-navigation navbar-fixed-top">
		<nav class="navbar navbar-default">
			<div class="container">
			<div class="navbar-header">
			  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			  </button>
			  <a class="navbar-brand" href="index.html">RideShare</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
			  <ul class="nav navbar-nav navbar-right">
			  	<li><a href="view/weather.jsp">Weather</a></li>
			    <li class="active"><a href="view/createprofile.jsp">Register</a></li>
			    
			    <!--<li><a href="#portfolio">Portfolio</a></li>
			    <li><a href="#about">Our Team</a></li>
			    <li><a href="#contact">Contact Us</a></li>-->
			  </ul>
			</div>
		  </div>
		</nav>
	</div>
	<!--HEADER END-->

	<!--BANNER START-->
	<div id="banner" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="jumbotron">
				  <h1 class="small">Welcome To <span class="bold main-logo">RideShare</span></h1>
				  <p class="big">Our Multipurpose Carpooling Service</p>
				  <!-- <a href="#" class="btn btn-banner">Learn More<i class="fa fa-send"></i></a> -->
				</div>
			</div>
		</div>
	</div>
	<!--BANNER END-->

	<!--CTA1 START-->
	<div class="cta-1">
		<div class="container">
			<div class="row text-center white">
				<h1 class="cta-title">Login To Use Our Services</h1>
				<p class="cta-sub-title"> </p><br>
					<form action="UserControler" method="post" role="form" class="contactForm">
						<div class="col-md-4 form-group">
                            <input type="text" name="txtusername" class="form-control text-field-box" id="name" placeholder="Your User Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                            <div class="validation"></div>
                        </div>
						<div class="col-md-4 form-group">
                            <input type="password" name="password" class="form-control text-field-box" id="name" placeholder="Your Password" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                            <div class="validation"></div>
                        </div>
						<button class="button-medium" id="contact-submit" type="submit" name="btnlogin">Login</button>
					</form>
				<%-- <form method='post' action="UserControler">
	<span>User Name: </span><input type="text" name="txtusername"><br><br>
	<span>Password: </span><input type="password" name="password" ><br>
	<input type="submit" name="btnlogin" value="Login">
	<p name="info">${message}</p>
	The date is: <%=new Date()%>
	
	</form> --%>
			</div>
		</div>
	</div>
	<!--CTA1 END-->



	<!--FOOTER START-->
	<footer class="footer section-padding">
		<div class="container">
			<div class="row">
				<div style="visibility: visible; animation-name: zoomIn;" class="col-sm-12 text-center wow zoomIn">
					<h3>Follow us on</h3>
					<div class="footer_social">
						<ul>
							<li><a class="f_facebook" href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a class="f_twitter" href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a class="f_google" href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a class="f_linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>																
				</div><!--- END COL -->
			</div><!--- END ROW -->
		</div><!--- END CONTAINER -->
	</footer>
	<!--FOOTER END-->
	<div class="footer-bottom">
		<div class="container">
			<div style="visibility: visible; animation-name: zoomIn;" class="col-md-12 text-center wow zoomIn">
				<div class="footer_copyright">
					<p> © Copyright, All Rights Reserved.</p>					
					<div class="credits">
                        Designed by <a href="https://bootstrapmade.com/">Bootstrap Themes</a>
                    </div>
				</div>
			</div>
		</div>
	</div>
  	<script src="assets/js/jquery.min.js"></script>
  	<script src="assets/js/jquery.easing.min.js"></script>
  	<script src="assets/js/bootstrap.min.js"></script>
  	<script src="assets/js/jquery.mixitup.js" type="text/javascript"></script>
	<script type="text/javascript" src="assets/js/slick.min.js"></script>
	<script type="text/javascript" src="assets/js/custom.js"></script>
	
</body>
</html>
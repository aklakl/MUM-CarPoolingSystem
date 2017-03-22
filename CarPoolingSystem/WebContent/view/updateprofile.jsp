<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>RideShare Carpools - Update Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,600|Raleway:600,300|Josefin+Slab:400,700,600italic,600,400italic' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="../assets/css/slick-team-slider.css"/>
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">	

</head>
<body>
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
			  	<li><a href="<%=request.getContextPath()%>/view/weather.jsp">Weather</a></li>
			    <li class="active"><a href="<%=request.getContextPath()%>/index.jsp">Logout</a></li>
			  </ul>
			</div>
		  </div>
		</nav>
	</div>
	<!--HEADER END-->
	<br><br><br>
	<!--CTA1 START-->
	<div class="cta-1">
		<div class="container">
			<div class="row text-center white">
				<h1 class="cta-title">Update Your Profile</h1>
				<p class="cta-sub-title">Update your details below</p>
			</div>
		</div>
	</div>
	<!--CTA1 END-->

	<div class="container">
		<div class="clearfix"></div>
		<div class="col-md-8 col-md-offset-2"><br><br>
			<form method='post' action="someservlet">
				<input type="hidden" name="userid" value="0"><br>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">Full Name:</label>
				  <div class="col-md-9">
				    <input class="form-control" type="text" name="fullname">
				  </div>
				</div>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">Gender:</label>
				  <div class="col-md-9">
				    <label class="custom-control custom-radio"><input type="radio" class="custom-control-input" name="gender" value="1"> Male </label>
				    <label class="custom-control custom-radio"><input type="radio" class="custom-control-input" name="gender" value="0"> Female</label>
				  </div>
				</div>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">State:</label>
				  <div class="col-md-9">
				    <input class="form-control" type="text" name="state">
				  </div>
				</div>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">City:</label>
				  <div class="col-md-9">
				    <input class="form-control" type="text" name="city">
				  </div>
				</div>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">Street:</label>
				  <div class="col-md-9">
				    <input class="form-control" type="text" name="street">
				  </div>
				</div>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">Zip Code:</label>
				  <div class="col-md-9">
				    <input class="form-control" type="text" name="zipcode">
				  </div>
				</div>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">Birth Year:</label>
				  <div class="col-md-9">
				    <input type="text" name="birthyear" class="form-control">
				  </div>
				</div>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">Email:</label>
				  <div class="col-md-9">
				    <input class="form-control" type="email" name="email">
				  </div>
				</div>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">Password:</label>
				  <div class="col-md-9">
				    <input class="form-control" type="password" name="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$">
				  </div>
				</div>
				<div class="form-group row">
				  <label class="col-md-3 col-form-label">Password:</label>
				  <div class="col-md-9">
				    <input class="form-control" type="password" name="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$">
				  </div>
				</div>
				<div class="pull-right">
					<input type="button" class="btn btn-danger" id="btnSaveprofile" name="btnSaveprofile" value="Save"> 
					
				</div>
				
				<!-- <span>Full Name: </span><input type="text" name="fullname"><br>
				<br> <span>Gender</span><br> <input type="radio"
					name="gender" value="1">Male <input type="radio"
					name="gender" value="0">Female<br> 
					
					State:<input
					type="text" name="state"><br> City:<input type="text"
					name="city"><br> Street:<input type="text"
					name="street"><br> Zip Code:<input type="text"
					name="zipcode"><br> Birth Year:<input type="text"
					name="birthyear" pattern=""><br> Email:<input
					type="text" name="email" pa><br> Password:<input
					type="password" name="password"
					pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"><br>
				Confirm password:<input type="password" name="confirmpassword"
					pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"><br>
				<input type="button" class="btn btn-danger" id="btnprofile" name="btnprofile" value="Submit"> 
				<input type="reset" class="btn btn-danger" id="btnreset" name="btnreset" value="Reset"> -->
			</form>
			<br><br>
		</div>
	</div>


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
	
<!-- <h2>Update profile</h2>
	<form method='post' action="someservlet">
	<input type="hidden" name="userid" value="0"><br>
	<span>Full Name: </span><input type="text" name="fullname"><br><br>
	<span>Gender</span><br>
	<input type="radio" id="gendermale" name="gender" value="1">Male
	<input type="radio" id="genderfemale" name="gender" value="0">Female<br>
	State:<input type="text" name="state"><br>
	City:<input type="text" name="city"><br>
	Street:<input type="text" name="street"><br>
	Zip Code:<input type="text" name="zipcode"><br>
	Bithr year:<input type="text" name="birthyear" pattern=""><br>
	Email:<input type="text" name="email" pa><br>
	Password:<input type="password" name="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"><br>
	Confirm password:<input type="password" name="confirmpassword" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"><br>
	<input type="button" id="btnSaveprofile" name="btnSaveprofile" value="Save">
	</form> -->
</body>
	<script type="text/javascript" src="../res/js/jquery-3.2.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="../res/js/profile.js" charset="utf-8"></script>
	<script src="../assets/js/jquery.easing.min.js"></script>
  	<script src="../assets/js/bootstrap.min.js"></script>
  	<script src="../assets/js/jquery.mixitup.js" type="text/javascript"></script>
	<script type="text/javascript" src="../assets/js/slick.min.js"></script>
	<script type="text/javascript" src="../assets/js/custom.js"></script>
	<script>
	function init_updateProfilePage(){
		console.log("fn_submit:"+gObject.url);
		var data = {};
		data.businessClass = "UserBusiness";
		data.methodName = "searchUser";
		var parameters = {};
		parameters.sqlParamter=' where userid=${logedinuser.userid}';//;
		data.parameters = JSON.stringify(parameters);
		//data.parameters = JSON.stringify(formData);
		$.ajax({
		  type		: 'POST',
		  url		: gObject.url+"/Profile",
		  data		: data,
		  success	: fn_fetchDataInUpdateProfile,
		  dataType	: "json"
		});
	}
	init_updateProfilePage(); 
	</script>
</html>
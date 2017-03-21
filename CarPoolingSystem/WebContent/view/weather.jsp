<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>RideShare Carpools - Weather</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,600|Raleway:600,300|Josefin+Slab:400,700,600italic,600,400italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="../assets/css/slick-team-slider.css"/>
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <link href="../assets/css/weather.css" type="text/css" rel="stylesheet"/>
    
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
			  <a class="navbar-brand" href="/">RideShare</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
			  <ul class="nav navbar-nav navbar-right">
			    <li class="active" ><a href="/CarPoolingSystem">Login</a></li>
			    <!--<li><a href="#service">Service</a></li>
			    <li><a href="#portfolio">Portfolio</a></li>
			    <li><a href="#about">Our Team</a></li>
			    <li><a href="#contact">Contact Us</a></li>-->
			  </ul>
			</div>
		  </div>
		</nav>
	</div>
	<!--HEADER END-->

    <!--user information-->
    <div id="wrapper">
    <div id = "info-button2">Show<br>Info</div>
    <div id = "info">
      <div id = "info-button">Hide<br>Info</div>
      <div id="infowrapper">
        <h4>Profile for ______</h4>
        <ul hidden>
          <li>Name : Mike K.</li>
          <li>Gender : Male</li>
          <li>Age : 31</li>
          <li>City : San Francisco</li>
          <li>State : California</li>
          <li>Zip-Code : 94080</li>
          <li>Country : U.S.A</li>
          <li>User Since : 2016</li>
        </ul>
      </div>
      <div id = "search">
        <!--<input type = "text" id="destination" placeholder = "Destination"/>
        <input type = "button" value = "Search" onclick="setdestination()"/> -->   
      </div>
      <div id="w_container">
        <div id = "weather"> </div>
        <div id = "WeatherIcon">
            <span id = "Icon"></span>
        </div>
      </div>
    </div>
    <!--Weather container-->
    
    <!--MAP-->
    <div id="map"></div>

    <!--5 day listing-->
    <div id="l_container"></div>

    </div>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCxM39UmYCSuurpCoINutq9Q2kec--RuF0&callback=initMap" async defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" ></script>
    <!--<script src="js/jquery.min.js"></script>-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>
  	<script src="../assets/js/jquery.easing.min.js"></script>
  	<!--<script src="js/bootstrap.min.js"></script>-->
  	<script src="../assets/js/jquery.mixitup.js" type="text/javascript"></script>
    <script type="text/javascript" src="../assets/js/slick.min.js"></script>
    <script type="text/javascript" src="../assets/js/custom.js"></script>
    <script src="../assets/js/weather.js" type="text/javascript"></script>
  </body>
</html>
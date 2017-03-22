<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
    <%@ page import="Model.Users" %>
 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>RideShare Carpools</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,600|Raleway:600,300|Josefin+Slab:400,700,600italic,600,400italic' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/slick-team-slider.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-3.2.0.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/profile.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/home.js" charset="utf-8"></script>
<script>
	function fn_send_comment(self){
		var obj = $($(self).parent()[0]).find("textarea")[0];
		console.log("fn_send_comment:"+obj.value);
		data = {};
		data.businessClass = "CommentBusiness";
		data.methodName = "addComment";
		data.parameters = {};
		//data.parameters.commentid = 0;
		data.parameters.userid = ${logedinuser.userid};
		data.parameters.postid = $(self).attr("postid");//
		data.parameters.comment = obj.value;
		data.parameters = JSON.stringify(data.parameters);
		url = "http://"+window.location.host+"/CarPoolingSystem";//window.location.port;
		$.ajax({
		  type		: 'POST',
		  url		: url+"/Profile",
		  data		: data,
		  success	: fn_fetchCommentData_success,
		  dataType	: "json"
		});
		
	}
	function fn_fetchCommentData_success(data, textStatus, jqXHR){
		console.log("fn_fetchCommentData_success:"+data);
		if (data.result){
			alert("add the comment success"); 
			//window.location.href=gObject.url; 
			window.location.reload(true);
		}else{
			alert("add the comment failed");  
		}
	}
	
	function fn_delete_comment(self){
		console.log("fn_delete_comment:"+self);
		var obj = $(self).attr("commentid");
		console.log("commentid:"+obj);
		data = {};
		data.businessClass = "CommentBusiness";
		data.methodName = "deleteComment";
		data.parameters = {};
		data.parameters.commentid = obj;
		data.parameters = JSON.stringify(data.parameters);
		url = "http://"+window.location.host+"/CarPoolingSystem";//window.location.port;
		$.ajax({
		  type		: 'POST',
		  url		: url+"/Profile",
		  data		: data,
		  success	: fn_delete_comment_success,
		  dataType	: "json"
		});
	}
	
	function fn_delete_comment_success(data, textStatus, jqXHR){
		console.log("fn_delete_comment_success:"+data);
		if (data.result){
			alert("delete the comment success"); 
			window.location.reload(true);
		}else{
			alert("delete the comment failed");
		}
	}
	 
	function fn_delete_Post(self){
		console.log("fn_delete_Post:"+self);
		var obj = $(self).attr("postid");
		console.log("postid:"+obj);
		data = {};
		data.businessClass = "PostBusiness";
		data.methodName = "deletePost";
		data.parameters = {};
		data.parameters.postid = obj;
		data.parameters = JSON.stringify(data.parameters);
		url = "http://"+window.location.host+"/CarPoolingSystem";//window.location.port;
		$.ajax({
		  type		: 'POST',
		  url		: url+"/Profile",
		  data		: data,
		  success	: fn_delete_post_success,
		  dataType	: "json"
		});
	}
	
	function fn_delete_post_success(data, textStatus, jqXHR){
		console.log("fn_delete_post_success:"+data);
		if (data.result){
			alert("delete the post success"); 
			window.location.reload(true);
		}else{
			alert("delete the post failed");
		}
	}
	
	function fu_add_like(self){
		console.log("fu_add_like:"+self);
		var obj = $(self).attr("postid");
		console.log("postid:"+obj);
		data = {};
		data.businessClass = "LikeBusiness";
		data.methodName = "addLikes";
		data.parameters = {};
		data.parameters.postid = obj;
		data.parameters.userid = "${logedinuser.userid}";
		data.parameters = JSON.stringify(data.parameters);
		url = "http://"+window.location.host+"/CarPoolingSystem";//window.location.port;
		$.ajax({
		  type		: 'POST',
		  url		: url+"/Profile",
		  data		: data,
		  success	: function(data, textStatus, jqXHR){
			console.log("fn_delete_post_success:"+data);
			if (data.result){
				alert("you like to this post success"); 
				window.location.reload(true);
			}else{
				alert("you like to this post failed");
			}
		  },
		  dataType	: "json"
		});
	}
	
	
	//init_HomePage();
	
</script>
</head>
<body>

<%
	String gender ="";
	if( ((Users)session.getAttribute("logedinuser")).getGender() == 1){
		gender = "Male";
	}else{
		gender = "Female";
	}
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
			  	<li><em>Welcome ${logedinuser.fullname}</em></li>
			  	<li><a href="view/weather.jsp">Weather</a></li>
			  	<li><a href = "<%=request.getContextPath()%>/view/updateprofile.jsp">Update profile</a></li>
			    <li class="active"><a href="<%=request.getContextPath()%>/index.jsp">Logout</a></li>
			    
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
				<h1 class="cta-title"></h1>
				<p class="cta-sub-title"></p>
			</div>
		</div>
	</div>
	<!--CTA1 END-->
	<%-- <p><a href = "<%=request.getContextPath()%>/index.jsp">Log out</a>
	<a href = "<%=request.getContextPath()%>/view/updateprofile.jsp">Update profile</a>
	<a href = "<%=request.getContextPath()%>/view/Weatherservice.jsp">Weather Service</a></p> --%>
 	
	<div class="well col-md-2 col-md-offset-1">
		<ul style="list-style-type: none; margin: 0px; padding: 0px;">
			<li class="alert alert-danger"><span class="bold"><em>${logedinuser.fullname}</em></span></li>
			<li>Gender: <%=gender %></li>
			<li>State: ${logedinuser.state}</li>
			<li>City: ${logedinuser.city}</li>
			<li>Street: ${logedinuser.street}</li>
			<li>zip code: ${logedinuser.zipcode}</li>
			<li>Birth year: ${logedinuser.birthyear}</li>
			<li>Email: ${logedinuser.email}</li>
		</ul>
	</div>
	<div class="container">
	<div class="col-md-8 col-md-offset-1">
		
		<div class="well well-lg clearfix">
		<h3 style="text-align: center"><em>Create New Post</em></h3>
		<form action="Home" method="post">
		<div class="col-md-3">
			<label class="custom-control custom-radio"><input type="radio" class="custom-control-input" name="ridetype" value="1"> Offering A Ride </label>
			<label class="custom-control custom-radio"><input type="radio" class="custom-control-input" name="ridetype" value="0"> Requesting A Ride</label>		  
		</div>
		<div class = "col-md-8 col-md-offset-1">
			<input type="hidden" id="txtuserid" name="userid" value="${logedinuser.userid}">
			<textarea rows="6" cols="50" id="txtpost" name="txtpost" placeholder="Write a post" style="margin-bottom:10px;" ></textarea><br>
			<input type="button" id="btnPostMessage" class="btn btn-danger pull-right" value="submit">
		</div>
		
		
		
		</form>
		</div>
		
		
		
		<h3>Posts</h3>
	
		
		<c:forEach var="post" items="${allpost}">
			
			<div class="well clearfix">
				
				<c:if test="${post.posttype == 0}">
					<div class="alert alert-danger"> ${post.post}</div>
				</c:if>
				<c:if test="${post.posttype == 1}">
					<div class="alert alert-warning"> ${post.post}</div>
				</c:if>
 				<em style="font-size: 12px;">${post.datecreated}</em>
				
				<c:set var="iscontain" value="false" /> 
				<c:forEach var="item" items="${post.likes}">
					<c:if test="${item.userid == logedinuser.userid}">
					<c:set var="iscontain" value="true" />  
					</c:if> 
				</c:forEach>
				<c:if test ="${iscontain == true}">
					<p class="btn btn-success pull-right"> Liked <span class="badge">${post.likes.size()}</span></p>
				</c:if>
				<c:if test ="${iscontain == false}">
					<a href="javascript:void(0)" class="btn btn-primary pull-right" postid="${post.postid}" onclick="fu_add_like(this)">Like <span class="badge">${post.likes.size()}</span></a>
				</c:if>
				
				
				
				<c:if test ="${logedinuser.userid == post.userid}">
					<input type="button" class="btn btn-warning pull-right"  postid="${post.postid}" onclick="fn_delete_Post(this)" value="DeletePost">
				</c:if>	
					<c:forEach var="comment" items="${post.commensts}">
					<br>
						<c:if test ="${logedinuser.userid == comment.userid}">
							<em><strong>${comment.comment}</strong></em>&nbsp;&nbsp;<em style="font-size: 10px;">${comment.datecreated}</em> 
							<input type="button" class="btn btn-danger btn-sm"  commentid="${comment.commentid}" onclick="fn_delete_comment(this)" value="Delete Comment">
						</c:if>
						<c:if test ="${logedinuser.userid != comment.userid}">
						<em><strong>${comment.comment}</strong></em>&nbsp;&nbsp;<em style="font-size: 10px;">${comment.datecreated}</em>
						</c:if>
						
					</c:forEach>
					<br>
				 <br>
				 <textarea class = "form-control" rows="1" cols="30" name="txtpost" placeholder="Write a comment"></textarea><br>
				 <input type="button" class="btn btn-primary pull-right" value="Comment" postid="${post.postid}" onclick="fn_send_comment(this)">
			</div>
		</c:forEach>
		
		</div>
		</div>
	<br><br>
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
	
	
</body>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.easing.min.js"></script>
  	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
  	<script src="<%=request.getContextPath()%>/assets/js/jquery.mixitup.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/slick.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/custom.js"></script>
</html>
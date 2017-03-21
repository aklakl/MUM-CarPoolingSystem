<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="../res/js/jquery-3.2.0.js" charset="utf-8"></script>
<script type="text/javascript" src="../res/js/profile.js" charset="utf-8"></script>
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

<title>Update profile</title>
</head>
<body>
<h2>Update profile</h2>
	<form method='post' action="someservlet">
	<input type="text" name="userid" value="0"><br>
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
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create new profile</title>
</head>
<body>
<p><a href="../index.jsp">Back to login</a></p>
<h2>Create new profile</h2>
	<form method='post' action="someservlet">
	<span>Full Name: </span><input type="text" name="txtfullname"><br><br>
	<span>Gender</span><br>
	<input type="radio" name="gender" value="Male">Male
	<input type="radio" name="gender" value="Female">Female<br>
	State:<input type="text" name="State"><br>
	Street:<input type="text" name="street"><br>
	Zip Code:<input type="text" name="zipcode"><br>
	Bithr year:<input type="text" name="birthyear" pattern=""><br>
	Email:<input type="text" name="email" pa><br>
	Password:<input type="password" name="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"><br>
	Confirm password:<input type="password" name="confirmpassword" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"><br>
	<input type="submit" name="btnprofile" value="Submit">
	<input type="reset" name="reset" value="Reset">
	</form>
</body>
</html>
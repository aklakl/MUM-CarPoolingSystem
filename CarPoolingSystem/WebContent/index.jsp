<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<p><a href="view/createprofile.jsp">Create new profile</a></p>
	<h3>Login</h3>
	
	<form method='post' action="someservlet">
	<span>User Name: </span><input type="text" name="txtlogin"><br><br>
	<span>Password: </span><input type="password" name="txtlogin" pattern=""><br>
	<input type="submit" name="btnlogin" value="Login">
	The date is: <%=new Date()%>
	
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
 <%@ page import="Model.Users" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Login</title>
</head>
<body>


<%
session.removeAttribute("logedinuser");
%>


	<p><a href="view/createprofile.jsp">Create new profile</a></p>
	<h3>Login</h3>
	
	<form method='post' action="UserControler">
	<span>User Name: </span><input type="text" name="txtusername"><br><br>
	<span>Password: </span><input type="password" name="password" ><br>
	<input type="submit" name="btnlogin" value="Login">
	<p name="info">${message}</p>
	The date is: <%=new Date()%>
	
	</form>
</body>
</html>
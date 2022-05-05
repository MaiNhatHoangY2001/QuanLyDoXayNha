<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>SE Company Home Page</h2>
	<hr>
	<p>Welcome to the SE company home page yoyo!</p>
	
	<p>
		
	</p>
	
	
	<form:form	action="${pageContext.request.contextPath }/logout" method="POST">
		<input type="submit" value="Logout">
	</form:form>
</body>
</html>
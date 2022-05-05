<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${param.error != null }">
		<i class="failed">Sorry! You entered invalid username/password</i>
	</c:if>
	<c:if test="${param.logout != null }">
		<i class="failed">You have been logged out</i>
	</c:if>
	<form:form
		action="${pageContext.request.contextPath }/authenticateTheUser"
		method="POST">
		<p>
			User name: <input type="text" name="username">
		</p>
		<p>
			Password: <input type="password" name="password">
		</p>
		<input type="submit" value="Login">
	</form:form>
</body>
</html>
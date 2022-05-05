<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>List Customers</title>
<!-- reference our style sheet -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
			<a 
				href="${pageContext.request.contextPath}/register/showRegistrationForm">Sign
				up</a> 
				<a 
				href="${pageContext.request.contextPath}/showMyLoginPage">login</a>
		</div>
	</div>
	<div id="container">
		<div id="content">
			<!-- put new button: Add Customer -->
			<input type="button" value="Add Customer"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button" />
			<security:authorize
				access="hasAnyRole('EMPLOYEE','MANAGER', 'ADMIN')">
				<span> User: <security:authentication
						property="principal.username" />, Role(s): <security:authentication
						property="principal.authorities" /> &nbsp; <%-- 				<a href="${pageContext.request.contextPath}/showMyLoginPage?logout">Logout</a> --%>
				</span>
				</nav>
				<form:form action="${pageContext.request.contextPath}/logout"
					method="POST">
					<input type="submit" value="Logout" />
				</form:form>
			</security:authorize>
			<%--  window.location.href returns the href (URL) of the current page
                            Changing the value of the property will redirect the page.--%>
			<!--  add our html table here -->
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<security:authorize access="hasAnyRole('ADMIN')">
							<td>
								<!-- display the update link --> <a href="${updateLink}">Update</a>
								| <a href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
							</td>
						</security:authorize>
					</tr>
				</c:forEach>

			</table>

		</div>

	</div>


</body>

</html>










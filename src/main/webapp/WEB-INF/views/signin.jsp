<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html>
<head>
	<title>myCalendar: <c:out value="${pageTitle}" /> </title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body onload='document.loginForm.id.focus();' class="header">
	<div class="container">
		<jsp:include page="./includes/header.jsp"/>
		    <c:if test="${message != null}">
		        <div class="alert alert-danger" id="message"><c:out value="${message}"/></div>
		    </c:if>
		    <c:if test="${not empty error}">
				<div class="alert alert-danger" id="message"><c:out value="${error}"/></div>
			</c:if>
			<c:if test="${not empty msg}">
				<div class="alert alert-danger" id="message"><c:out value="${msg}"/></div>
			</c:if>
			
			
 			<c:url value="/j_spring_security_check" var="LoginUrl" />
 			<form name='loginForm' action="${LoginUrl}" method='POST'>
			
			<table border="0">
				<tr>
					<td>E-mail:</td>
					<td><input type='text' name='email' /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type='password' name='password' /></td>
				</tr>
				<tr>
					<td colspan='2'><input name="submit" type="submit" value="submit" /></td>
				</tr>
		  	</table> 
		  	
			</form>
		<jsp:include page="./includes/footer.jsp"/>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body class="header">
	<div class="container">
		<jsp:include page="./includes/header.jsp"/>
		    <c:if test="${message != null}">
		        <div class="alert alert-danger" id="message"><c:out value="${message}"/></div>
		    </c:if>
			<form:form action="signupSuccess" method="post" commandName="userForm">
            <table border="0">
                <!--
                <tr>
                    <td colspan="2" align="center"><h2>Spring MVC Form Demo - Registration</h2></td>
                </tr>
                -->
                <!--
                <tr>
                    <td>User ID:</td>
                    <td><form:input path="id" /></td>
                </tr>
                -->
                <tr>
                    <td>E-mail:</td>
                    <td><form:input path="email" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><form:password path="password" /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><form:input path="name" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Signup" /></td>
                </tr>
            </table>
        </form:form>
		<jsp:include page="./includes/footer.jsp"/>
	</div>
</body>
</html>
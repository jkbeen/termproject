<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	<br>  events is </br>
	<div>
		<table border="1">
			<tr>
				<th>ID</th><th>Summary</th><th>Description</th>
			</tr>
			<c:forEach var="event" items="${EventList}">
			<tr>
				<td>${event.id}</td><td>${event.summary}</td><td>${event.description}</td>
			</tr> 
			</c:forEach>
		</table> 
	</div>
<jsp:include page="./includes/footer.jsp"/>
</div>
</body>
</html>
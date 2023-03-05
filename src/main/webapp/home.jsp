<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ include file="styleincludes.jsp"%>
	<title>To do list</title>
</head>
<body>
	<div id="container">
		<%@ include file="header.jsp"%>
		<main>
			<h2>Recently added</h2>
			<jsp:include page="list_todos.jsp" />
		</main>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ include file="styleincludes.jsp"%>
	<title>Search</title>
</head>
<body>
	<div id="container">
		<%@include file="header.jsp"%>
		<main>
			<h1>Search to do items</h1>
			<form action="search" id="searchForm">
				<label for="text">Item</label>
				<input required="true" name="text" id="text" />
				</label>
				<button type="submit">Search</button>
			</form>


			<c:if test="${!empty todos}">
				<jsp:include page="list_todos.jsp" />
			</c:if>

			<section>
				<p>${message}</p>
			</section>
		</main>
	</div>
</body>
</html>
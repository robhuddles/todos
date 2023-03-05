<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
	<%@ include file="styleincludes.jsp"%>
	<title>Add item</title>
</head>
<body>
	<div id="container">
		<%@include file="header.jsp"%>
		<main>
			<h2>Add item</h2>
			<sf:form modelAttribute="todo" method="post">
				<label for="text">Text</label>
				<sf:input required="true" path="text" id="text" />
				<label for="date">Due date</label>
				<sf:input required="true" path="dueDate" id="date" />
				<section>
					<sf:checkbox path="completed" id="completed" />
					<label for="completed">Completed</label>
				</section>
				<button type="submit">Add to do</button>
			</sf:form>
			<section>
				<p>${message}</p>
			</section>
		</main>
	</div>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${fn:length(todos) gt 0}">

	<section class="itemCards">
		<c:forEach var="todo" items="${todos}">
			<section class="item">
				<h3>${todo.text}</h3>
				<p>
					<c:choose>
						<c:when test="${todo.completed}">
							<span class="complete">Complete</span>
						</c:when>
						<c:otherwise>
							Incomplete
						</c:otherwise>
					</c:choose>
				</p>

				<c:choose>
					<c:when test="${todo.completed}">
						<p class="completed">Due: ${todo.dueDate}</p>
					</c:when>
					<c:otherwise>
						<p>Due: ${todo.dueDate}</p>
					</c:otherwise>
				</c:choose>

				<section class="actions">
					<p><a href="edit/${todo.id}">Edit</a>
						<a onclick="return confirm('Do you really want to delete?')" href="delete/${todo.id}">Delete</a>
					</p>
				</section>
			</section>
		</c:forEach>
	</section>
</c:if>

<c:if test="${fn:length(todos) == 0}">
	<h2>Sorry! No items found!</h2>
</c:if>
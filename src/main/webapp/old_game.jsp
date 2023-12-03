<%@page import="java.util.List"%>
<%@page import="com.entity.GameDtls"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.GameDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Old Game</title>
<%@include file="all_components/allCSS.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<div class="container p-5">

		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Game Name</th>
					<th scope="col">Developer</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				GameDAOImpl dao = new GameDAOImpl(DBConnect.getConn());
				List<GameDtls> list = dao.getGameByOld(email, "Old");
				for (GameDtls b : list) {
				%>
				<tr>
					<td><%=b.getGameName()%></td>
					<td><%=b.getDeveloper()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getGameCategory()%></td>
					<td><a
						href="delete_old_game?em=<%=email%>&&id=<%=b.getGameId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

	</div>

</body>
</html>
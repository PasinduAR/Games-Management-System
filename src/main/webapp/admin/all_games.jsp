<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DAO.GameDAOImpl"%>
<%@page import="com.entity.GameDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Games</title>
<%@include file="allCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center">Hello Admin</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Game Name</th>
				<th scope="col">Developer</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			GameDAOImpl dao = new GameDAOImpl(DBConnect.getConn());
			List<GameDtls> list = dao.getAllGames();
			for (GameDtls b : list) {
			%>
			<tr>
				<td><%=b.getGameId()%></td>
				<td><img src="../games/<%=b.getPhotoName()%>"
					style="width: 80px; height: 100px;"></td>
				<td><%=b.getGameName()%></td>
				<td><%=b.getDeveloper()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getGameCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_games.jsp?id=<%=b.getGameId()%>"
					class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a> <a
					href="../delete?id=<%=b.getGameId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>

	<div style="margin-top: 130px;">
		<%@include file="footer.jsp"%>
</body>
</html>
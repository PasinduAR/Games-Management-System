<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.GameDAOImpl"%>
<%@page import="com.entity.GameDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Latest Game</title>
<%@include file="all_components/allCSS.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid col-md-8 mx-auto">
		<div class="row p-3">
			<%
			GameDAOImpl dao = new GameDAOImpl(DBConnect.getConn());
			List<GameDtls> list = dao.getAllOldGame();
			for (GameDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="games/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getGameName()%></p>
						<p><%=b.getDeveloper()%></p>
						<p>
							Categories:<%=b.getGameCategory()%></p>
						<div class="row">
							<a href="view_games.jsp?gid=<%=b.getGameId()%>" class="btn btn-success btn-sm ml-5">View Details</a><a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.GameDAOImpl"%>
<%@page import="com.entity.GameDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="all_components/allCSS.jsp"%>

<style type="text/css">
.back-img {
	background: url("img/game1.jpg");
	height: 80vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

footer {
  background-color: #333;
  color: #fff;
  padding: 30px 0;
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.footer-section {
  flex: 1 1 300px;
}

.footer-section h3 {
  font-size: 18px;
  margin-bottom: 10px;
}

.footer-section p {
  margin: 0;
}

.social-links {
  list-style: none;
  padding: 0;
  display: flex;
}

.social-links li {
  margin-right: 10px;
}

.social-links a {
  color: #fff;
  font-size: 24px;
}

.footer-bottom {
  background-color: #222;
  text-align: center;
  padding: 10px 0;
}
</style>

</head>
<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2></h2>
	</div>

	<!-- Start Latest Games -->

	<div class="container ">
		<h3 class="text-center">Latest Games</h3>
		<div class="row">
			<%
			GameDAOImpl dao2 = new GameDAOImpl(DBConnect.getConn());
			List<GameDtls> list2 = dao2.getLatestGames();
			for (GameDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="games/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getGameName()%></p>
						<p><%=b.getDeveloper()%></p>
						<p>

							<%
							if (b.getGameCategory().equals("Old")) {
							%>
							Categories:<%=b.getGameCategory()%></p>
						<div class="row">
							<a href="view_games.jsp?gid=<%=b.getGameId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a><a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getGameCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?gid=<%=b.getGameId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>

							<a href="view_games.jsp?gid=<%=b.getGameId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a><a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center">
			<a href="all_latest_game.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End Latest Games -->

	<hr>

	<!-- Start Old Games -->

	<div class="container ">
		<h3 class="text-center">Old Games</h3>
		<div class="row">

			<%
			GameDAOImpl dao3 = new GameDAOImpl(DBConnect.getConn());
			List<GameDtls> list3 = dao2.getOldGames();
			for (GameDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="games/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getGameName()%></p>
						<p><%=b.getDeveloper()%></p>
						<p><%=b.getGameCategory()%></p>
						<p>
							Categories:<%=b.getGameCategory()%></p>

						<div class="row">
							<a href="view_games.jsp?gid=<%=b.getGameId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a><a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center">
			<a href="all_old_game.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- End Old Games -->

	<hr>

	<!-- Start Upcoming Games -->

	<div class="container ">
		<h3 class="text-center">Upcoming Games</h3>
		<div class="row">

			<%
			GameDAOImpl dao = new GameDAOImpl(DBConnect.getConn());
			List<GameDtls> list = dao.getNewGames();
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

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?gid=<%=b.getGameId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>

							<a href="view_games.jsp?gid=<%=b.getGameId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a><a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mb-5">
			<a href="all_upcoming_game.jsp"
				class="btn btn-danger btn-sm text-white ">View All</a>
		</div>
	</div>
	<!-- End Upcoming Games -->
	<%@include file="all_components/footer.jsp"%>
</body>
</html>
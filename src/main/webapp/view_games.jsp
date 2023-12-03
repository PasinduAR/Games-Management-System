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
<title>Insert title here</title>
<%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("gid"));
	GameDAOImpl dao = new GameDAOImpl(DBConnect.getConn());
	GameDtls b = dao.getGameById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="games/<%=b.getPhotoName()%>"
					style="height: 200px; width: 150px"><br>
				<h4 class="mt-3">
					Game Name:<span class="text-success"><%=b.getGameName()%></span>
				</h4>
				<h4>
					Developer Name: <span class="text-success"><%=b.getDeveloper()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getGameCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getGameName()%></h2>

				<%
				if ("Old".equals(b.getGameCategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-regular fa-envelope"></i>EMail:
					<%=b.getEmail()%></h5>
				<%
				}
				%>

				<div class="row ">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-sharp fa-solid fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>

				</div>

				<%
				if ("Old".equals(b.getGameCategory())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-sharp fa-solid fa-cart-plus"></i>Continue Shopping</a> <a
						href="" class="btn btn-danger"><i
						class="fa-solid fa-dollar-sign"></i>35.06</a>
				</div>

				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i
						class="fa-sharp fa-solid fa-cart-plus"></i>Add Cart</a> <a href=""
						class="btn btn-danger"><i class="fa-solid fa-dollar-sign"></i>35.06</a>
				</div>
				<%}
				%>
			</div>
		</div>
	</div>
</body>
</html>
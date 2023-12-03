<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.DAO.GameDAOImpl"%>
<%@page import="com.entity.GameDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Games</title>
<%@include file="allCSS.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Games</h4>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						GameDAOImpl dao = new GameDAOImpl(DBConnect.getConn());
						GameDtls b = dao.getGameById(id);
						%>

						<form action="../updategames" method="post">
							<input type="hidden" name="id" value="<%=b.getGameId() %>">
							<div class="form-group">
								<label for="exampleFormControlInput1">Game Name </label> <input
									type="text" name="gname" class="form-control"
									id="formGroupExampleInput" placeholder="Game Name...."
									value="<%=b.getGameName()%>">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">Developer Name </label> <input
									type="text" name="developer" class="form-control"
									id="formGroupExampleInput" placeholder="Developer Name...."
									value="<%=b.getDeveloper()%>">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">Price </label> <input
									type="text" class="form-control" name="price"
									id="formGroupExampleInput" placeholder="Price...."
									value="<%=b.getPrice()%>">
							</div>
							<div class="form-group">
								<label for="inputState">Game Status</label> <select
									name="status" id="inputState" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>

								</select>
							</div>
							<button type="submit" class="btn btn-primary col-md-12 mt-2">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
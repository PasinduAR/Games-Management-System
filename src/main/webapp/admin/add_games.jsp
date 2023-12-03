<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Games</title>
<%@include file="allCSS.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Games</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="../add_games" method="post"
							enctype='multipart/form-data'>
							<div class="form-group">
								<label for="exampleFormControlInput1">Game Name </label> <input
									type="text" name="gname" class="form-control"
									id="formGroupExampleInput" placeholder="Game Name....">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">Developer Name </label> <input
									type="text" name="developer" class="form-control"
									id="formGroupExampleInput" placeholder="Developer Name....">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">Price </label> <input
									type="text" class="form-control" name="price"
									id="formGroupExampleInput" placeholder="Price....">
							</div>
							<div class="form-group">
								<label for="inputState">Games Categories</label> <select
									name="categories" id="inputState" class="form-control">
									<option selected>Choose...</option>
									<option value="New">New Game</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Game Status</label> <select
									name="status" id="inputState" class="form-control">
									<option selected>Choose...</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">Upload Image </label> <input
									type="file" name="gimg" class="form-control-file"
									id="formGroupExampleInput">
							</div>
							<button type="submit" class="btn btn-primary col-md-12 mt-2">Add</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
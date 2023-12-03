<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Game</title>
<%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary p-1">Sell Old Game</h5>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="add_old_game" method="post"
							enctype='multipart/form-data'>

							<input type="hidden" value="${userobj.email}" name="user">

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
								<label for="exampleFormControlInput1">Upload Image </label> <input
									type="file" name="gimg" class="form-control-file"
									id="formGroupExampleInput">
							</div>
							<button type="submit" class="btn btn-primary col-md-12 mt-2">Sell</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
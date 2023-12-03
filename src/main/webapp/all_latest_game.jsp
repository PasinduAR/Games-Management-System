<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.GameDAOImpl"%>
<%@page import="com.entity.GameDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
	showToast();
	function showToast(content)
	{
		$('#toast').addClass("display");
		$('#toast').html(content);
		setTimeout(()=>{
			$("#toast").removeClass("display");
		},2000)
	}
</script>

		<c:remove var="addCart" scope="session" />

	</c:if>

	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid col-md-8 mx-auto">
		<div class="row p-3">
			<%
			GameDAOImpl dao2 = new GameDAOImpl(DBConnect.getConn());
			List<GameDtls> list2 = dao2.getAllLatestGame();
			for (GameDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
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
							<a href="" class="btn btn-success btn-sm ml-5">View Details</a><a
								href="" class="btn btn-danger btn-sm ml-1"><i
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

							<a href="" class="btn btn-success btn-sm ml-1">View Details</a><a
								href="" class="btn btn-danger btn-sm ml-1"><i
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
	</div>
		<%@include file="all_components/footer.jsp"%>
	
</body>
</html>
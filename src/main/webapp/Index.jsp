<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Index </title>
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">

</head>
<body style="background-color: #151922">
	<%@ include file="crudNavbar.jsp" %>

	<div class="container">
		<div class="row mt-5 text-center">
			<div class="col-12">
				<a class="btn btn-dark m-2" href="register" style="padding: 150px 100px;"> CREATE </a>
				<a class="btn btn-primary m-2" href="all" style="padding: 150px 100px;"> READ </a>
				<a class="btn btn-warning m-2" href="updateAll" style="padding: 150px 100px;"> UPDATE </a>
				<a class="btn btn-danger m-2" href="deleteAll" style="padding: 150px 100px;"> DELETE </a>
			</div>
		</div>
	</div>
	
	<div class="navbar info-section">
		<p style="  font-family: arial;
					font-size: 4vw;
					font-weight: bolder;" class="container-fluid justify-content-center mt-4"> Your Servlet-powered data control center. </p>
	</div>

</body>
</html>
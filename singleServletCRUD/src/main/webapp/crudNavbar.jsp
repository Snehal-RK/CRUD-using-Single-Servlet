<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Navbar </title>
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
</head>

<!-- <style>
	body{
		background-color: #d2cef5;
	}
</style> -->

<body>

	<nav class="navbar navbar-light bg-dark mt-2 mb-5">
		<form class="container-fluid justify-content-center">
	 			<a class="btn btn-outline-success float-left m-2" href="index" type="button"> Home </a>
				<a class="btn btn-outline-light m-2" href="register" type="button"> CREATE </a>
				<a class="btn btn-outline-primary m-2" href="all" type="button"> READ </a>
				<a class="btn btn-outline-warning m-2" href="updateAll" type="button"> UPDATE </a>
				<a class="btn btn-outline-danger m-2" href="deleteAll" type="button"> DELETE </a>
		</form>
	</nav>

</body>
</html>
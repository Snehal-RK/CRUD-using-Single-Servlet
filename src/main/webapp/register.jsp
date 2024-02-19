<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Register </title>
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
</head>
<body style="background-color: #c4c4c4">
	<%@ include file="crudNavbar.jsp" %>
	
	<!-- Registration form to perform Create Request -->
	<div class="container">
		<div class="row mt-5">
			<div class="offset-3 col-6">
				<div class="card bg-dark text-light">
					<div class="card-header text-center">
						<h2> REGISTER </h2>
					</div>
					<div class="card-body">
						<form action="register" method="post">
							<div class="form-group">
								<label> Username </label>
								<input type="text" name="regUsername" class="form-control mb-2">
								
								<label> Password </label>
								<input type="text" name="regPassword" class="form-control mb-2">
								
								<label> Contact </label>
								<input type="text" name="regContact" class="form-control mb-2">
								
								<input type="submit" class="form-control btn btn-primary mt-2" value="Register">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
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
						<form action="register" name="regForm" method="post" onsubmit="return validateForm()">
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
					
					<div>
                        <p id="errorDiv" class="text-danger pl-3">
                            <% String errorMessage = (String) request.getAttribute("errorMessage");
                            if (errorMessage != null && !errorMessage.isEmpty()) {
                                out.println(errorMessage);
                            } %>
                        </p>
                    </div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		function validateForm() {
			const username = document.forms["regForm"]["regUsername"].value.trim();
			const password = document.forms["regForm"]["regPassword"].value.trim();
			const contact = document.forms["regForm"]["regContact"].value.trim();
			
			let errorMsg = "";
			
			if(username === "") {
				errorMsg += "Username is required. <br>";
			}
			
			if(password === "") {
				errorMsg += "Password is required. <br>";
			}
			
			if(contact === "") {
				errorMsg += "Contact is required. <br>";
			}
			else if(isNaN(contact) || contact.length != 10) {
				errorMsg += "Contact must be a 10-digit number. <br>";
			}
			
			if (errorMsg !== "") {
		        document.getElementById("errorDiv").innerHTML = errorMsg;
		        return false; // Prevent form submission
		    }
			
			return true;
		}
	</script>
	
	
</body>
</html>
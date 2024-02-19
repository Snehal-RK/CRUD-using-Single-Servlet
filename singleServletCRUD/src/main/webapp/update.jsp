<%@page import="userEntity.UserEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.awt.desktop.UserSessionEvent"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> UPDATE DETAILS </title>
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
</head>
<body style="background-color: #fffec4">

	<!-- Update Request - performing select query with where clause to fetch data for perticular id to be updated
		 later be stored into database with the post mehod -->
		 
	<div class="container mt-5">
		<div class="row">
			<div class="offset-3 col-6">
				
				<div class="card bg-dark text-light">
					
					<div class="card-header text-center">
						<h2> UPDATE DETAILS </h2>
					</div>
					
					<div class="card-body">
					
					<%
						List<UserEntity> entity = (List) request.getAttribute("userData");
					
						if(request.getAttribute("userData") != null){
							Iterator<UserEntity> iterator = entity.iterator();
							while(iterator.hasNext()){
								UserEntity data = iterator.next();
					%>
						<form class="form-group" action="update" method="post">
							<label> Username </label>
							<input type="text" name="updateUsername" class="form-control mb-2" value="<%= data.getUsername() %>">
							
							<label> Password </label>
							<input type="text" name="updatePassword" class="form-control mb-2" value="<%= data.getPassword() %>">
							
							<label> Contact </label>
							<input type="text" name="updateContact" class="form-control mb-2" value="<%= data.getContact() %>">
							
							<input type="hidden" name="hid" value="<%= data.getId() %>">
							<input type="submit" value="Update" class="btn btn-warning form-control mt-2">
						</form>
						<%
							}
						}
						%>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript" src="Bootstrap/jquery.js"></script>
	<script type="text/javascript" src="Bootstrap/bootstrap.min.js"></script>

</body>
</html>
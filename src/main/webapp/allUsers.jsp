<%@page import="userEntity.UserEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.awt.desktop.UserSessionEvent"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Users </title>
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
</head>
<body style="background-color: #c4c7ff">
	<%@ include file="crudNavbar.jsp" %>
	
	<!-- Read Request - selected dat through select query in tabular format -->
	<div class="container">
		<div class="row">
			<div class="offset-2 col-8">
				<table class="table rounded text-center bg-dark text-light">
					<thead>
						<tr>
							<th> id </th>
							<th> Username </th>
							<th> Password </th>
							<th> Contact </th>
						</tr>
					</thead>
					
					<tbody>
							<%
								int n = 0;
								List<UserEntity> userList = (List) request.getAttribute("userList");
								if(request.getAttribute("userList") != null){
									
									Iterator<UserEntity> iterator = userList.iterator();
									while(iterator.hasNext()){
										UserEntity entity = iterator.next();
							%>
							<tr>
								<td> <%= ++n %> </td>
								<td> <%= entity.getUsername() %> </td>
								<td> <%= entity.getPassword() %> </td>
								<td> <%= entity.getContact() %> </td>
							</tr>
							<%
									}
								}
							%>
					</tbody>
				
				</table>
			</div>
		</div>
	</div>

</body>
</html>
package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import userEntity.UserEntity;

import java.io.IOException;
import java.util.List;

import dbOperations.DBOperations;


public class CRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CRUD() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// returns type of method
		String method = request.getMethod();
		
		// getRequetURI() - returns requested URL
		String reqType = request.getRequestURI();
		
		// Results array to get proper servlet request
		String array[] = reqType.split("/");
		
		// To verify the type of servlet request
		String servletRequest = array[2];
		
		// Default request
		if(servletRequest.equals("crud") && method.equals("GET")) {
			response.sendRedirect("Index.jsp");
		}

		else if(servletRequest.equals("index")) {
			response.sendRedirect("Index.jsp");
		}
		
		// Create Request - insert query
		else if(servletRequest.equals("register")) {
			response.sendRedirect("register.jsp");
		}
		
		// Read Request - select query
		else if(servletRequest.equals("all")) {
			DBOperations select = new DBOperations();
			List<UserEntity> userList = select.selectData();
			
			request.setAttribute("userList", userList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("allUsers.jsp");
			dispatcher.forward(request, response);
		}
		
		// Read to make changes - select for update query
		else if(servletRequest.equals("updateAll")) {
			DBOperations updateList = new DBOperations();
			List<UserEntity> userList = updateList.selectData();
			
			request.setAttribute("userList", userList);
			RequestDispatcher updateDispatcher = request.getRequestDispatcher("updateAll.jsp");
			updateDispatcher.forward(request, response);
		}
		
		// Update Request - update query
		else if(servletRequest.equals("update")) {
			DBOperations update = new DBOperations();
			List<UserEntity> userDetails = update.selectParticular(Long.parseLong(request.getParameter("id")));
			
			request.setAttribute("userData", userDetails);
			RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
			dispatcher.forward(request, response);
		}
		
		// Delete Request - select for delete query
		else if(servletRequest.equals("deleteAll")) {
			DBOperations deleteList = new DBOperations();
			List<UserEntity> userList = deleteList.selectData();
			
			request.setAttribute("userList", userList);
			RequestDispatcher updateDispatcher = request.getRequestDispatcher("deleteAll.jsp");
			updateDispatcher.forward(request, response);
		}
		
		// Delete Request - delete query
		else if(servletRequest.equals("delete")) {
			DBOperations delete = new DBOperations();
			delete.deleteData(Long.parseLong(request.getParameter("id")));
			response.sendRedirect("deleteAll");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getMethod();
		String reqType = request.getRequestURI();
		String array[] = reqType.split("/");
		
		String servletRequest = array[2];
		
		// Create - store data to the database through form with post method
		if(servletRequest.equals("register") && method.equals("POST")) {
			UserEntity entity = new UserEntity();
			entity.setUsername(request.getParameter("regUsername"));
			entity.setPassword(request.getParameter("regPassword"));
			entity.setContact(Long.parseLong(request.getParameter("regContact")));
			
			DBOperations insert = new DBOperations();
			int insertResult = insert.insertData(entity);
			
			if(insertResult != 0) {
				response.sendRedirect("success.jsp");
			}
			else {
				response.sendRedirect("failed.jsp");
			}
		}
		
		// Update - store updations after replace to the previous data with post method
		else if(servletRequest.equals("update") && method.equals("POST")) {
			UserEntity entity = new UserEntity();
			entity.setUsername(request.getParameter("updateUsername"));
			entity.setPassword(request.getParameter("updatePassword"));
			entity.setContact(Long.parseLong(request.getParameter("updateContact")));
			entity.setId(Long.parseLong(request.getParameter("hid")));
			
			DBOperations update = new DBOperations();
			int updateResult = update.updateData(entity);
			
			if(updateResult > 0) {
				response.sendRedirect("all");
			}
			else {
				response.sendRedirect("failed.jsp");
			}
		}
	}
}

package dbOperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import userEntity.UserEntity;

public class DBOperations {
	
	// connection
	Connection connection = null;
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/useroperations","root","");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	// Insert Query
	public int insertData(UserEntity entity) {
		int insertResult = 0;
		this.connection = getConnection();
		try {
			PreparedStatement insertStatement = connection.prepareStatement("INSERT INTO userentities (username, password, contact) VALUE (?, ?, ?)");
			insertStatement.setString(1, entity.getUsername());
			insertStatement.setString(2, entity.getPassword());
			insertStatement.setLong(3, entity.getContact());
			insertResult = insertStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insertResult;
	}
	
	// Select Query
	public List<UserEntity> selectData() {
		List<UserEntity> userList = new ArrayList<UserEntity>();
		this.connection = getConnection();
		try {
			PreparedStatement selectStatement = connection.prepareStatement("SELECT * FROM userentities");
			ResultSet result = selectStatement.executeQuery();
			while(result.next()) {
				UserEntity entity = new UserEntity();
				entity.setId(result.getLong(1));
				entity.setUsername(result.getString(2));
				entity.setPassword(result.getString(3));
				entity.setContact(result.getLong(4));
				userList.add(entity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	
	// Select particular
	public List<UserEntity> selectParticular(long id){
		List<UserEntity> user = new ArrayList<UserEntity>();
		this.connection = getConnection();
		try {
			PreparedStatement selectParticularStatement = connection.prepareStatement("SELECT * FROM userentities WHERE id=?");
			selectParticularStatement.setLong(1, id);
			ResultSet result = selectParticularStatement.executeQuery();
			while(result.next()) {
				UserEntity entity = new UserEntity();
				entity.setId(result.getLong(1));
				entity.setUsername(result.getString(2));
				entity.setPassword(result.getString(3));
				entity.setContact(result.getLong(4));
				user.add(entity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	// Update Query
	public int updateData(UserEntity entity) {
		int updateResult = 0;
		this.connection = getConnection();
		try {
			PreparedStatement updateStatement = connection.prepareStatement("UPDATE userentities SET username=?, password=?, contact=? WHERE id=?");
			updateStatement.setString(1, entity.getUsername());
			updateStatement.setString(2, entity.getPassword());
			updateStatement.setLong(3, entity.getContact());
			updateStatement.setLong(4, entity.getId());
			updateResult = updateStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateResult;
	}
	
	// Delete Query
	public void deleteData(long id) {
		this.connection = getConnection();
		try {
			PreparedStatement deleteStatement = connection.prepareStatement("DELETE FROM userentities WHERE id=?");
			deleteStatement.setLong(1, id);
			deleteStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

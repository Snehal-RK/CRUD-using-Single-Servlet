package userEntity;

// Intermidiatary class which transfers real time data to the servlet through object to perform further database operations

public class UserEntity {
	
	// variable through which data would be getting transfered to the database 
	public String username, password;
	public long id, contact;
	
	public UserEntity(String username, String password, long id, long contact) {
		super();
		this.username = username;
		this.password = password;
		this.id = id;
		this.contact = contact;
	}
	
	public UserEntity() {
		super();
	}
	
	// getters and setters are required to set and use real time data throughout the process of execution 
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}
}

package pojo;

import java.util.Date;

public class StudentNotification {
	 int idPrimary;
     int id;
     String message;
     Date time;
     
     
	public int getIdPrimary() {
		return idPrimary;
	}
	public void setIdPrimary(int idPrimary) {
		this.idPrimary = idPrimary;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
     
     
}

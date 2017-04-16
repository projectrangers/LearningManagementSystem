package admin.action;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateStaffAction extends ActionSupport {
	String email;
	
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String delete() throws ClassNotFoundException, SQLException{
		Connection cn=DataBaseConnection.connect();
		String sql="DELETE from staff  WHERE staff_email='"+email+"'";
		int status=0;
		System.out.println(sql);
		Statement st=cn.createStatement();
		try{
		status=st.executeUpdate(sql);
		}catch(Exception e){
			addFieldError("message", "cannot DELETE!!"+e.toString());
			return INPUT;
		}
		st.close();
		cn.close();
		if(status>0){
		addFieldError("message","Deleted SuccessFully!!");
		return INPUT;
		}else {addFieldError("message", "SOMETHING WENT WRONG!!!"); return ERROR;}
			}
			

}

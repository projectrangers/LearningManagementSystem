package student.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ChangePasswordAction extends ActionSupport {
	private String oldPassword;
	private String newPassword;
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
@Override
public void validate(){
	
	
	try{
	Connection cn=DataBaseConnection.connect();
	  String sql="select password from student where email='"+email+"'";
	  Statement st=cn.createStatement();
      ResultSet rs=st.executeQuery(sql);
      rs.next();
      String pwd=rs.getString("password");
      rs.close();
      st.close();
      cn.close();
      if(!oldPassword.equals(pwd)){
    	  addFieldError("message","Invalid old password entered!!");
      }
	}catch(Exception e){
		System.out.println(e.toString());;
	}
 

}
	
	
	
	
@Override
public String execute() throws Exception{
	Connection cn=DataBaseConnection.connect();
	String sql="UPDATE student SET password=? WHERE email='"+email+"'";
   PreparedStatement st=cn.prepareStatement(sql);
   st.setString(1,newPassword);
  int status= st.executeUpdate();
  st.close();
  cn.close();
  if(status>0){
	  addActionMessage("Password change successfully!!!");
	  return SUCCESS;
  }else 
	  addActionMessage("Something Wrong happen!!");
         return INPUT;
    

}

}

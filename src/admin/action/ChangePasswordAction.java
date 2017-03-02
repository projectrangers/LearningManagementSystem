package admin.action;

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
	  String sql="select staff_password from staff where staff_name='admin' AND staff_role='admin'";
	  Statement st=cn.createStatement();
      ResultSet rs=st.executeQuery(sql);
      rs.next();
      String pwd=rs.getString("staff_password");
      rs.close();
      st.close();
      cn.close();
      if(oldPassword.length()>0){
      if(!oldPassword.equals(pwd)){
    	  addFieldError("message","Invalid old password entered!!");
      }}
	}catch(Exception e){
		System.out.println(e.toString());;
	}
	if(newPassword.length()<3){
		addFieldError("message","new Password canot be blank!!" );
	}
	if(oldPassword.length()<3){
		addFieldError("message","old password cannot be blank!!" );
	}
 

}
	
	
	
	
@Override
public String execute() throws Exception{
	Connection cn=DataBaseConnection.connect();
	String sql="UPDATE staff SET staff_password=? WHERE staff_name='admin' AND staff_role='admin'";
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

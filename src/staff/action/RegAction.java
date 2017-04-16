package staff.action;


import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

import staff.DTO.RegisterStaffDTO;
import student.dto.RegisterStudentDTO;


@SuppressWarnings("serial")
public class RegAction extends ActionSupport{
	
 private String  name;
 private String mobile;
 private String email;
 private String password;
 private String role;
 private String preference;
 
 
public String getPreference() {
	return preference;
}

public void setPreference(String preference) {
	this.preference = preference;
}

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}

 
@Override
public String execute() throws Exception {
	Boolean status = false;
	System.out.println("under execute;"+name+mobile+email+password+role+preference);    //OK
	try{
  status=RegisterStaffDTO.doRegister(name, mobile, email, password, role, preference);
	}catch(Exception e){
		addFieldError("message", "DUPLICATE ENTRY");
		return ERROR;
	}
	
	if(status){
	 // RegisterStudentDTO.updateAvailableSeat(course);
	return SUCCESS;
     }
else  return ERROR;
    }

}

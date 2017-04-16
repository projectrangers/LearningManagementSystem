package staff.action;

import com.opensymphony.xwork2.ActionSupport;

import staff.DTO.UpdateProfileDTO;

public class UpdateProfileAction extends ActionSupport{
	String name;
	String role;
	String mobile;
	String email;
	String password;
    String preference; 
    String qualification;
    String address;
    String experience;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
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
	public String getPreference() {
		return preference;
	}
	public void setPreference(String preference) {
		this.preference = preference;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
    
	
	
	
	
	
	public String execute() throws Exception {
		System.out.println("update profile action:"+name+mobile+email+mobile+preference+address+qualification+role+password);
		Boolean status = false;
		try{
	  status=UpdateProfileDTO.doUpdate(name, mobile, email, password, role, preference,address,qualification,experience);
		}catch(Exception e){
			addFieldError("message", "DUPLICATE ENTRY");
			return ERROR;
		}
		
		if(status){
			addFieldError("message", "changes saved");
		return SUCCESS;
	     }
	else  return ERROR;
	    }
}

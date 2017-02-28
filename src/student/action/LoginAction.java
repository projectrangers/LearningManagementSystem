package student.action;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import student.dao.StudentAuthenticate;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements SessionAware {
	private SessionMap<String,Object> sessionMap; 
	private String email;
	private String password;
	//VALIDATION
	/*@Override
	public void validate() {
		if(email.isEmpty()){
			addFieldError("email", "email cant be empty");
		}
		if(password.isEmpty()){
			addFieldError("password", "password cant be empty");
		}
	}*/
	
	
	
	//GETTER AND SETTERS
	
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
	
	 

	@Override
	public void setSession(Map<String, Object> map) {
		sessionMap=(SessionMap<String, Object>)map;
		
	}
	//EXECUTE
		@Override
		public String execute() throws Exception {
			StudentAuthenticate val=new StudentAuthenticate();
			Boolean result=val.validate(email,password);
			if(result==true)
			{
				sessionMap.put("login","true");  
			    sessionMap.put("email",email); 
			    sessionMap.put("user","student");
				return SUCCESS;
				
		    }else if(result==false){
		    	addFieldError("message","Invalid username or Password");
		    	return INPUT;
		    }
		    else return ERROR;
		}
		
		/*public String logout(){  
		    if(sessionMap!=null){  
		        sessionMap.invalidate();  
		    }  
		    return SUCCESS;  
}*/
	

}

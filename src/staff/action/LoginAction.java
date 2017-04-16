package staff.action;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import staff.DAO.StaffAuthentication;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements SessionAware{
	
	private SessionMap<String,Object> sessionMap; 
	private String email ;
	private String password;
	
	
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
			StaffAuthentication val=new StaffAuthentication();
			Boolean result=val.validate(email,password);
			if(result==true)
			{
				sessionMap.put("login","true");  
			    sessionMap.put("email",email);  ///to get profile
			    sessionMap.put("user","staff");
				return SUCCESS;
				
		    }else if(result==false){
		    	addFieldError("message","Invalid email or Password");
		    	return INPUT;
		    }
		    else return ERROR;
		}
	
}

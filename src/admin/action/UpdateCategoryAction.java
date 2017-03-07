package admin.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UpdateCategoryAction extends ActionSupport {
	public String isactive;
	public String name;
	
	
	public String getIsactive() {
		return isactive;
	}


	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	
	public String edit() throws ClassNotFoundException, SQLException{
		System.out.println(getName());
		System.out.println(getIsactive());
		Connection cn=	DataBaseConnection.connect();
	   String sql="update category set isactive=? where name=?";
	  PreparedStatement st= cn.prepareStatement(sql);
	st.setString(1, isactive);
	st.setString(2,name);
	System.out.println(sql);
	int status=st.executeUpdate();
	st.close();
	cn.close();
	if(status>0){
		addFieldError("messsage",name+":SUCCESSFULLY EDITED");
		return SUCCESS;
	}else if(status==0){
		addFieldError("message", "!!!Can't Be edited!");
		return INPUT;
	}else
		addFieldError("message", "SORRY SOME ERROR OCCUERD");
	   return ERROR;
	}
	
	public String delete() throws Exception {
		Connection cn=DataBaseConnection.connect();
		String sql="delete from category where course_name='"+name+"'";
	    Statement st=	cn.createStatement();
	    int i=st.executeUpdate(sql);
	    st.close();
	     cn.close();
		if(i>0){
			addFieldError("message", name+": deleted Successfully!!!");
			return SUCCESS;
		}else if(i==0){
			addFieldError("message","can't deleted!!");
			return INPUT;
		}
		else
			{addFieldError("message","Something went wrong!!");
			return ERROR;}
	}
	
	public String add() throws ClassNotFoundException, SQLException{
		Connection cn=	DataBaseConnection.connect();
		  String sql="INSERT INTO category(name,isactive) values(?,?)";
		  PreparedStatement st= cn.prepareStatement(sql);
		st.setString(1, name);
		st.setString(2,isactive);
		int status=0;
		//System.out.println(sql);
		try{
		status=st.executeUpdate();
		}catch(Exception e){
			addFieldError("message","Name Already Exist");
			return INPUT;
		}
		st.close();
		cn.close();
		if(status>0){
			addFieldError("messsage",name+":Successfully added-Add More!");
			return SUCCESS;
		}else if(status==0){
			addFieldError("message", "!!!Can't Be Added");
			return INPUT;
		}else
			addFieldError("message", "SORRY SOME ERROR OCCUERD");
		   return ERROR;
		}
}

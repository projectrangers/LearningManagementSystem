package admin.action;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateStudentAction extends ActionSupport {
public String id;




	public String getId() {
	return id;
}




public void setId(String id) {
	this.id = id;
}




	public String delete() throws ClassNotFoundException, SQLException{
Connection cn=DataBaseConnection.connect();
String sql="DELETE FROM student WHERE email='"+id+"'";
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
	
	public String deactivate() throws ClassNotFoundException, SQLException{
		Connection cn=DataBaseConnection.connect();
		String sql="update student set isactive='no' WHERE email='"+id+"'";
		int status=0;
		System.out.println(sql);
		Statement st=cn.createStatement();
		try{
		status=st.executeUpdate(sql);
		}catch(Exception e){
			addFieldError("message", "cannot Deactive!!"+e.toString());
			return INPUT;
		}
		st.close();
		cn.close();
		if(status>0){
		addFieldError("message","Deactivated SuccessFully!!");
		return INPUT;
		}else {addFieldError("message", "SOMETHING WENT WRONG!!!"); return ERROR;}
			}
	
	public String activate() throws ClassNotFoundException, SQLException{
		Connection cn=DataBaseConnection.connect();
		String sql="update student set isactive='yes' WHERE email='"+id+"'";
		int status=0;
		System.out.println(sql);
		Statement st=cn.createStatement();
		try{
		status=st.executeUpdate(sql);
		}catch(Exception e){
			addFieldError("message", "cannot activate!!"+e.toString());
			return INPUT;
		}
		st.close();
		cn.close();
		if(status>0){
		addFieldError("message","activated SuccessFully!!");
		return INPUT;
		}else {addFieldError("message", "SOMETHING WENT WRONG!!!"); return ERROR;}
			}
	

}

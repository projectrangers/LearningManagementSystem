package admin.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

import pojo.StudentNotification;

public class SendMessageAction extends ActionSupport{
	int id;
	String message;
	
	
	
	

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




@Override
	public String execute() throws Exception {
		Connection cn=	DataBaseConnection.connect();
		String sql="INSERT INTO student_notification(notification_id,message) values("+id+",'"+message+"')";
		System.out.println(sql);
		Statement st=cn.createStatement();

		int rs=st.executeUpdate(sql);
		st.close();
		cn.close();
		if(rs>0){
			addFieldError("msg","MESSAGE SENT!!");
			System.out.println("success ho gya!!");
			return SUCCESS;
		}else return ERROR;
		
	}
	/*//TEST
	public static void main(String[] args) throws Exception {
		SendMessageAction k=new SendMessageAction();
	System.out.println(k.execute(74,"hello test"));	;
		
	}*/

}

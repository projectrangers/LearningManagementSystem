package student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.database.DataBaseConnection;

public class StudentAuthentication {

	public Boolean validate(String email,String password) throws ClassNotFoundException, SQLException {
		Connection cn=DataBaseConnection.connect();
	String sql="select * from student where email=? AND password=?";
	PreparedStatement st=cn.prepareStatement(sql);
	st.setString(1, email);
	st.setString(2, password);
ResultSet rs=st.executeQuery();
Boolean status=rs.next();
System.out.println("this is status under student validate:>>"+status);
st.close();
cn.close();
return status;
   
		
	}
	
	
	
	public Boolean validateIsActive(String email,String password) throws ClassNotFoundException, SQLException {
		Connection cn=DataBaseConnection.connect();
	String sql="select * from student where email='"+email+"' AND password='"+password+"' AND isactive='yes' ";
	System.out.println("this is  under student validate:"+sql);
	Statement st=cn.createStatement();
	
ResultSet rs=st.executeQuery(sql);
Boolean status=rs.next();
System.out.println("this is status under student validateIsactive:>>"+status);
st.close();
cn.close();
return status;
   
		
	}
	
	

}

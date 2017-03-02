package admin.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.DataBaseConnection;

public class AdminAuthentication {


	public Boolean validate(String email,String password) throws ClassNotFoundException, SQLException {
	Connection cn=DataBaseConnection.connect();
	String sql="select * from staff where staff_email=? AND staff_password=? AND staff_role='admin'";
	PreparedStatement st=cn.prepareStatement(sql);
	st.setString(1, email);
	st.setString(2, password);
ResultSet rs=st.executeQuery();
Boolean status=rs.next();
System.out.println("this is status under admin authentication class:>>"+status);
st.close();
cn.close();
return status;
   
		
	}

}
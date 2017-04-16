package staff.DTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.database.DataBaseConnection;

public class RegisterStaffDTO {

	public static Boolean doRegister(String name, String mobile, String email, String password, String role,String preference) throws ClassNotFoundException, SQLException {
			int status = 0;
		try{	
			Connection cn=DataBaseConnection.connect();
			
	  String sql="INSERT INTO staff (staff_name,staff_role,staff_mobile,course_preference,staff_email,staff_password) VALUES (?,?,?,?,?,?)";
	  PreparedStatement ps=cn.prepareStatement(sql);
		
			ps.setString(1,name);
			ps.setString(2,role);
			ps.setString(3,mobile);
			ps.setString(4,preference);
			ps.setString(5,email);
			ps.setString(6,password);
			
		  status=ps.executeUpdate();
		}catch(Exception e){
		  System.out.println("this is error"+e.toString());
		}
					if(status!=0){
						//ps.close();
						//cn.close();
						return true;
					}
						else return false;
			
	}
}
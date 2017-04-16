package staff.DTO;

import java.sql.Connection;
import java.sql.Statement;

import com.database.DataBaseConnection;

public class UpdateProfileDTO {

	public static Boolean doUpdate(String name, String mobile, String email, String password, String role,
			String preference, String address, String qualification, String experience) {
		
		
		int status = 0;
		try{	
			Connection cn=DataBaseConnection.connect();
			
	  String sql="update staff set staff_name='"+name+"' ,staff_role='"+role+"' ,staff_mobile='"+mobile+"', course_preference='"+preference+"' , staff_password='"+password+"', address='"+address+"' ,experience='"+experience+"' ,qualification='"+qualification+"' where staff_email='"+email+"' ";
	  System.out.println(sql);   
	  Statement st= cn.createStatement();
	     status=st.executeUpdate(sql);
		
		}catch(Exception e){
		  System.out.println("this is error under updateprofileDTO "+e.toString());
		}
					if(status!=0){
						;
						return true;
					}
						else return false;
	}

}

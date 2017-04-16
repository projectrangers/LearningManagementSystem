package staff.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.database.DataBaseConnection;

import pojo.Staff;

public class StaffProfileDAO {
	 
	public static Staff getfullProfile(String email) throws ClassNotFoundException, SQLException{
		Connection cn=DataBaseConnection.connect();
		Staff staff=new Staff();
		String sql="select *from staff where staff_email='"+email+"'";
		System.out.println("ye hai querry"+sql);
	   Statement st= cn.createStatement();
	  ResultSet rs=st.executeQuery(sql);
	  rs.next();
	  staff.setName(rs.getString("staff_name"));
	  staff.setEmail(rs.getString("staff_email"));
	  staff.setMobile(rs.getString("staff_mobile"));
	  staff.setPassword(rs.getString("staff_password"));
	  staff.setRole(rs.getString("staff_role"));
	  staff.setCourse_preference(rs.getString("course_preference"));
	  staff.setQualification(rs.getString("qualification"));
	  staff.setExperience(rs.getString("experience"));
	  staff.setAddress(rs.getString("address"));
	  return staff;
  }
	
	
	
	public static int countStaff() throws ClassNotFoundException, SQLException{
		int count = 0;
		Connection cn=	DataBaseConnection.connect();
		String sql="SELECT count(*) as count from staff";
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		rs.next();
		count=rs.getInt("count");
		rs.close();
		st.close();
		cn.close();
		return count;
	}
	
	public static ArrayList<Staff> getAllStaff() throws ClassNotFoundException, SQLException{
		Connection cn=DataBaseConnection.connect();
		
	ArrayList<Staff> list=new ArrayList<>();	
	String sql="select *from staff";
	  Statement st= cn.createStatement();
	  ResultSet rs=st.executeQuery(sql);
	  
	  while(rs.next()){
	 System.out.println(rs.getString("staff_name"));
	  Staff staf=new Staff();
	  staf.setName(rs.getString("staff_name"));
	  staf.setEmail(rs.getString("staff_email"));
	  staf.setMobile(rs.getString("staff_mobile"));
	  staf.setPassword(rs.getString("staff_password"));
	  staf.setRole(rs.getString("staff_role"));
	  staf.setCourse_preference(rs.getString("course_preference"));
	  staf.setQualification(rs.getString("qualification"));
	  staf.setExperience(rs.getString("experience"));
	  staf.setAddress(rs.getString("address"));
	  list.add(staf);
	 }
	  return list;
  }
	/*    //TEST
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		ArrayList<Staff> staff=	StaffProfileDAO.getAllStaff();
		System.out.println(staff.get(0).getEmail());
		
		
		
		
	}*/
	
	
}

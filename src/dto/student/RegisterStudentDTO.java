package dto.student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.database.DataBaseConnection;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import xtra.EnrollmentFor;

public class RegisterStudentDTO{

	public static Boolean doRegister(String name, String dob, String course, String qualification, String mobile,
			String email, String paymethod, String ddno, String chekno, double depamount) throws ClassNotFoundException, SQLException {
	
		Connection cn=DataBaseConnection.connect();
  String sql="INSERT INTO student (name,dob,course_enrolled, qualification,mobile,"
  		+ " email,paymentmethod,ddno,chekno,iscash,amtpaymented,isdue,dueamount,isactive,password)"
  		+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1,name);
		ps.setString(2,dob);
		ps.setString(3,course);
		ps.setString(4,qualification);
		ps.setString(5,mobile);
		ps.setString(6,email);
		ps.setString(7,paymethod);
		ps.setString(8,ddno );
		ps.setString(9,chekno);
		System.out.println(paymethod);
		String iscash;
		if(paymethod.equals("cash")){
			iscash="Yes";
		}else iscash="No";
		
		ps.setString(10,iscash);
		ps.setDouble(11,depamount);
		int status = 0;
		 String isdue="No";
	     double dueamount=getFee(depamount);
	     if(dueamount>0){
	    	 isdue="Yes";
	     }
         
		ps.setString(12, isdue);
		ps.setDouble(13,dueamount);
		ps.setString(14,"yes");
		
		ps.setString(15,"12345");
		
		
		try{
			if(dueamount>=0)
			status=ps.executeUpdate();
			else return false;   //send to errorr page
			
			}catch(MySQLIntegrityConstraintViolationException e){
				System.out.println(e.getMessage());           //FOR TEST
			}
			if(status!=0){
				ps.close();
				cn.close();
				return true;
			}
				else return false;
		}
	
	
	
	
	
	public static Double getFee(double depamount) throws SQLException, ClassNotFoundException{
		Connection cn=DataBaseConnection.connect();
		double fullfee;
		String coursename=EnrollmentFor.getName();
		String sql="select fee from courses where course_name='"+coursename+"'";
		System.out.println("select fee from courses where course_name='"+coursename+"'");
		Statement st=cn.createStatement();
		
	    ResultSet rs=st.executeQuery(sql);
	    rs.next();
	    fullfee=rs.getDouble("fee");
	    double dueamount=0;
	    if(depamount!=fullfee){
	    	dueamount=fullfee-depamount;
	    }
	    System.out.println("full fee is"+fullfee);
	    System.out.println("deposited is"+depamount);
	    System.out.println("due is"+dueamount);
	    rs.close();
	    st.close();
	    cn.close();
		return dueamount;
		
				
		
	}
	
	}
		
		
		
	
	
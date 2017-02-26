package dao.student;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.database.DataBaseConnection;

import pojo.Student;

public class StudentDAO {
	
public ArrayList<Student> getStudentData(String email) throws ClassNotFoundException, SQLException{
Connection cn=	DataBaseConnection.connect();
Student student=new Student();

String sql="SELECT *"+
" FROM student s"+
" LEFT JOIN courses c"+
" ON s.course_enrolled=c.course_name"+                        //VERY IMPORTANT QUERY
" LEFT JOIN student_notification n"+
" ON s.student_id=n.notification_id"+
" where email='"+email+"'";

ArrayList<Student> list=new ArrayList<>();
Statement st=cn.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
student.setStudent_id(rs.getInt("student_id"));
student.setName(rs.getString("name"));
student.setDob(rs.getDate("dob"));
student.setCourse_enrolled(rs.getString("course_enrolled"));
student.setQualification(rs.getString("qualification"));
student.setMobile(rs.getString("mobile"));
student.setEmail(rs.getString("email"));
student.setPaymentmethod(rs.getString("paymentmethod"));
student.setDdNo(rs.getString("ddno"));
student.setChekNo(rs.getString("chekno"));
student.setAmountpaid(rs.getDouble("amtpaymented"));
student.setIsDue(rs.getString("isdue"));
student.setDueAmount(rs.getDouble("dueamount"));
student.setIsActive(rs.getString("isactive"));
student.setRegistered_on(rs.getDate("Registered_on"));
student.setPassword(rs.getString("password"));
student.setIsCash(rs.getString("iscash"));
student.setCourse_fee(rs.getDouble("fee"));
student.setCourse_category(rs.getString("category"));
student.setCourse_duration(rs.getString("duration"));
student.setCourse_name(rs.getString("course_name"));
student.setMessage(rs.getString("message"));

list.add(student);
}
rs.close();
st.close();
cn.close();
return list;
	}

	//testing---OKKK
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		ArrayList<Student> list=new ArrayList<>();
		StudentDAO dao=new StudentDAO();
		list= dao.getStudentData("1@2.com");
		for(int i=0;i<list.size();i++){
			 System.out.println("dekh bhai............"+list.get(i).getAmountpaid());
		}
		/*StudentDAO dao=new StudentDAO();
		 Student s= dao.getStudentData("kunal@gmail.com");
	 	  System.out.println("dekh bhai............"+s.getMessage());*/
	}
}

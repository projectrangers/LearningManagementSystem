package student.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.database.DataBaseConnection;

import pojo.Student;
import pojo.StudentNotification;

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
System.out.println(sql);
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
student.setMessageTime(rs.getDate("message_time"));

list.add(student);
}
rs.close();
st.close();
cn.close();
return list;
	}

public ArrayList<Student> getStudentList() throws ClassNotFoundException, SQLException{
Connection cn=	DataBaseConnection.connect();
String sql="SELECT * FROM student  order by name asc ";

ArrayList<Student> list=new ArrayList<>();
Statement st=cn.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
Student student=new Student();
student.setStudent_id(rs.getInt("student_id"));
student.setName(rs.getString("name"));
student.setEmail(rs.getString("email"));
student.setIsDue(rs.getString("isdue"));
student.setIsActive(rs.getString("isactive"));
list.add(student);
}
rs.close();
st.close();
cn.close();
return list;
	}


public static int countStudent() throws ClassNotFoundException, SQLException{
	int count = 0;
	Connection cn=	DataBaseConnection.connect();
	String sql="SELECT count(*) as count from student";
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery(sql);
	rs.next();
	count=rs.getInt("count");
	rs.close();
	st.close();
	cn.close();
	return count;
}


public static ArrayList<Student> getStudentByCourse(String course) throws ClassNotFoundException, SQLException{
Connection cn=	DataBaseConnection.connect();
String sql="SELECT * FROM student where course_enrolled='"+course+"' order by name asc ";

ArrayList<Student> list=new ArrayList<>();
Statement st=cn.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
	Student student=new Student();
	student.setName(rs.getString("name"));
	student.setDob(rs.getDate("dob"));
	student.setCourse_enrolled(rs.getString("course_enrolled"));
	student.setQualification(rs.getString("qualification"));
	student.setMobile(rs.getString("mobile"));
	student.setEmail(rs.getString("email"));
	student.setIsActive(rs.getString("isactive"));
	student.setRegistered_on(rs.getDate("Registered_on"));
    list.add(student);
}
rs.close();
st.close();
cn.close();
return list;
	}

public static ArrayList<StudentNotification> getMessage(int id) throws ClassNotFoundException, SQLException{
Connection cn=	DataBaseConnection.connect();
String sql="SELECT * FROM student_notification where notification_id="+id+"";

ArrayList<StudentNotification> list=new ArrayList<>();
Statement st=cn.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
  StudentNotification sn=new StudentNotification();
  sn.setIdPrimary(rs.getInt("id"));
  sn.setId(rs.getInt("notification_id"));
  sn.setMessage(rs.getString("message"));
  sn.setTime(rs.getDate("message_time"));
   list.add(sn);
   
}
rs.close();
st.close();
cn.close();
return list;
	}












	//testing---OKKK
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		StudentDAO dao=new StudentDAO();
		 ArrayList<Student> s= dao.getStudentData("kapala@gmail.com");
	 	  System.out.println("dekh bhai............"+s.get(0).getAmountpaid());
	}
}

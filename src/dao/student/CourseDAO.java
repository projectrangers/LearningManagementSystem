package dao.student;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.database.DataBaseConnection;

public class CourseDAO {
	public static ResultSet getCourses() throws ClassNotFoundException, SQLException{
		//ArrayList<String> finallist=new ArrayList<>();
Connection cn=DataBaseConnection.connect();
		String sql="SELECT *from courses where isavailable='Y'";
	    Statement st=cn.createStatement();
	    ResultSet rs= st.executeQuery(sql);
	    /*while(rs.next()){
	    String name=rs.getString("name");
	    int available=rs.getInt("available");
	    int total=rs.getInt("total");
	    finallist.add(name);
	    }*/
	    
	    return rs;
	    }

//testing
/*	
public static void main(String[] args) throws ClassNotFoundException, SQLException {
 ArrayList<String> list=  CourseDAO.getCourses();
 System.err.println(list.get(2));
}
*/



}











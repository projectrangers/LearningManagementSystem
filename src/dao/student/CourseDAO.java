package dao.student;

import java.sql.Connection;
import pojo.Courses;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.database.DataBaseConnection;

public class CourseDAO {
	public static ArrayList<Courses> getCourses() throws ClassNotFoundException, SQLException{
     ArrayList<Courses> list=new ArrayList<>();
      Connection cn=DataBaseConnection.connect();
       
		String sql="SELECT *from courses";
	    Statement st=cn.createStatement();
	    ResultSet rs= st.executeQuery(sql);
	    while(rs.next()){
	    	Courses course=new Courses();
	    	course.setCourse_name(rs.getString("course_name"));
	    	course.setCategory(rs.getString("category"));
	    	course.setTotal(rs.getInt("total"));
	    	course.setAvailable(rs.getInt("available"));
	    	course.setDuration(rs.getInt("duration"));
	    	course.setFee(rs.getDouble("fee"));
	    	course.setIsAvailable(rs.getString("isavailable"));
	    list.add(course);
	    }
	    rs.close();
	    st.close();
	    cn.close();
	    return list;
	    }
	
	public static ArrayList<String> getCourseCategories() throws ClassNotFoundException, SQLException{
	 ArrayList<String> catList=new ArrayList<>();
	        Connection cn=DataBaseConnection.connect();
	       
			String sql="SELECT *from category where isactive='y'";
		    Statement st=cn.createStatement();
		    ResultSet rs= st.executeQuery(sql);
		    while(rs.next()){
		    	//System.out.println(rs.getString("name"));
		        catList.add(rs.getString("name")) ;
		    }
		    rs.close();
		    st.close();
		    cn.close();
		    return catList;
		    
	}
public static ArrayList<String> getCoursesByCategory(String category) throws SQLException, ClassNotFoundException{
	 ArrayList<String> list=new ArrayList<>();
     Connection cn=DataBaseConnection.connect();
    
		String sql="SELECT *from courses where category='"+category+"'";
	    Statement st=cn.createStatement();
	    ResultSet rs= st.executeQuery(sql);
	    while(rs.next()){
	    	list.add(rs.getString("course_name"));
	    }
	    rs.close();
	    st.close();
	    cn.close();
	    return list;
	
}

public static Courses getCourseDetailByName(String courseName) throws ClassNotFoundException, SQLException{
     Connection cn=DataBaseConnection.connect();
    
		String sql="SELECT *from courses where course_name='"+courseName+"'";
	    Statement st=cn.createStatement();
	    ResultSet rs= st.executeQuery(sql);
	    Courses courseDetail=new Courses();
	    rs.next();
	        courseDetail.setCourse_name(rs.getString("course_name"));
	    	courseDetail.setCategory(rs.getString("category"));
	    	courseDetail.setTotal(rs.getInt("total"));
	    	courseDetail.setAvailable(rs.getInt("available"));
	    	courseDetail.setDuration(rs.getInt("duration"));
	    	courseDetail.setFee(rs.getDouble("fee"));
	    	courseDetail.setIsAvailable(rs.getString("isavailable"));
	  
	    
	    rs.close();
	    st.close();
	    cn.close();
	    return courseDetail;
}

//testing
	
/*public static void main(String[] args) throws ClassNotFoundException, SQLException {
 ArrayList<String> list=  CourseDAO.getCoursesByCategory("program");
 int i=0;
 while(i<list.size()){
 System.out.println(list.get(i));
 i++;
}
 Courses c=CourseDAO.getCourseDetailByName("cpp");
 System.out.println(c.getDuration());
}
*/


}



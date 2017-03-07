package generalDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.database.DataBaseConnection;

import pojo.Category;
import pojo.Courses;

public class CategoryDAO {
	
	public static int countCategory() throws ClassNotFoundException, SQLException{
		Connection cn=	DataBaseConnection.connect();
		String sql="select count(*) as count from category";
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		rs.next();
		int i= rs.getInt("count");
		rs.close();
		st.close();
		cn.close();
		return i;
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
	
	public static ArrayList<Category> getCategories() throws ClassNotFoundException, SQLException{
		   ArrayList<Category>catList=new ArrayList<>();    
		    
		        Connection cn=DataBaseConnection.connect();
		       String sql="SELECT *from category";
			    Statement st=cn.createStatement();
			    ResultSet rs= st.executeQuery(sql);
			    while(rs.next()){
			    	 Category category=new Category();
			    	 category.setName(rs.getString("name"));
			    	 category.setIs_Available(rs.getString("isactive"));
			        catList.add(category) ;
			    }
			    rs.close();
			    st.close();
			    cn.close();
			    return catList;	    
		}

	
	

}

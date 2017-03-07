package admin.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

import pojo.Student;
import student.dao.StudentDAO;

@SuppressWarnings("serial")
public class ShowStudentAction extends ActionSupport {
	public String execute() throws Exception {
		   return SUCCESS;
	};
   
	


	
}

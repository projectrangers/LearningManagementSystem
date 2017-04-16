package staff.action;

import java.sql.SQLException;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

import pojo.Staff;
import staff.DAO.StaffProfileDAO;

public class ShowStaffAction {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		ArrayList<Staff> staff=	StaffProfileDAO.getAllStaff();
		System.out.println(staff.size());
		
		
		
		
	}
	}
	

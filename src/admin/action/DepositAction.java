package admin.action;

import java.sql.Connection;
import java.sql.Statement;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class DepositAction extends ActionSupport {
	double due;
	double deposit;
	double fee;
	int stId;
	
	
	
	
	
	
	public int getStId() {
		return stId;
	}


	public void setStId(int stId) {
		this.stId = stId;
	}


	public double getFee() {
		return fee;
	}


	public void setFee(double fee) {
		this.fee = fee;
	}


	public double getDeposit() {
		return deposit;
	}


	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}


	public double getDue() {
		return due;
	}


	public void setDue(double due) {
		this.due = due;
	}


	@Override
	public String execute() throws Exception {
		double rem=due-deposit;
		Connection cn=	DataBaseConnection.connect();
		
		String sql="update student set dueamount="+rem+" where student_id="+stId+" ";
		System.out.println(sql);
		Statement st=cn.createStatement();
		
		int rs=st.executeUpdate(sql);
		st.close();
		cn.close();
		if(rs>0){
			addFieldError("msg","AMOUNT DEPOSITED TO STUDENT ACCOUNT!!!!!");
			System.out.println("success ho gya!!");
			return SUCCESS;
		}else{ addFieldError("msg","Error depositing amount!!!!!"); return ERROR;}
		
	}
	
	
	public void change(int id) throws Exception {
		Connection cn=	DataBaseConnection.connect();
		
		String sql="update student set isdue='no' where student_id="+id+" ";
		System.out.println(sql);
		Statement st=cn.createStatement();
		
		int rs=st.executeUpdate(sql);
		st.close();
		cn.close();
		
	}
	
	
	

}

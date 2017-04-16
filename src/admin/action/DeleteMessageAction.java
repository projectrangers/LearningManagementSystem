

package admin.action;

import java.sql.Connection;
import java.sql.Statement;
import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteMessageAction extends ActionSupport{

	
int id;









public int getId() {
	return id;
}









public void setId(int id) {
	this.id = id;
}









@Override
	public String execute() throws Exception {
		Connection cn=	DataBaseConnection.connect();
		String sql="DELETE from student_notification where id="+id+"";
		System.out.println(sql);
		Statement st=cn.createStatement();
		int rs=0;
		try{
		rs=st.executeUpdate(sql);
		}catch(Exception e){System.out.println(e.toString());}
		st.close();
		cn.close();
		if(rs>0){
			addFieldError("message","SELECTED MESSAGE DELETED!!");
			System.out.println("success ho gya!!");
			return SUCCESS;
		}else{
			addFieldError("message","ALREADY DELETED OR MESSAGE NOT FOUND!!");
			return ERROR;}
		
	}
	/*//TEST
	public static void main(String[] args) throws Exception {
		SendMessageAction k=new SendMessageAction();
	System.out.println(k.execute(74,"hello test"));	;
		
	}*/

}


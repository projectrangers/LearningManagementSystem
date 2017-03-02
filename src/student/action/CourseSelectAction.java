package student.action;

import com.opensymphony.xwork2.ActionSupport;

import xtra.EnrollmentFor;

public class CourseSelectAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private double fee;
	

	public double getFee() {
		return fee;
	}

	public void setFee(double fee) {
		this.fee = fee;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
@Override
public String execute() throws Exception {
	EnrollmentFor.setName(getName());
	EnrollmentFor.setFee(getFee());
	return SUCCESS;
    }

}

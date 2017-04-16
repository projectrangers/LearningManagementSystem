package pojo;

import java.util.Date;

public class Student {
	
 private int	student_id;
 private String name;
 private Date dob;
 private String course_enrolled;
 private String qualification;
 private String mobile;
 private String email;
 private String paymentmethod;
 private String ddNo;
 private String chekNo;
 private double amountpaid;
 private String isDue;
 private double dueAmount;
 private String isActive;
 private Date registered_on;
 @SuppressWarnings("unused")
private String password;
private String isCash;

 private double course_fee;
 private String course_category;
 private String course_duration;
 private String course_name;
 private String message;
 private Date MessageTime;
 
 
 

public Date getMessageTime() {
	return MessageTime;
}
public void setMessageTime(Date messageTime) {
	MessageTime = messageTime;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public String getCourse_name() {
	return course_name;
}
public void setCourse_name(String course_name) {
	this.course_name = course_name;
}
public String getIsCash() {
	return isCash;
}
public void setIsCash(String isCash) {
	this.isCash = isCash;
}
public int getStudent_id() {
	return student_id;
}
public void setStudent_id(int i) {
	this.student_id = i;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Date getDob() {
	return dob;
}
public void setDob(Date date) {
	this.dob = date;
}
public String getCourse_enrolled() {
	return course_enrolled;
}
public void setCourse_enrolled(String course_enrolled) {
	this.course_enrolled = course_enrolled;
}
public String getQualification() {
	return qualification;
}
public void setQualification(String qualification) {
	this.qualification = qualification;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPaymentmethod() {
	return paymentmethod;
}
public void setPaymentmethod(String paymentmethod) {
	this.paymentmethod = paymentmethod;
}
public String getDdNo() {
	return ddNo;
}
public void setDdNo(String ddNo) {
	this.ddNo = ddNo;
}
public String getChekNo() {
	return chekNo;
}
public void setChekNo(String chekNo) {
	this.chekNo = chekNo;
}
public double getAmountpaid() {
	return amountpaid;
}
public void setAmountpaid(double amountpaid) {
	this.amountpaid = amountpaid;
}
public String getIsDue() {
	return isDue;
}
public void setIsDue(String isDue) {
	this.isDue = isDue;
}
public double getDueAmount() {
	return dueAmount;
}
public void setDueAmount(double dueAmount) {
	this.dueAmount = dueAmount;
}
public String getIsActive() {
	return isActive;
}
public void setIsActive(String isActive) {
	this.isActive = isActive;
}
public Date getRegistered_on() {
	return registered_on;
}
public void setRegistered_on(Date registered_on) {
	this.registered_on = registered_on;
}
public double getCourse_fee() {
	return course_fee;
}
public void setCourse_fee(double course_fee) {
	this.course_fee = course_fee;
}
public String getCourse_category() {
	return course_category;
}
public void setCourse_category(String course_category) {
	this.course_category = course_category;
}
public String getCourse_duration() {
	return course_duration;
}
public void setCourse_duration(String course_duration) {
	this.course_duration = course_duration;
}
public void setPassword(String password) {
	this.password = password;
}
 
 

}

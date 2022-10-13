package com.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "user_details", 
			uniqueConstraints = {@UniqueConstraint(columnNames = "email"), 
								@UniqueConstraint(columnNames ="contact_no")})
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id",  nullable=false)
	private Integer id;
	
	@Column(length = 50, name = "first_name")
	private String firstName;
	@Column(length = 50, name = "last_name")
	private String lastName;
	@Column(length = 100, name = "email")
	private String email;
	@Column(length = 500, name = "address")
	private String address;
	@Column(length = 10, name = "contact_no")
	private String contactNo;
	@Column(length = 100, name = "password")
	private String password;
	@Column(length = 500, name = "security_ques_1")
	private String securityQuesOne;
	@Column(length = 100, name = "security_ans_1")
	private String securityAnsOne;
	@Column(length = 500, name = "security_ques_2")
	private String securityQuesTwo;
	@Column(length = 100, name = "security_ans_2")
	private String securityAnsTwo;
	@Column(length = 500, name = "security_ques_3")
	private String securityQuesThree;
	@Column(length = 100, name = "security_ans_3")
	private String securityAnsThree;
	@Column(length = 10, name = "user_type")
	private String userType;
	@Column(length = 1, name = "is_admin_approved")
	private char isAdminApproved;
	@Temporal(TemporalType.DATE)
	@Column(name = "created_date")
	private Date createdDate;
	@Temporal(TemporalType.DATE)
	@Column(name = "updated_date")
	private Date updatedDate;
	
//	@OneToOne
//	@JoinColumn(name="user_profile_id",nullable = false, insertable=false, updatable=false)//FK col name
//	private UserProfile userProfileId;
	
//	@OneToMany(mappedBy="userId")
//	private Set<Property> propertyId;
	
	public User() {}
	
	public User(String firstName, String lastName, String email, String address, String contactNo, String password,
			String securityQuesOne, String securityAnsOne, String securityQuesTwo, String securityAnsTwo,
			String securityQuesThree, String securityAnsThree, String userType, char isAdminApproved,
			Date createdDate, Date updatedDate) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.contactNo = contactNo;
		this.password = password;
		this.securityQuesOne = securityQuesOne;
		this.securityAnsOne = securityAnsOne;
		this.securityQuesTwo = securityQuesTwo;
		this.securityAnsTwo = securityAnsTwo;
		this.securityQuesThree = securityQuesThree;
		this.securityAnsThree = securityAnsThree;
		this.userType = userType;
		this.isAdminApproved = isAdminApproved;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public char getIsAdminApproved() {
		return isAdminApproved;
	}

	public void setIsAdminApproved(char isAdminApproved) {
		this.isAdminApproved = isAdminApproved;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSecurityQuesOne() {
		return securityQuesOne;
	}
	public void setSecurityQuesOne(String securityQuesOne) {
		this.securityQuesOne = securityQuesOne;
	}
	public String getSecurityAnsOne() {
		return securityAnsOne;
	}
	public void setSecurityAnsOne(String securityAnsOne) {
		this.securityAnsOne = securityAnsOne;
	}
	public String getSecurityQuesTwo() {
		return securityQuesTwo;
	}
	public void setSecurityQuesTwo(String securityQuesTwo) {
		this.securityQuesTwo = securityQuesTwo;
	}
	public String getSecurityAnsTwo() {
		return securityAnsTwo;
	}
	public void setSecurityAnsTwo(String securityAnsTwo) {
		this.securityAnsTwo = securityAnsTwo;
	}
	public String getSecurityQuesThree() {
		return securityQuesThree;
	}
	public void setSecurityQuesThree(String securityQuesThree) {
		this.securityQuesThree = securityQuesThree;
	}
	public String getSecurityAnsThree() {
		return securityAnsThree;
	}
	public void setSecurityAnsThree(String securityAnsThree) {
		this.securityAnsThree = securityAnsThree;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public char isAdminApproved() {
		return isAdminApproved;
	}
	public void setAdminApproved(char isAdminApproved) {
		this.isAdminApproved = isAdminApproved;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	
	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", address=" + address
				+ ", contactNo=" + contactNo + ", password=" + password + ", securityQuesOne=" + securityQuesOne
				+ ", securityAnsOne=" + securityAnsOne + ", securityQuesTwo=" + securityQuesTwo + ", securityAnsTwo="
				+ securityAnsTwo + ", securityQuesThree=" + securityQuesThree + ", securityAnsThree=" + securityAnsThree
				+ ", userType=" + userType + ", isAdminApproved=" + isAdminApproved + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + "]";
	}
	
	

}

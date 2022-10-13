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

@Entity
@Table(name = "user_enquiry")
public class UserEnquiry {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "enquiry_id",  nullable=false)
	private Integer id;
	
	@Column(length = 50, name = "first_name")
	private String firstName;
	@Column(length = 50, name = "last_name")
	private String lastName;
	@Column(length = 100, name = "email")
	private String email;
	@Column(length = 10, name = "contact_no")
	private String contactNo;
	@Column(length = 50, name = "contact_day")
	private String contactDay;
	@Column(length = 10, name = "contact_time")
	private String contactTime;
	@Column(length = 500, name = "comments")
	private String comments;
	@Column(length = 1, name = "is_acknowledged")
	private Character isAcknowledged;
	@Temporal(TemporalType.DATE)
	@Column(name = "created_date")
	private Date createdDate;
	@Temporal(TemporalType.DATE)
	@Column(name = "updated_date")
	private Date updatedDate;
	
	public UserEnquiry() {}

	public UserEnquiry(Integer id, String firstName, String lastName, String email, String contactNo, String contactDay,
			String contactTime, String comments, Date createdDate, Date updatedDate) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.contactNo = contactNo;
		this.contactDay = contactDay;
		this.contactTime = contactTime;
		this.comments = comments;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getContactDay() {
		return contactDay;
	}

	public void setContactDay(String contactDay) {
		this.contactDay = contactDay;
	}

	public String getContactTime() {
		return contactTime;
	}

	public void setContactTime(String contactTime) {
		this.contactTime = contactTime;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
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

	public Character getIsAcknowledged() {
		return isAcknowledged;
	}

	public void setIsAcknowledged(Character isAcknowledged) {
		this.isAcknowledged = isAcknowledged;
	}

	@Override
	public String toString() {
		return "UserEnquiry [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", contactNo=" + contactNo + ", contactDay=" + contactDay + ", contactTime=" + contactTime
				+ ", comments=" + comments + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + "]";
	}
	
	
	

}

package com.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "user_profile")
public class UserProfile {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_profile_id",  nullable=false)
	private Integer id;
	
	@OneToOne
	@JoinColumn(name="user_id",nullable = false)//FK col name
	private User userId;
	
	@Column(length = 1000, name = "pan_card")
	private String panCard;
	@Column(length = 1000, name = "aadhaar_card")
	private String aadhaarCard;
	@Column(length = 1000, name = "rent_agreement")
	private String rentAgreement;
	@Temporal(TemporalType.DATE)
	@Column(name = "created_date")
	private Date createdDate;
	@Temporal(TemporalType.DATE)
	@Column(name = "updated_date")
	private Date updatedDate;
	
	public UserProfile() {}
	
	public UserProfile(User userId, String panCard, String aadhaarCard, String rentAgreement,
			Date createdDate, Date updatedDate) {
		super();
		this.userId = userId;
		this.panCard = panCard;
		this.aadhaarCard = aadhaarCard;
		this.rentAgreement = rentAgreement;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public String getPanCard() {
		return panCard;
	}

	public void setPanCard(String panCard) {
		this.panCard = panCard;
	}

	public String getAadhaarCard() {
		return aadhaarCard;
	}

	public void setAadhaarCard(String aadhaarCard) {
		this.aadhaarCard = aadhaarCard;
	}

	public String getRentAgreement() {
		return rentAgreement;
	}

	public void setRentAgreement(String rentAgreement) {
		this.rentAgreement = rentAgreement;
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "UserProfile [userId=" + userId + ", panCard=" + panCard + ", aadhaarCard=" + aadhaarCard
				+ ", rentAgreement=" + rentAgreement + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + "]";
	}
	
	

}

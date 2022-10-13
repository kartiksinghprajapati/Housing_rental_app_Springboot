package com.app.model;

import java.util.Date;
//import java.util.Set;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "tenant_wishlist")
public class TenantWishlist {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "wishlist_id",  nullable=false)
	private Integer id;
	
	@OneToOne
	@JoinColumn(name="user_id",nullable = false)//FK col name
	private User userId;
	
//	@OneToMany(mappedBy = "wishlistId", cascade = CascadeType.ALL,
//			orphanRemoval = true/* ,fetch=FetchType.EAGER */)
//	private Set<Property> propertyId;
	
	@ManyToOne
	@JoinColumn(name="property_id",nullable = false)//FK col name
	private Property propertyId;
	
	@Column(length = 1, name = "is_booked")
	private char isBooked;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "created_date")
	private Date createdDate;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "updated_date")
	private Date updatedDate;
	
	public TenantWishlist() {}

	public TenantWishlist(User userId, Set<Property> propertyId, char isBooked, Date createdDate, Date updatedDate) {
		super();
		this.userId = userId;
//		this.propertyId = propertyId;
		this.isBooked = isBooked;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public Property getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(Property propertyId) {
		this.propertyId = propertyId;
	}

	public char isBooked() {
		return isBooked;
	}

	public void setBooked(char isBooked) {
		this.isBooked = isBooked;
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
		return "TenantWishlist [userId=" + userId + ", propertyId=" //+ propertyId 
				+ ", isBooked=" + isBooked
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + "]";
	}
	
	
}

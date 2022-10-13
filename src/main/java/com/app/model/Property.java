package com.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "property_details",
			uniqueConstraints = {@UniqueConstraint(columnNames = "house_number"),
					@UniqueConstraint(columnNames ="society_name"),
					@UniqueConstraint(columnNames = "area")})
public class Property {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "property_id", nullable=false)
	private Integer id;
	
	@Column(length = 100, name = "property_type")
	private String type;
	@Column(length = 20, name = "property_size")
	private String size;
	@Column(length = 20, name = "no_of_rooms")
	private String noOfRooms;
	@Column(length = 1,  name = "parking_available")
	private Character parkingAvailable;
	@Column(length = 20, name = "parking_type")
	private String parkingType;
	@Column(length = 50, name = "furnished_type")
	private String furnishedType;
	@Column(length = 50, name = "house_number")
	private String propertyNumber;
	@Column(length = 50, name = "society_name")
	private String societyName;
	@Column(length = 50, name = "area")
	private String area;
	@Column(length = 500, name = "additional_info")
	private String additionalInfo;
	@Column(length = 1, name = "is_admin_approved")
	private Character isAdminApproved;
	@Temporal(TemporalType.DATE)
	@Column(name = "created_date")
	private Date createdDate;

	@Temporal(TemporalType.DATE)
	@Column(name = "updated_date")
	private Date updatedDate;
	
	@Column(length = 1, name = "is_payment_done")
	private Character isPaymentDone;
	
	@Column(length = 1000, name = "property_pic")
	private String propertyPic;
	
	//@ManyToOne(cascade = CascadeType.MERGE)
	@ManyToOne
	@JoinColumn(name="user_id")//FK col name
	private User userId;
	
//	@ManyToOne(cascade = CascadeType.ALL)
////			orphanRemoval = true/* ,fetch=FetchType.EAGER */)
//	@JoinColumn(name="wishlist_id",nullable = false)//FK col name
//	private TenantWishlist wishlistId;
	
	public Property() {}

	public Property(String type, String size, String noOfRooms, Character parkingAvailable, String parkingType,
			String furnishedType, String additionalInfo, Character isAdminApproved, Date createdDate,
			Date updatedDate, User userId) {
		super();
		this.type = type;
		this.size = size;
		this.noOfRooms = noOfRooms;
		this.parkingAvailable = parkingAvailable;
		this.parkingType = parkingType;
		this.furnishedType = furnishedType;
		this.additionalInfo = additionalInfo;
		this.isAdminApproved = isAdminApproved;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
		this.userId = userId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getNoOfRooms() {
		return noOfRooms;
	}

	public void setNoOfRooms(String noOfRooms) {
		this.noOfRooms = noOfRooms;
	}

	public Character isParkingAvailable() {
		return parkingAvailable;
	}

	public void setParkingAvailable(Character parkingAvailable) {
		this.parkingAvailable = parkingAvailable;
	}

	public String getParkingType() {
		return parkingType;
	}

	public void setParkingType(String parkingType) {
		this.parkingType = parkingType;
	}

	public String getFurnishedType() {
		return furnishedType;
	}

	public void setFurnishedType(String furnishedType) {
		this.furnishedType = furnishedType;
	}

	public String getAdditionalInfo() {
		return additionalInfo;
	}

	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}

	public Character isAdminApproved() {
		return isAdminApproved;
	}

	public void setAdminApproved(Character isAdminApproved) {
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

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public String getPropertyNumber() {
		return propertyNumber;
	}

	public void setPropertyNumber(String propertyNumber) {
		this.propertyNumber = propertyNumber;
	}

	public String getSocietyName() {
		return societyName;
	}

	public void setSocietyName(String societyName) {
		this.societyName = societyName;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public char getIsAdminApproved() {
		return isAdminApproved;
	}

	public void setIsAdminApproved(char isAdminApproved) {
		this.isAdminApproved = isAdminApproved;
	}

	public char getParkingAvailable() {
		return parkingAvailable;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setIsAdminApproved(Character isAdminApproved) {
		this.isAdminApproved = isAdminApproved;
	}

	public Character getIsPaymentDone() {
		return isPaymentDone;
	}

	public void setIsPaymentDone(Character isPaymentDone) {
		this.isPaymentDone = isPaymentDone;
	}

	public String getPropertyPic() {
		return propertyPic;
	}

	public void setPropertyPic(String propertyPic) {
		this.propertyPic = propertyPic;
	}

	@Override
	public String toString() {
		return "Property [id=" + id + ", type=" + type + ", size=" + size + ", noOfRooms=" + noOfRooms
				+ ", parkingAvailable=" + parkingAvailable + ", parkingType=" + parkingType + ", furnishedType="
				+ furnishedType + ", propertyNumber=" + propertyNumber + ", societyName=" + societyName + ", area="
				+ area + ", additionalInfo=" + additionalInfo + ", isAdminApproved=" + isAdminApproved
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", isPaymentDone=" + isPaymentDone
				+ ", propertyPic=" + propertyPic + ", userId=" + userId + "]";
	}

	
	
	

}

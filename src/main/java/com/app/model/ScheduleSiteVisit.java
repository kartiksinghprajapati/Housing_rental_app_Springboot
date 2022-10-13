package com.app.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "schedule_visit")
public class ScheduleSiteVisit {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "site_visit_id", nullable=false)
	private Integer id;
	
	@Column(length = 100, name = "visit_mode")
	private String visitMode;
	@Column(length = 100, name = "date_time")
	private LocalDateTime visitDateTime;
	@Column(name = "property_id")
	private int propertyId;
	@Column(name = "user_id")
	private int userId;
	@Column(length = 1, name = "is_acknowledged")
	private Character isAcknowledged;
	
	public ScheduleSiteVisit() {}

	public ScheduleSiteVisit(Integer id, String visitMode, LocalDateTime visitDateTime, int propertyId, int userId,
			Character isAcknowledged) {
		super();
		this.id = id;
		this.visitMode = visitMode;
		this.visitDateTime = visitDateTime;
		this.propertyId = propertyId;
		this.userId = userId;
		this.isAcknowledged = isAcknowledged;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVisitMode() {
		return visitMode;
	}

	public void setVisitMode(String visitMode) {
		this.visitMode = visitMode;
	}

	public LocalDateTime getVisitDateTime() {
		return visitDateTime;
	}

	public void setVisitDateTime(LocalDateTime visitDateTime) {
		this.visitDateTime = visitDateTime;
	}

	public int getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(int propertyId) {
		this.propertyId = propertyId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Character getIsAcknowledged() {
		return isAcknowledged;
	}

	public void setIsAcknowledged(Character isAcknowledged) {
		this.isAcknowledged = isAcknowledged;
	}

	@Override
	public String toString() {
		return "ScheduleSiteVisit [id=" + id + ", visitMode=" + visitMode + ", visitDateTime=" + visitDateTime
				+ ", propertyId=" + propertyId + ", userId=" + userId + ", isAcknowledged=" + isAcknowledged + "]";
	}
	
	

}

package com.app.utils;

import java.time.LocalDateTime;

public class SiteVisitColumns {
	
	private int id;
	private String tenantName;
	private String propertyAddress;
	private String visitMode;
	private LocalDateTime visitDateTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenantName() {
		return tenantName;
	}
	public void setTenantName(String tenantName) {
		this.tenantName = tenantName;
	}
	public String getPropertyAddress() {
		return propertyAddress;
	}
	public void setPropertyAddress(String propertyAddress) {
		this.propertyAddress = propertyAddress;
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
	
	

}

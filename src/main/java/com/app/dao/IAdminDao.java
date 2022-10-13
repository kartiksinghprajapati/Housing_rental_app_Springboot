package com.app.dao;

import java.util.List;

import com.app.model.Admin;
import com.app.model.Property;
import com.app.model.UserEnquiry;
import com.app.utils.SiteVisitColumns;

public interface IAdminDao {
	
	//Admin login
	Admin loginAdmin(String email, String password);
	
	//Add a method to save admin registration details
	String saveAdminDetails(Admin admin);
	
	//Add a method to fetch submitted properties for approval
	List<Property> getPropertiesForApproval();
	
	//Add a method to fetch tenant's site visit requests
	List<SiteVisitColumns> getScheduledVisits();
	
	//Add a method to fetch user inquiries
	List<UserEnquiry> getUserEnquiries();
	
	//Add a method to approve owner property
	String approveOwnerProperty(int propertyId);
	
	//Add a method to acknowledge scheduled visits of tenants
	String acknowldgeScheduledVisits(int siteVisitId);
	
	//Add a method to acknowledge user inquiries
	String acknowledgeUserEnquiries(int enquiryId);

}

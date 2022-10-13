package com.app.dao;

import java.util.List;

import com.app.model.Property;
import com.app.model.TenantWishlist;
import com.app.model.User;
import com.app.model.UserProfile;

public interface ITenantDao {

	
	//Add a method to get tenant's wishlist
	List<TenantWishlist> getTenantWishlist(User user);
	
	//Add a method to upload tenant's pan and aadhaar card
	String uploadTenantDocs(UserProfile userProfile, User user);
	
	//Add a method to upload tenant's pan and aadhaar card
	String updateBookingStatus(char isBooked, Property property);
}

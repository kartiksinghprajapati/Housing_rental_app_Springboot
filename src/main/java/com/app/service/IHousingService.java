package com.app.service;

import java.util.List;

import com.app.model.Property;
import com.app.model.ScheduleSiteVisit;
import com.app.model.TransactionDetails;
import com.app.model.User;
import com.app.model.UserEnquiry;
import com.app.model.UserProfile;
import com.app.utils.SecurityQuestions;

public interface IHousingService {

	//User login
	User loginUser(String email, String password);
	
	//Add a method to get security questions
	List<SecurityQuestions> getSecurityQues();
		
	//Add a method to get all properties
	List<Property> getProperties();
	
	//Add a method to save user registration details
	String saveUser(User user);
	
	//Add a method to check owner's aadhaar and pan details
	String checkAdhaarAndPanExists(User user);
	
	//Add a method to get property details by user id
	Property getPropertyByUserId(User user, String propertyId);
	
	//Add a method to pay Owner's maintenance charges
	String payOwnerCharges(TransactionDetails transDetails);
	
	//Add a method to get security questions for forgot password
	User getSecurityQuestionsByEmailId(String email);
	
	//Add a method to reset password
	String resetPasswordByEmailId(String email, String password);
	
	//Add a method to search properties
	List<Property> searchProperties(String location, String furnishedType, String propertyType, String noOfRooms, User user);
	
	//Add a method to get property details by property id
	Property getPropertyByPropertyId(String propertyId);
	
	//Add a method to log all property visits scheduled by tenants
	String scheduleSiteVisit(int propertyId, int userId, ScheduleSiteVisit visit);
	
	//Add a method to add properties to tenant's wishlist
	String addToWishlist(Property propertyId, User userId);
	
	//Add a method to pay Owner's maintenance charges
	String payTenantCharges(TransactionDetails transDetails);
	
	//Add a method to fetch user's profile docs
	List<UserProfile> getUserDocuments(User user);
	
	//Add a method to save user's enquiry details
	String saveEnquiryDetails(UserEnquiry enquiry);
}

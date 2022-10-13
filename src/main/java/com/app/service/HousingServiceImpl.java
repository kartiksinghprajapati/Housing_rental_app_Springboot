package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.IHousingDao;
import com.app.model.Property;
import com.app.model.ScheduleSiteVisit;
import com.app.model.TransactionDetails;
import com.app.model.User;
import com.app.model.UserEnquiry;
import com.app.model.UserProfile;
import com.app.utils.SecurityQuestions;

@Service
@Transactional
public class HousingServiceImpl implements IHousingService {

	@Autowired
	private IHousingDao housingDao;
	
	@Override
	public User loginUser(String email, String password) {
		return housingDao.loginUser(email, password);
	}
	
	@Override
	public List<SecurityQuestions> getSecurityQues() {
		return housingDao.getSecurityQues();
	}
	
	@Override
	public List<Property> getProperties() {
		return housingDao.getProperties();
	}

	@Override
	public String saveUser(User user) {
		return housingDao.saveUser(user);
	}

	@Override
	public String checkAdhaarAndPanExists(User user) {
		return housingDao.checkAdhaarAndPanExists(user);
	}

	@Override
	public Property getPropertyByUserId(User user, String propertyId) {
		return housingDao.getPropertyByUserId(user, propertyId);
	}

	@Override
	public String payOwnerCharges(TransactionDetails transDetails) {
		return housingDao.payOwnerCharges(transDetails);
	}

	@Override
	public User getSecurityQuestionsByEmailId(String email) {
		return housingDao.getSecurityQuestionsByEmailId(email);
	}

	@Override
	public String resetPasswordByEmailId(String email, String password) {
		return housingDao.resetPasswordByEmailId(email, password);
	}

	@Override
	public List<Property> searchProperties(String location, String furnishedType, String propertyType, String noOfRooms, User user) {
		String updatedLocation = changeFirstLetterToUpper(location == null ? "" : location);
		return housingDao.searchProperties(updatedLocation, furnishedType == null ? "" :furnishedType, 
				propertyType == null ? "" : propertyType, noOfRooms == null ? "" : noOfRooms, user);
	}

	private String changeFirstLetterToUpper(String message) {
		char[] charArray = message.toCharArray();
	    boolean foundSpace = true;

	    for(int i = 0; i < charArray.length; i++) {

	      // if the array element is a letter
	      if(Character.isLetter(charArray[i])) {

	        // check space is present before the letter
	        if(foundSpace) {

	          // change the letter into uppercase
	          charArray[i] = Character.toUpperCase(charArray[i]);
	          foundSpace = false;
	        }
	      }

	      else {
	        // if the new character is not character
	        foundSpace = true;
	      }
	    }

	    // convert the char array to the string
	    message = String.valueOf(charArray);
	    
	    return message;
	}

	@Override
	public Property getPropertyByPropertyId(String propertyId) {
		return housingDao.getPropertyByPropertyId(propertyId);
	}

	@Override
	public String scheduleSiteVisit(int propertyId, int userId, ScheduleSiteVisit visit) {
		return housingDao.scheduleSiteVisit(propertyId, userId, visit);
	}

	@Override
	public String addToWishlist(Property propertyId, User userId) {
		return housingDao.addToWishlist(propertyId, userId);
	}

	@Override
	public String payTenantCharges(TransactionDetails transDetails) {
		return housingDao.payTenantCharges(transDetails);
	}

	@Override
	public List<UserProfile> getUserDocuments(User user) {
		return housingDao.getUserDocuments(user);
	}

	@Override
	public String saveEnquiryDetails(UserEnquiry enquiry) {
		return housingDao.saveEnquiryDetails(enquiry);
	}

}

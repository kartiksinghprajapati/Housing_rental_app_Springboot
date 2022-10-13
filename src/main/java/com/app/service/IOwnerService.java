package com.app.service;

import com.app.model.Property;
import com.app.model.User;
import com.app.model.UserProfile;

public interface IOwnerService {

	//Add a method to save property details
	String saveProperty(Property prop, UserProfile userPro, User user, boolean aadhaarPanFlag);
}

package com.app.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.IOwnerDao;
import com.app.model.Property;
import com.app.model.User;
import com.app.model.UserProfile;

@Service
@Transactional
public class OwnerServiceImpl implements IOwnerService {

	@Autowired
	private IOwnerDao ownerDao;;
	

	@Override
	public String saveProperty(Property prop, UserProfile userPro, User user, boolean aadhaarPanFlag) {
		return ownerDao.saveProperty(prop, userPro, user, aadhaarPanFlag);
	}

	

}

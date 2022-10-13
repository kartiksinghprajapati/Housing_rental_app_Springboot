package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.ITenantDao;
import com.app.model.Property;
import com.app.model.TenantWishlist;
import com.app.model.User;
import com.app.model.UserProfile;

@Service
@Transactional
public class TenantServiceImpl implements ITenantService {

	@Autowired
	private ITenantDao tenantDao;;
	

	@Override
	public List<TenantWishlist> getTenantWishlist(User user) {
		return tenantDao.getTenantWishlist(user);
	}


	@Override
	public String uploadTenantDocs(UserProfile userProfile, User user) {
		return tenantDao.uploadTenantDocs(userProfile, user);
	}


	@Override
	public String updateBookingStatus(char isBooked, Property property) {
		return tenantDao.updateBookingStatus(isBooked, property);
	}

	

}

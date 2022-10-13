package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.IAdminDao;
import com.app.model.Admin;
import com.app.model.Property;
import com.app.model.UserEnquiry;
import com.app.utils.SiteVisitColumns;

@Service
@Transactional
public class AdminServiceImpl implements IAdminService{
	
	@Autowired
	IAdminDao adminDao;

	@Override
	public Admin loginAdmin(String email, String password) {
		return adminDao.loginAdmin(email, password);
	}

	@Override
	public String saveAdminDetails(Admin admin) {
		return adminDao.saveAdminDetails(admin);
	}

	@Override
	public List<Property> getPropertiesForApproval() {
		return adminDao.getPropertiesForApproval();
	}

	@Override
	public List<SiteVisitColumns> getScheduledVisits() {
		return adminDao.getScheduledVisits();
	}

	@Override
	public List<UserEnquiry> getUserEnquiries() {
		return adminDao.getUserEnquiries();
	}

	@Override
	public String approveOwnerProperty(int propertyId) {
		return adminDao.approveOwnerProperty(propertyId);
	}

	@Override
	public String acknowldgeScheduledVisits(int siteVisitId) {
		return adminDao.acknowldgeScheduledVisits(siteVisitId);
	}

	@Override
	public String acknowledgeUserEnquiries(int enquiryId) {
		return adminDao.acknowledgeUserEnquiries(enquiryId);
	}

	

}

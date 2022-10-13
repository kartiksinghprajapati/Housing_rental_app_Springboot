package com.app.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.model.Property;
import com.app.model.TenantWishlist;
import com.app.model.User;
import com.app.model.UserProfile;

@Repository
public class TenantDaoImpl implements ITenantDao {
	
	// dependency : SF
	@Autowired // byType
	// OR JPA specific anno : @PersistenceContext
	private EntityManager mgr;
	

	@Override
	public List<TenantWishlist> getTenantWishlist(User user) {
		String jpql = "select t from TenantWishlist t"
				+ " where t.userId =: user_id"
				+ " and t.isBooked =: is_booked";
		return mgr.createQuery(jpql, TenantWishlist.class).setParameter("user_id", user)
				.setParameter("is_booked", 'N').getResultList();
	}


	@Override
	public String uploadTenantDocs(UserProfile userProfile, User user) {
		userProfile.setUpdatedDate(new Date());
		userProfile.setUserId(user);
		String jpql = "update UserProfile up set up.panCard =: pan_card, up.aadhaarCard =: aadhaar_card"
				+ " where up.userId=:user_id";
		mgr.createQuery(jpql).setParameter("pan_card", userProfile.getPanCard())
		.setParameter("aadhaar_card", userProfile.getAadhaarCard())
		.setParameter("user_id", userProfile.getUserId()).executeUpdate();
		return "Documents uploaded successfully !!";
	}


	@Override
	public String updateBookingStatus(char isBooked, Property property) {
		String jpql = "update TenantWishlist tw set tw.isBooked =: is_booked"
				+ " where tw.propertyId=:property_id";
		mgr.createQuery(jpql).setParameter("is_booked", isBooked)
		.setParameter("property_id", property).executeUpdate();
		return "success";
	}
	
	
	

	

}

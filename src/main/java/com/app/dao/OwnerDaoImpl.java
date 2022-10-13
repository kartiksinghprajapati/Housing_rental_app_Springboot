package com.app.dao;

import java.util.Date;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;

import com.app.model.Property;
import com.app.model.User;
import com.app.model.UserProfile;

@Repository
public class OwnerDaoImpl implements IOwnerDao {
	
	// dependency : SF
	@Autowired // byType
	// OR JPA specific anno : @PersistenceContext
	private EntityManager mgr;
	

	@SuppressWarnings("finally")
	@Override
	@Modifying
	public String saveProperty(Property prop, UserProfile userPro, User user, boolean aadhaarPanFlag) {
		String successMsg = "Congratulations your property details are submitted successfully with property id: ";
		//successMsg.append(" Sit back and relax while we validate your property details and make it live !");
		try {
			prop.setUserId(user);
			prop.setCreatedDate(new Date());
			prop.setUpdatedDate(new Date());
			prop.setIsAdminApproved('N');
			prop.setIsPaymentDone('N');
			mgr.persist(prop);
			if(!aadhaarPanFlag) {
				userPro.setUpdatedDate(new Date());
				userPro.setUserId(user);
				String jpql = "update UserProfile up set up.panCard =: pan_card, up.aadhaarCard =: aadhaar_card"
						+ " where up.userId=:user_id";
				/*
				 * mgr.createQuery(jpql).setParameter("pan_card", userPro.getPanCard())
				 * .setParameter("aadhaar_card", userPro.getAadhaarCard())
				 * .setParameter("user_id", userPro.getUserId()) .getSingleResult();
				 */
				mgr.createQuery(jpql).setParameter("pan_card", userPro.getPanCard())
				.setParameter("aadhaar_card", userPro.getAadhaarCard())
				.setParameter("user_id", userPro.getUserId()).executeUpdate();
			}
			successMsg += prop.getId();
		} catch (Exception e) {
			if(e.getMessage().startsWith("org.hibernate.PersistentObjectException"))
				successMsg = "Error: Property already exists";
			else
				successMsg = "Error: Failed to upload property !";
		} finally {
			return successMsg;
		}
		
	}

	

}

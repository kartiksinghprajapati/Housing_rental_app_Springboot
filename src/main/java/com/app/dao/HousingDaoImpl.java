package com.app.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.model.Property;
import com.app.model.ScheduleSiteVisit;
import com.app.model.TenantWishlist;
import com.app.model.TransactionDetails;
import com.app.model.User;
import com.app.model.UserEnquiry;
import com.app.model.UserProfile;
import com.app.utils.SecurityQuestions;
import com.app.utils.UserConstants;

@Repository
public class HousingDaoImpl implements IHousingDao {
	
	// dependency : SF
	@Autowired // byType
	// OR JPA specific anno : @PersistenceContext
	private EntityManager mgr;
	
	@Override
	public User loginUser(String email, String password) {
		try {
			String jpql = "select u from User u where u.email=:email and u.password=:password";
			return mgr.createQuery(jpql, User.class).setParameter("email", email)
						.setParameter("password", password).getSingleResult();
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@Override
	public List<SecurityQuestions> getSecurityQues() {
		List<SecurityQuestions> securityQuesList = new ArrayList<SecurityQuestions>();
		securityQuesList.add(new SecurityQuestions("ques1",UserConstants.SEC_QUE_1));
		securityQuesList.add(new SecurityQuestions("ques2",UserConstants.SEC_QUE_2));
		securityQuesList.add(new SecurityQuestions("ques3",UserConstants.SEC_QUE_3));
		securityQuesList.add(new SecurityQuestions("ques4",UserConstants.SEC_QUE_4));
		securityQuesList.add(new SecurityQuestions("ques5",UserConstants.SEC_QUE_5));
		securityQuesList.add(new SecurityQuestions("ques6",UserConstants.SEC_QUE_6));
		securityQuesList.add(new SecurityQuestions("ques7",UserConstants.SEC_QUE_7));
		securityQuesList.add(new SecurityQuestions("ques8",UserConstants.SEC_QUE_8));
		securityQuesList.add(new SecurityQuestions("ques9",UserConstants.SEC_QUE_9));
		securityQuesList.add(new SecurityQuestions("ques10",UserConstants.SEC_QUE_10));
		return securityQuesList;
	}

	@Override
	public List<Property> getProperties() {
		String jpql = "select p from Property p"
				+ " where p.isAdminApproved = 'Y'";
		return mgr.createQuery(jpql, Property.class).setMaxResults(3).getResultList();
	}

	@Override
	public String saveUser(User user) {
		//user : TRANSIENT 
		int emailExists = 0, contactNoExists = 0;
		UserProfile userProfile;
		try {
			String jpql1 = "select u from User u where u.email=:email";
			emailExists = mgr.createQuery(jpql1, User.class).setParameter("email", user.getEmail()).getResultList().size();
			if(emailExists == 0) {
				String jpql2 = "select u from User u where u.contactNo=:contact_no";
				contactNoExists = mgr.createQuery(jpql2, User.class).setParameter("contact_no", user.getContactNo()).getResultList().size();
				if(contactNoExists > 0)
					return "Error: Contact number already exists !!";
			} else {
				return "Error: Email address already exists !!";
			} 
			if(emailExists == 0 && contactNoExists == 0) {
				userProfile = new UserProfile();
				user.setIsAdminApproved('N');
				user.setCreatedDate(new Date());
				user.setUpdatedDate(new Date());
				mgr.persist(user); // v : PERSISTENT
				userProfile.setUserId(user);
				userProfile.setCreatedDate(new Date());
				userProfile.setUpdatedDate(new Date());
				mgr.persist(userProfile);
			}
				
		} catch (Exception e) {
			return "Error: " + e.getMessage();
		}
		return "Congratulations "+user.getFirstName() + " " + user.getLastName()
				+ " you are registered successfully !! Redirecting to home page . . .";
	}

	@Override
	public String checkAdhaarAndPanExists(User user) {
		String jpql1 = "select u from UserProfile u where u.userId.id=:user_id";
		UserProfile userProfile = mgr.createQuery(jpql1, UserProfile.class)
				.setParameter("user_id", user.getId()).getSingleResult();
		if(null == userProfile.getAadhaarCard() && null == userProfile.getPanCard()) {
			return "Error 1: PAN Card and Aadhaar Card does not exist. You require to upload both in order to post your property !!";
		} else if(null != userProfile.getAadhaarCard()) {
			if(null == userProfile.getPanCard()) {
				return "Error 2: PAN Card does not exist. You require to upload PAN Card in order to post your property !!";
			}
		} else {
			return "Error 3: Aadhaar Card does not exist. You require to upload Aadhaar card in order to post your property !!";
		}
		return "success";
	}


	@Override
	public Property getPropertyByUserId(User user, String propertyId) {
		String jpql = "select p from Property p where p.userId.id =: user_id and p.id =: prop_id";
		return mgr.createQuery(jpql, Property.class).
				setParameter("user_id", user.getId()).setParameter("prop_id", Integer.parseInt(propertyId))
				.getSingleResult();
	}

	@Override
	public String payOwnerCharges(TransactionDetails transDetails) {
		StringBuilder successMsg = new StringBuilder();
		successMsg.append("Congratulations your payment is successful with Transaction ID : ");
		Calendar cal = Calendar.getInstance();
		Date today = cal.getTime();
		cal.add(Calendar.YEAR, 1); // to get previous year add -1
		Date nextYear = cal.getTime();
		transDetails.setPaymentDoneDate(today);
		transDetails.setNextPaymentDueDate(nextYear);
		transDetails.setIsRefundable('N');
		mgr.persist(transDetails);
		successMsg.append(transDetails.getId()).append(" !! ");
		successMsg.append("<br>Sit back and relax now as your property will go live in the next 24 hours for all the tenants.");
		successMsg.append("<br>Redirecting you to home page . . .");
		return successMsg.toString();
	}

	@Override
	public User getSecurityQuestionsByEmailId(String email) {
		try {
			String jpql = "select u from User u where u.email =: email_id";
			return mgr.createQuery(jpql, User.class).
					setParameter("email_id", email).getSingleResult();
		} catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public String resetPasswordByEmailId(String email, String password) {
		try {
			String jpql = "update User u set u.password =: password"
					+ " where u.email=:email";
			
			mgr.createQuery(jpql).setParameter("password", password)
			.setParameter("email", email).executeUpdate();
			return "Password updated successfully !! Redirecting to login page . . .";
		} catch  (Exception e) {
			return null;
		}
		
	}

	@Override
	public List<Property> searchProperties(String location, String furnishedType, String propertyType, String noOfRooms, User user) {
		try {
			String jpql = "select p from Property p"
					+ " where p.area like '%"+ location +"%'"
					+ " and p.furnishedType like '%"+ furnishedType +"%'"
					+ " and p.type like '%"+ propertyType +"%'"
					+ " and p.noOfRooms like '%"+ noOfRooms +"%'"
					+ " and p.isAdminApproved = 'Y'"
					+ " and p.id not in (select propertyId from TenantWishlist where userId=: user_id)";
			return mgr.createQuery(jpql, Property.class).setParameter("user_id", null!=user ? user: null)
					.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Property getPropertyByPropertyId(String propertyId) {
		String jpql = "select p from Property p"
				+ " where p.id =: property_id";
		return mgr.createQuery(jpql, Property.class).setParameter("property_id", Integer.parseInt(propertyId))
				.getSingleResult();
	}

	@Override
	public String scheduleSiteVisit(int propertyId, int userId, ScheduleSiteVisit visit) {
		visit.setPropertyId(propertyId);
		visit.setUserId(userId);
		visit.setIsAcknowledged('N');
		mgr.persist(visit);
		return "Thank you for scheduling an appointment, our executive will get back to you shortly !!";
	}

	@Override
	public String addToWishlist(Property propertyId, User userId) {
		TenantWishlist wishlist = new TenantWishlist();
		wishlist.setUserId(userId);
		wishlist.setPropertyId(propertyId);
		wishlist.setBooked('N');
		wishlist.setCreatedDate(new Date());
		wishlist.setUpdatedDate(new Date());
		mgr.persist(wishlist);
		return null;
	}

	@Override
	public String payTenantCharges(TransactionDetails transDetails) {
		try {
			StringBuilder successMsg = new StringBuilder();
			successMsg.append("Congratulations your payment is successful with Transaction ID : ");
			transDetails.setPaymentDoneDate(new Date());
			transDetails.setIsRefundable('Y');
			mgr.persist(transDetails);
			successMsg.append(transDetails.getId()).append(" !! ");
			successMsg.append("<br>Thank you for booking your property with us, rest be assured of the services that will help you have a pleasant experience at Rent A Roof !!.");
			successMsg.append("<br>Redirecting you to home page . . .");
			return successMsg.toString();
		} catch (Exception e) {
			return "Error :"+ e.getMessage();
		}
		
	}
	
	@Override
	public List<UserProfile> getUserDocuments(User user) {
		String jpql1 = "select u from UserProfile u where u.userId.id=:user_id";
		return mgr.createQuery(jpql1, UserProfile.class)
				.setParameter("user_id", user.getId()).getResultList();
	}

	@Override
	public String saveEnquiryDetails(UserEnquiry enquiry) {
		enquiry.setCreatedDate(new Date());
		enquiry.setUpdatedDate(new Date());
		enquiry.setIsAcknowledged('N');
		mgr.persist(enquiry);
		return "Thank you for the enquiry, our executive will get back to you shortly !!";
	}
	

}

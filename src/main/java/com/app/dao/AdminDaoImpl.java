package com.app.dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.model.Admin;
import com.app.model.Property;
import com.app.model.UserEnquiry;
import com.app.utils.SiteVisitColumns;

@Repository
public class AdminDaoImpl implements IAdminDao {
	
	@Autowired // byType
	// OR JPA specific anno : @PersistenceContext
	private EntityManager mgr;

	@Override
	public Admin loginAdmin(String email, String password) {
		try {
			String jpql = "select a from Admin a where a.email=:email and a.password=:password";
			return mgr.createQuery(jpql, Admin.class).setParameter("email", email)
						.setParameter("password", password).getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public String saveAdminDetails(Admin admin) {
		try {
			admin.setCreatedDate(new Date());
			admin.setUpdatedDate(new Date());
			mgr.persist(admin); // v : PERSISTENT
		} catch (Exception e) {
			return "Error: " + e.getMessage();
		}
		return "Congratulations "+admin.getFirstName() + " " + admin.getLastName()
				+ " you are registered successfully as Admin !! Redirecting to login page . . .";
	}

	@Override
	public List<Property> getPropertiesForApproval() {
		String jpql = "select p from Property p"
				+ " where p.isAdminApproved = 'N'";
		return mgr.createQuery(jpql, Property.class).getResultList();
	}

	@Override
	public List<SiteVisitColumns> getScheduledVisits() {
		List<SiteVisitColumns> scheduleVisitColumns = new ArrayList<SiteVisitColumns>();
		String jpql = "select sv.id, concat(u.firstName, ' ', u.lastName) as tenantName,"
				+ " concat(p.propertyNumber, ', ', p.societyName, ', ', p.area) as propertyAddress,"
				+ " sv.visitMode as visitMode, sv.visitDateTime as visitDateTime"
				+ " from ScheduleSiteVisit sv, User u, Property p"
				+ " where sv.userId = u.id" 
				+ " and sv.propertyId = p.id and sv.isAcknowledged = 'N'";
		
		List<Object[]> results = mgr.createQuery(jpql, Object[].class).getResultList();
		for (Object[] row : results) {
			SiteVisitColumns visitColumns = new SiteVisitColumns();
			visitColumns.setId((int)row[0]);
			visitColumns.setTenantName(row[1].toString());
			visitColumns.setPropertyAddress((String) row[2]);
			visitColumns.setVisitMode((String) row[3]);
			visitColumns.setVisitDateTime((LocalDateTime) row[4]);

			scheduleVisitColumns.add(visitColumns);
		}
		return scheduleVisitColumns;
	}

	@Override
	public List<UserEnquiry> getUserEnquiries() {
		String jpql = "select ue from UserEnquiry ue"
				+ " where ue.isAcknowledged = 'N'";
		return mgr.createQuery(jpql, UserEnquiry.class).getResultList();
	}

	@Override
	public String approveOwnerProperty(int propertyId) {
		try {
			String jpql = "update Property p set p.isAdminApproved ='Y'"
					+ " where p.id=:prop_id";
			
			mgr.createQuery(jpql).setParameter("prop_id", propertyId).executeUpdate();
			return "Property " +propertyId + " has been approved !!";
		} catch  (Exception e) {
			return null;
		}
	}

	@Override
	public String acknowldgeScheduledVisits(int siteVisitId) {
		try {
			String jpql = "update ScheduleSiteVisit sv set sv.isAcknowledged ='Y'"
					+ " where sv.id=:sv_id";
			
			mgr.createQuery(jpql).setParameter("sv_id", siteVisitId).executeUpdate();
			return "Site Visit " +siteVisitId + " has been approved !!";
		} catch  (Exception e) {
			return null;
		}
	}

	@Override
	public String acknowledgeUserEnquiries(int enquiryId) {
		try {
			String jpql = "update UserEnquiry ue set ue.isAcknowledged ='Y'"
					+ " where ue.id=:ue_id";
			
			mgr.createQuery(jpql).setParameter("ue_id", enquiryId).executeUpdate();
			return "User Enquiry " +enquiryId + " has been addressed !!";
		} catch  (Exception e) {
			return null;
		}
	}

}

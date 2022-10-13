package com.app.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.app.model.Property;
import com.app.model.ScheduleSiteVisit;
import com.app.model.TransactionDetails;
import com.app.model.User;
import com.app.model.UserProfile;
import com.app.service.IHousingService;
import com.app.service.IOwnerService;
import com.app.service.ITenantService;
import com.app.utils.FurnishedStatus;
import com.app.utils.ParkType;
import com.app.utils.PropType;
import com.app.utils.RoomSize;
import com.app.utils.Utilities;

@Controller
@RequestMapping("/property")
public class PropertyController {
	
	@Autowired
	IHousingService housingService;
	
	@Autowired
	IOwnerService ownerService;
	
	@Autowired
	ITenantService tenantService;
	
	
	@GetMapping("/property_list")
	public String showProperty(@ModelAttribute(name = "property") Property p, ModelMap map) {
		map.addAttribute("properties_list", housingService.getProperties());
		return "/property/property_list";
	}
	
	@GetMapping("/post_property")
	public String loadPropertyPage(ModelMap map, HttpSession session,
					HttpServletRequest request, HttpServletResponse resp) { 
		List<String> propertyTypeList = new ArrayList<String>();
		List<String> roomSizeList = new ArrayList<String>();
		List<ParkType> parkingTypes = Arrays.asList(ParkType.values());
		List<String> furnishedTypeList = new ArrayList<String>();
		for(PropType p : PropType.values()) {
			propertyTypeList.add(p.toString().replace("_", " "));
		}
		for(RoomSize r : RoomSize.values()) {
			String value = r.toString();
			if(value.startsWith("ONE_B")) {
				value = value.replace("ONE_BHK", "1_BHK");
			} else if(value.startsWith("ONE_HALF")) {
				value = value.replace("ONE_HALF", "1.5");
			} else if(value.startsWith("TWO_B")) {
				value = value.replace("TWO", "2");
			} else if(value.startsWith("TWO_HALF")) {
				value = value.replace("TWO_HALF", "2.5");
			} else if(value.startsWith("THREE_B")) {
				value = value.replace("THREE", "3");
			} else if(value.startsWith("THREE_HALF")) {
				value = value.replace("THREE_HALF", "3.5");
			} else if(value.startsWith("FOUR_B")) {
				value = value.replace("FOUR", "4");
			}
			roomSizeList.add(value.replace("_", " "));
		}
		for(FurnishedStatus f : FurnishedStatus.values()) {
			furnishedTypeList.add(f.toString().replace("_", " "));
		}
		
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			User user = (User) session.getAttribute("userData");
			String documentsStatus = housingService.checkAdhaarAndPanExists(user);
			if(documentsStatus.contains("Error 1")) {
				map.addAttribute("aadhaarStatus", "both");
				map.addAttribute("errorMsg", documentsStatus.replace("Error 1:", ""));
			} else if(documentsStatus.contains("Error 2")) {
				map.addAttribute("aadhaarStatus", "pan");
				map.addAttribute("errorMsg", documentsStatus.replace("Error 2:", ""));
			} else if(documentsStatus.contains("Error 3")) {
				map.addAttribute("aadhaarStatus", "aadhaar");
				map.addAttribute("errorMsg", documentsStatus.replace("Error 3:", ""));
			} else {
				map.addAttribute("aadhaarStatus", "success");
			}
			map.addAttribute("propertyTypes", propertyTypeList);
			map.addAttribute("roomSizes", roomSizeList);
			map.addAttribute("parkingTypes",parkingTypes);
			map.addAttribute("furnishedStatus",furnishedTypeList);
			return "/property/post_property";
		} else {
			return "redirect:/user/login";
		}
		
	}
	
	
	@PostMapping(value = "/post_property", params = "post")
	public String postProperty(@ModelAttribute("property") Property prop, ModelMap map, HttpSession session, 
			@RequestParam(value = "panCard", required = false) MultipartFile pan, 
			@RequestParam(value = "aadhaarCard", required = false) MultipartFile aadhaar,
			@RequestParam(value = "propPhoto", required = false) MultipartFile propPhoto,
			@RequestParam(value = "comments", required = false) String additionalInfo,
			HttpServletRequest request, HttpServletResponse resp) {
		boolean aadhaarPanPresent = false;
		Utilities utils = new Utilities();
		session = request.getSession(false);
		UserProfile up = new UserProfile();
		if(null != session.getAttribute("userData")) {
			User u = (User) session.getAttribute("userData");
			//Upload property pic start
			if(null!= propPhoto && propPhoto.getSize() > 0) {
				String returnPropValue = utils.uploadFile(u, propPhoto, "prop_photo", session);
				if(!returnPropValue.startsWith("Success")) {
					map.addAttribute("file_upload_error", "Failed to upload property photo");
					return "/property/post_property";
				}
				prop.setPropertyPic(session.getAttribute("prop_pic_path").toString());
				prop.setAdditionalInfo(additionalInfo);
			}
			//Upload property pic end
			
			//Upload pan and aadhaar cards
			if(null == pan || null == aadhaar) {
				String result = housingService.checkAdhaarAndPanExists(u);
				if(result == "success")
					aadhaarPanPresent = true;
				else
					return "redirect:/property/post_property";
				String message = ownerService.saveProperty(prop, up, u, aadhaarPanPresent);
				if(map.containsKey("response"))
					map.remove("response");
				map.addAttribute("response", message);
				if(message.contains("Error")) {
					return "/property/post_property";
				}
				session.setAttribute("propertyId", message.substring(message.lastIndexOf(":") + 1).trim());
				return "redirect:/property/payment_info";
			}
			if(pan.getSize() > 0 && aadhaar.getSize() > 0) {
				String returnValue = utils.uploadFile(u, pan, "pan_card", session);
				if(returnValue.startsWith("Success")) {
					String value = utils.uploadFile(u, aadhaar, "aadhaar_card", session);
					if(!value.startsWith("Success")) {
						map.addAttribute("file_upload_error", "Failed to upload Aadhaar Card");
						return "/post_property";
					}
				} else {
					map.addAttribute("file_upload_error", "Failed to upload PAN Card");
					return "/post_property";
				}
				up.setPanCard(session.getAttribute("pan_card_path").toString());
				up.setAadhaarCard(session.getAttribute("aadhaar_card_path").toString());
				String message = ownerService.saveProperty(prop, up, u, aadhaarPanPresent);
				if(map.containsKey("response"))
					map.remove("response");
				map.addAttribute("response", message);
				if(message.contains("Error")) {
					return "/property/post_property";
				}
				resp.setHeader("refresh", "5;url="+request.getContextPath() + "/property/payment_info");
				session.setAttribute("propertyId", message.substring(message.lastIndexOf(":") + 1).trim());
				return "/property/acknowledgement";
			} else {
//				if(map.containsKey("response"))
//					map.remove("response");
//				map.addAttribute("response", "Please upload PAN card and Aadhaar card both");
//				if(map.containsKey("aadhaarStatus"))
//					map.remove("aadhaarStatus");
//				map.addAttribute("aadhaarStatus", "both");
				return "redirect:/property/post_property";
			}
			
			
		} else {
			return "redirect:/user/login";
		}
	}
	
	@GetMapping("/payment_info")
	public String loadPaymentDetailsPage(ModelMap map, HttpSession session,
					HttpServletRequest request, HttpServletResponse resp) {
		//session.setAttribute("userData", session.getAttribute("userData"));
		Utilities utils = new Utilities();
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			User user = (User) session.getAttribute("userData");
			String propertyId = session.getAttribute("propertyId").toString();
			Property prop = housingService.getPropertyByUserId(user, propertyId);
			Double calculatedValue = utils.calculatePropertyMaintenanceCost(prop.getSize());
			map.addAttribute("calculatedValue", calculatedValue);
			session.setAttribute("calculatedValue", calculatedValue);
			return "/property/payment_info";
		} else {
			return "redirect:/user/login";
		}
		
	}
	
	@GetMapping("/transaction")
	public String loadTransactionPage(ModelMap map, HttpSession session,
			HttpServletRequest request, HttpServletResponse resp) {
		//session.setAttribute("userData", session.getAttribute("userData"));
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			return "/property/transaction";
		} else {
			return "redirect:/user/login"; 
		}
//		User user = (User) session.getAttribute("userData");
//		List<Property> prop = housingService.getPropertyByUserId(user);
//		Double calculatedValue = calculatePropertyMaintenanceCost(prop.get(prop.indexOf("size")).toString());
//		map.addAttribute("calculatedValue", calculatedValue);
		
	}
	
	@PostMapping(value = "/transaction", params = "pay")
	public String payOwnerCharges(@RequestParam(value = "dynamicName") String payMode,
			@RequestParam(value = "cardNo4", required = false) String lastFourDigits,
			@RequestParam(value ="bankName", required = false) String bankName,
			ModelMap map, HttpSession session,
			HttpServletRequest request, HttpServletResponse resp) {
		String message = null;
		String message1 = null;
		Property property = null;
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			User user = (User) session.getAttribute("userData");
			String propertyId = session.getAttribute("propertyId").toString();
			if(user.getUserType().equalsIgnoreCase("owner")) {
				property = housingService.getPropertyByUserId(user, propertyId);
			} else {
				property = housingService.getPropertyByPropertyId(propertyId);
			}
			
			TransactionDetails transDetails = new TransactionDetails();
			if(payMode.equalsIgnoreCase("Credit Card") 
					|| payMode.equalsIgnoreCase("Debit Card")) {
				transDetails.setPaymentMode("Payment done via " + payMode + " ending with " + lastFourDigits);
			} else {
				transDetails.setPaymentMode("Payment done via " + payMode + " through " + bankName);
			}
			transDetails.setUserId(user);
			transDetails.setPropertyId(property);
			
			if(user.getUserType().equalsIgnoreCase("owner")) {
				transDetails.setAmountPaid(session.getAttribute("calculatedValue").toString());
				message = housingService.payOwnerCharges(transDetails);
			} else {
				transDetails.setAmountPaid("1000");
				message = housingService.payTenantCharges(transDetails);
				if(!message.contains("Error")) {
					message1 = tenantService.updateBookingStatus('Y', property);
				}
			}
			
			if(map.containsKey("response"))
				map.remove("response");
			map.addAttribute("response", message);
			if(message.contains("Error")) {
				resp.setHeader("refresh", "5;url="+request.getContextPath());
				return "/user/message";
			}
			session.setAttribute("transaction_id", message.substring(message.lastIndexOf(":") + 1, message.indexOf('!')).trim());
			resp.setHeader("refresh", "5;url="+request.getContextPath());
			return "/property/acknowledgement";
		} else {
			return "redirect:/user/login";
		}
	}
	
	@GetMapping("/schedule_appointment")
	public String loadScheduleAppointmentPage(@RequestParam String pid, ModelMap map, HttpSession session,
			HttpServletRequest request, HttpServletResponse resp) {
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			Property prop = housingService.getPropertyByPropertyId(pid);
			User u = (User) session.getAttribute("userData");
			String message = housingService.addToWishlist(prop, u);
			if(map.containsKey("response"))
				map.remove("response");
			map.addAttribute("response", message);
			map.addAttribute("property", prop);
			LocalDate today = LocalDate.now(); 
			map.addAttribute("today", today);
			return "/property/schedule_appointment";
		} else {
			return "redirect:/user/login"; 
		}
	}
	
	@PostMapping("/schedule_appointment")
	public String bookAppointment(@RequestParam(value = "dynamicName") String visitMode,
			@RequestParam(value = "propertyId") String propertyId,
			@RequestParam(value = "date") String visitDateTime,
			ModelMap map, HttpSession session,
			HttpServletRequest request, HttpServletResponse resp) {
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			User u = (User) session.getAttribute("userData");
			ScheduleSiteVisit visit = new ScheduleSiteVisit();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			LocalDateTime dateTime = LocalDateTime.parse(visitDateTime, formatter);
			visit.setVisitDateTime(dateTime);
			visit.setVisitMode(visitMode);
			String message = housingService.scheduleSiteVisit(Integer.parseInt(propertyId), u.getId(), visit);
			if(map.containsKey("response"))
				map.remove("response");
			map.addAttribute("response", message);
			resp.setHeader("refresh", "3;url="+request.getContextPath());
			return "/property/acknowledgement";
		} else {
			return "redirect:/user/login"; 
		}
	}
	
	
	
	
	

}

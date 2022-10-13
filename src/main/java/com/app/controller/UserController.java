package com.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.app.model.TenantWishlist;
import com.app.model.User;
import com.app.model.UserProfile;
import com.app.service.IHousingService;
import com.app.service.ITenantService;
import com.app.utils.Utilities;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	IHousingService housingService;
	
	@Autowired
	ITenantService tenantService;
	
	
	@GetMapping("/login")
	public String getLoginPage() {
		//map.addAttribute("courseId", p);
		return "/user/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam(name="email") String email, @RequestParam(name="password") String password, 
						ModelMap map, HttpSession session, HttpServletRequest request, HttpServletResponse resp) {
		User userDetails = housingService.loginUser(email, password);
		if(null != userDetails) {
			if(map.containsKey("response"))
				map.remove("response");
			map.addAttribute("response", "Login Successful !! Redirecting to home page . . .");
	        session.setAttribute("userData", userDetails);
	        resp.setHeader("refresh", "3;url="+request.getContextPath());
			return "/user/message";
		} else {
			if(map.containsKey("response"))
				map.remove("response");
			map.addAttribute("response", "Invalid username or password");
			return "/user/login";
		}
		
	}
	
	@GetMapping("/register")
	public String getRegistrationPage(ModelMap map) {
		map.addAttribute("securityQuestions", housingService.getSecurityQues());
		return "/user/register";
	}
	
	@PostMapping("/register")
	public String registerUser(@ModelAttribute("user") User user, @RequestParam("address1") String address1, @RequestParam("address2") String address2,
			ModelMap map, HttpServletRequest request, HttpServletResponse resp) {
		user.setAddress(address1 + " " + address2);
		String message = housingService.saveUser(user);
		if(map.containsKey("response"))
			map.remove("response");
		map.addAttribute("response", message);
		if(message.contains("Error")) {
			map.addAttribute("securityQuestions", housingService.getSecurityQues());
			return "/user/register";
		}
		resp.setHeader("refresh", "5;url="+request.getContextPath());
		return "/user/message";
	}
	
	@GetMapping("/forgot_password")
	public String getForgotPasswordPage(ModelMap map) {
		map.addAttribute("initialFlag", true);
		map.addAttribute("setPasswordFields", false);
		return "/user/forgot_password";
	}
	
	@PostMapping(value = "/forgot_password", params = "getQues")
	public String getSecurityQuestions(@RequestParam(value="userId") String email, 
					ModelMap map, HttpSession session) {
		
		User user = housingService.getSecurityQuestionsByEmailId(email);
		if(null != user) {
			if(map.containsKey("initialFlag"))
				map.remove("initialFlag");
			map.addAttribute("initialFlag", false);
			if(map.containsKey("setPasswordFields"))
				map.remove("setPasswordFields");
			map.addAttribute("setPasswordFields", false);
			List<String> securityQues = new ArrayList<String>();
			List<String> securityAns = new ArrayList<String>();
			securityQues.add(user.getSecurityQuesOne());
			securityQues.add(user.getSecurityQuesTwo());
			securityQues.add(user.getSecurityQuesThree());
			map.addAttribute("sec_ques_list", securityQues);
			securityAns.add(user.getSecurityAnsOne());
			securityAns.add(user.getSecurityAnsTwo());
			securityAns.add(user.getSecurityAnsThree());
			session.setAttribute("securityQues", securityQues);
			session.setAttribute("securityAns", securityAns);
			session.setAttribute("email", email);
		} else {
			if(map.containsKey("errorMsg"))
				map.remove("errorMsg");
			map.addAttribute("errorMsg", "Email ID does not exist !");
			if(map.containsKey("initialFlag"))
				map.remove("initialFlag");
			map.addAttribute("initialFlag", true);
			if(map.containsKey("setPasswordFields"))
				map.remove("setPasswordFields");
			map.addAttribute("setPasswordFields", false);
		}
		
		return "/user/forgot_password";
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/forgot_password", params = "validateAns")
	public String validateSecurityAnswers(ModelMap map, HttpSession session, 
					HttpServletRequest request, HttpServletResponse resp) {
		
		session = request.getSession(false);
		String[] answers = request.getParameterValues("secAns");
		List<String> securityAns = (List<String>) session.getAttribute(("securityAns"));
		boolean errorsFlag = false;
		for(String ans : answers ) {
			if(!securityAns.contains(ans))
				errorsFlag = true;
		}
		if(!errorsFlag) {
			if(map.containsKey("initialFlag"))
				map.remove("initialFlag");
			map.addAttribute("initialFlag", false);
			if(map.containsKey("setPasswordFields"))
				map.remove("setPasswordFields");
			map.addAttribute("setPasswordFields", true);
			return "/user/forgot_password";
		} else {
			if(map.containsKey("errorMsg"))
				map.remove("errorMsg");
			map.addAttribute("errorMsg", "Answers do not match, please try again !!");
			if(map.containsKey("initialFlag"))
				map.remove("initialFlag");
			map.addAttribute("initialFlag", false);
			if(map.containsKey("setPasswordFields"))
				map.remove("setPasswordFields");
			map.addAttribute("setPasswordFields", false);
			map.addAttribute("sec_ques_list", session.getAttribute("securityQues"));
			return "/user/forgot_password";
		}
		
	}
	
	@PostMapping(value = "/forgot_password", params = "resetPwd")
	public String resetPassword(@RequestParam(value="newPwd") String newPassword, 
			@RequestParam(value="cfmPwd") String confirmPassword, 
			ModelMap map, HttpSession session, 
			HttpServletRequest request, HttpServletResponse resp) {
		session = request.getSession(false);
		if(newPassword.equals(confirmPassword)) {
			
			map.addAttribute("response", housingService.resetPasswordByEmailId(session.getAttribute("email").toString(), newPassword));
	        resp.setHeader("refresh", "5;url="+request.getContextPath()+"/user/login");
			return "/user/message";
		} else {
			if(map.containsKey("errorMsg"))
				map.remove("errorMsg");
			map.addAttribute("errorMsg", "passwords do not match, please try again !!");
			if(map.containsKey("initialFlag"))
				map.remove("initialFlag");
			map.addAttribute("initialFlag", false);
			if(map.containsKey("setPasswordFields"))
				map.remove("setPasswordFields");
			map.addAttribute("setPasswordFields", true);
			return "/user/forgot_password";
		}
	}
	
	@GetMapping("/tenant_wishlist")
	public String getTenantWishlistPage(ModelMap map, HttpSession session, 
			HttpServletRequest request, HttpServletResponse resp) {
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			User user = (User) session.getAttribute("userData");
			List<TenantWishlist> wishlist = tenantService.getTenantWishlist(user);
			map.addAttribute("tenant_wishlist", wishlist);
			return "/user/tenant_wishlist";
		} else {
			return "redirect:/user/login";
		}
	}
	
	@PostMapping("/tenant_wishlist")
	public String bookProperty(@RequestParam(value = "propertyId", required = false) String propertyId,
			ModelMap map, HttpSession session, 
			HttpServletRequest request, HttpServletResponse resp) {
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
			session.setAttribute("aadhaarStatus", map.getAttribute("aadhaarStatus"));
			session.setAttribute("propertyId", propertyId);
			if(documentsStatus.contains("success")) {
				return "redirect:/property/transaction";
			} else {
				return "redirect:/user/upload_tenant_docs";
			}
		}
		return null;
	}
	
	@GetMapping("/upload_tenant_docs")
	public String loadTenantDocsPage(ModelMap map, HttpSession session, 
			HttpServletRequest request, HttpServletResponse resp) {
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			return "/user/upload_tenant_docs";
		} else {
			return "redirect:/user/login";
		}
	}
	
	@PostMapping("/upload_tenant_docs")
	public String uploadTenantDocs(@RequestParam(value = "panCard", required = false) MultipartFile pan, 
			@RequestParam(value = "aadhaarCard", required = false) MultipartFile aadhaar,
			ModelMap map, HttpSession session, 
			HttpServletRequest request, HttpServletResponse resp) {
		Utilities utils = new Utilities();
		session = request.getSession(false);
		UserProfile up = new UserProfile();
		if(null != session.getAttribute("userData")) {
			User user = (User) session.getAttribute("userData");
			if(pan.getSize() > 0 && aadhaar.getSize() > 0) {
				String returnValue = utils.uploadFile(user, pan, "pan_card", session);
				if(returnValue.startsWith("Success")) {
					String value = utils.uploadFile(user, aadhaar, "aadhaar_card", session);
					if(!value.startsWith("Success")) {
						map.addAttribute("file_upload_error", "Failed to upload Aadhaar Card");
						return "/user/upload_tenant_docs";
					}
				} else {
					map.addAttribute("file_upload_error", "Failed to upload PAN Card");
					return "/user/upload_tenant_docs";
				}
				up.setPanCard(session.getAttribute("pan_card_path").toString());
				up.setAadhaarCard(session.getAttribute("aadhaar_card_path").toString());
				String message = tenantService.uploadTenantDocs(up, user);
				if(map.containsKey("response"))
					map.remove("response");
				map.addAttribute("response", message);
				resp.setHeader("refresh", "5;url="+request.getContextPath() + "/property/transaction");
				return "/user/message";
			}
			return "user/upload_tenant_docs";
		} else {
			return "redirect:/user/login";
		}
	}
	
	@GetMapping("/profile")
	public String loadProfilePage(ModelMap map, HttpSession session, 
				HttpServletRequest request, HttpServletResponse resp) {
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			User user = (User) session.getAttribute("userData");
			List<UserProfile> userProfile = housingService.getUserDocuments(user);
			map.addAttribute("docs_list", userProfile);
			return "/user/profile";
		} else {
			return "redirect:/user/login";
		}
	}
	
	@SuppressWarnings("deprecation")
	@PostMapping("/profile")
	public String changePassword(@RequestParam(value="currPwd") String currentPassword,
			@RequestParam(value="newPwd") String newPassword, 
			@RequestParam(value="cfmPwd") String confirmPassword,
			ModelMap map, HttpSession session, 
			HttpServletRequest request, HttpServletResponse resp) {
		session = request.getSession(false);
		if(null != session.getAttribute("userData")) {
			User user = (User) session.getAttribute("userData");
			List<UserProfile> userProfile = housingService.getUserDocuments(user);
			map.addAttribute("docs_list", userProfile);
			if(StringUtils.isEmpty(currentPassword) || StringUtils.isEmpty(newPassword)
					|| StringUtils.isEmpty(confirmPassword)) {
				if(map.containsKey("response"))
					map.remove("response");
				map.addAttribute("response", "Please enter all fields !!");
				return "/user/profile";
			} else {
				if(!currentPassword.equals(user.getPassword())) {
					if(map.containsKey("response"))
						map.remove("response");
					map.addAttribute("response", "Incorrect current password, please try again !!");
					return "/user/profile";
				} else {
					if(newPassword.equals(confirmPassword)) {
						String message = housingService.resetPasswordByEmailId(user.getEmail(), newPassword);
						if(message.contains("successfully"))
							map.addAttribute("response", "Password updated successfully !!");
					} else {
						if(map.containsKey("response"))
							map.remove("response");
						map.addAttribute("response", "New password and Confirm password do not match, please try again !!");
				}
			}
		}
			return "/user/profile";
		} else {
			return "redirect:/user/login";
		}
			
	}
	
	@GetMapping("/logout")
	public String logout(ModelMap map, HttpSession session, HttpServletRequest request, HttpServletResponse resp) {
		map.addAttribute("userEmail", "");
		map.addAttribute("userFirstName", "");
		map.addAttribute("userLastName", "");
		map.addAttribute("userType", "");
		map.addAttribute("userContactNo", "");
		if(map.containsKey("response"))
			map.remove("response");
		map.addAttribute("response", "Logged out successfully !! Redirecting to home page . . .");
        session.invalidate();
        resp.setHeader("refresh", "5;url="+request.getContextPath());
		return "/user/message";
	}
	

}

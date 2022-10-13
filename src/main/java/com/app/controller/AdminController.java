package com.app.controller;

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

import com.app.model.Admin;
import com.app.model.Property;
import com.app.model.UserEnquiry;
import com.app.service.IAdminService;
import com.app.utils.SiteVisitColumns;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	IAdminService adminService;
	
	@GetMapping("/")
	public String getLoginPage() {
		return "/admin/admin_login";
	}
	
	@PostMapping("/")
	public String login(@RequestParam(name="email") String email, @RequestParam(name="password") String password, 
						ModelMap map, HttpSession session, HttpServletRequest request, HttpServletResponse resp) {
		Admin adminDetails = adminService.loginAdmin(email, password);
		if(null != adminDetails) {
			if(map.containsKey("response"))
				map.remove("response");
			map.addAttribute("response", "Login Successful !! Redirecting to home page . . .");
	        session.setAttribute("adminData", adminDetails);
	        resp.setHeader("refresh", "3;url="+request.getContextPath() + "/admin/admin_dashboard");
			return "/user/message";
		} else {
			if(map.containsKey("response"))
				map.remove("response");
			map.addAttribute("response", "Invalid username or password");
			return "/admin/admin_login";
		}
		
	}
	
	@GetMapping("/register")
	public String getRegistrationPage(ModelMap map) {
		return "/admin/admin_register";
	}
	
	@PostMapping("/register")
	public String registerAdmin(@ModelAttribute("admin") Admin admin,
			ModelMap map, HttpServletRequest request, HttpServletResponse resp) {
		String message = adminService.saveAdminDetails(admin);
		if(map.containsKey("response"))
			map.remove("response");
		map.addAttribute("response", message);
		if(message.contains("Error")) {
			return "/admin/admin_register";
		}
		resp.setHeader("refresh", "3;url="+request.getContextPath() + "/admin/");
		return "/admin/message";
	}
	
	@GetMapping("/admin_dashboard")
	public String getDashboardPage(ModelMap map,
			HttpSession session, HttpServletRequest request, HttpServletResponse resp) {
		session = request.getSession(false);
		if(null != session.getAttribute("adminData")) {
			List<Property> propertyApprovalList = adminService.getPropertiesForApproval();
			List<SiteVisitColumns> scheduledVisitsList = adminService.getScheduledVisits();
			List<UserEnquiry> userEnquiriesList = adminService.getUserEnquiries();
			if(map.containsKey("propertyApprovalList"))
				map.remove("propertyApprovalList");
			map.addAttribute("propertyApprovalList", propertyApprovalList);
			if(map.containsKey("scheduledVisitsList"))
				map.remove("scheduledVisitsList");
			map.addAttribute("scheduledVisitsList", scheduledVisitsList);
			if(map.containsKey("userEnquiriesList"))
				map.remove("userEnquiriesList");
			map.addAttribute("userEnquiriesList", userEnquiriesList);
			return "/admin/admin_dashboard";
		} else {
			return "redirect:/admin/";
		}
	}
	
	@GetMapping(value = "/approve")
	public String approveProperty(@RequestParam(value = "pid") String id,
			@RequestParam(value = "type") String type,
			ModelMap map, HttpSession session, 
			HttpServletRequest request, HttpServletResponse resp) {
		session = request.getSession(false);
		String message = null;
		if(null != session.getAttribute("adminData")) {
			if(type.equalsIgnoreCase("property")) {
				message = adminService.approveOwnerProperty(id != null ? Integer.parseInt(id) : 0);
			} else if(type.equalsIgnoreCase("sitevisit")) {
				message = adminService.acknowldgeScheduledVisits(id != null ? Integer.parseInt(id) : 0);
			} else {
				message = adminService.acknowledgeUserEnquiries(id != null ? Integer.parseInt(id) : 0);
			}
			
			if(map.containsKey("response"))
				map.remove("response");
			map.addAttribute("response", message);
			return "redirect:/admin/admin_dashboard";
		} else {
			return "redirect:/admin/";
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
		map.addAttribute("response", "Logged out successfully !! Redirecting to login page . . .");
        session.invalidate();
        resp.setHeader("refresh", "3;url="+request.getContextPath() + "/admin/");
		return "/admin/message";
}
}

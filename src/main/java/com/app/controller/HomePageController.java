package com.app.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.app.model.Property;
import com.app.model.User;
import com.app.model.UserEnquiry;
import com.app.service.IHousingService;
import com.app.utils.FurnishedStatus;
import com.app.utils.PropType;
import com.app.utils.RoomSize;

@Controller
public class HomePageController {

	@Autowired
	IHousingService housingService;
	
	//add a req handling method to provide a home page (index)
	@GetMapping("/")
	public String provideHomePage(ModelMap map) {
		System.out.println("in show home page");
		List<String> propertyTypeList = new ArrayList<String>();
		List<String> roomSizeList = new ArrayList<String>();
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
		map.addAttribute("propertyTypes", propertyTypeList);
		map.addAttribute("roomSizes", roomSizeList);
		map.addAttribute("furnishedStatus",furnishedTypeList);
		return "/index";//Actual view name reted by V.R : /WEB-INF/views/index.jsp
	}
	
//	@PostMapping("/")
//	public String loadProperties(ModelMap map) {
//		System.out.println("in load property page");
//		map.addAttribute("properties_list", housingService.getProperties());
//		return "/property/property_list";
//	}
	
	@GetMapping(value = "/", params = "search")
	public String loadSearchPropertyPage(@ModelAttribute(name = "property") Property p, ModelMap map) {
		//map.addAttribute("courseId", p);
		return "/property/search_properties";
	}
	
	@PostMapping(value = "/", params = "search")
	public String loadSearchPropertyResults(HttpSession session,
			HttpServletRequest request, HttpServletResponse resp,
			@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "furnishedType", required = false) String furnishedType, 
			@RequestParam(value = "type", required = false) String propertyType,
			@RequestParam(value = "noOfRooms", required = false) String noOfRooms,
			ModelMap map) {
		//map.addAttribute("courseId", p);
		session = request.getSession(false); 
		
		if(null != session.getAttribute("userData")) {
			User u = (User) session.getAttribute("userData");
			map.addAttribute("properties_list", housingService.searchProperties(location, furnishedType, propertyType, noOfRooms, u));
		} else {
			map.addAttribute("properties_list", housingService.searchProperties(location, furnishedType, propertyType, noOfRooms, null));
		}
		
		return "/property/search_properties";
	}
	
	@GetMapping("/contact")
	public String loadContactUsPage() {
		return "/contact";
	}
	
	@PostMapping("/contact")
	public String saveUserEnquiry(@ModelAttribute("enquiry") UserEnquiry enquiry, ModelMap map,
			HttpServletRequest request, HttpServletResponse resp) {
		String message = housingService.saveEnquiryDetails(enquiry);
		map.addAttribute("response", message);
		//resp.setHeader("refresh", "3;url="+request.getContextPath() + "/contact");
		return "/contact";
	}
	
	@GetMapping("/about_us")
	public String loadAboutUsPage(ModelMap map) {
		return "/about_us";
	}
	
	@GetMapping("/services")
	public String loadServicesPage() {
		return "/services";
	}
	
}

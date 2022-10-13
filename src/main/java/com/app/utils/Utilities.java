package com.app.utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.app.model.User;

public class Utilities {
	
	public String uploadFile(User u, MultipartFile documentFile, String documentType, HttpSession session) {
		try {
			//String path = System.getProperty("user.dir");
			String directoryName = System.getProperty("user.dir");
			String folderName = "user_" + u.getId() + "_" + u.getFirstName();
			String userFolder = null;
			String contextFolder = "src/main/webapp";
			String databasePath = null;
			if(documentType.startsWith("pan") || documentType.startsWith("aadhaar")) {
				userFolder = contextFolder + "/user_documents/" + folderName;
				databasePath = "/user_documents/" + folderName;
			} else {
				userFolder = contextFolder + "/user_documents/" + folderName +"/property_pics";
				databasePath = "/user_documents/" + folderName +"/property_pics";
			}
			String path = directoryName + "/" + userFolder;
			String originalFileName = documentFile.getOriginalFilename();
			String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			String fileName = u.getId() + "_" + documentType + "." + fileExtension;
			databasePath += "/" + fileName;
			File directory = new File(path);
			if (! directory.exists()){
		        directory.mkdirs();
		        // If you require it to make the entire directory path including parents,
		        // use directory.mkdirs(); here instead.
		    }
			
			File file = new File(directory + "/" + fileName);
			if(!file.exists()) {
				file.createNewFile();
			}
			documentFile.transferTo(file);
			if(documentType.startsWith("pan")) {
				session.setAttribute("pan_card_path", databasePath);
			} else if(documentType.startsWith("aadhaar")) {
				session.setAttribute("aadhaar_card_path", databasePath);
			} else {
				session.setAttribute("prop_pic_path", databasePath);
			}
			return "Success";
		} catch (IOException ioe) {
			return ioe.getMessage();
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	
	public Double calculatePropertyMaintenanceCost(String propArea) {
		Double propertyCost, perSqFtCharge = 12.0;
		propertyCost = perSqFtCharge * Double.parseDouble(propArea);
		return propertyCost;
	}

}

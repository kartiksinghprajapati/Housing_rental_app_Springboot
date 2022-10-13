<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--import JSTL supplied core tag lib --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--import spring supplied JSP tag lib --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--import spring supplied JSP tag lib --%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
    <title>Rent A Roof</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <!-- Colors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
    <!-- ALL VERSION CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/versions.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">

    <!-- Modernizer for Portfolio -->
    <script src="${pageContext.request.contextPath}/js/modernizer.js"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<meta charset="ISO-8859-1">
<title>Payment Info</title>
</head>
<body class="realestate_version">
	<!-- LOADER -->
    <div id="preloader">
        <span class="loader"><span class="loader-inner"></span></span>
    </div><!-- end loader -->
    <!-- END LOADER -->

	<c:set var="userDetails" value="${sessionScope.userDetails}" /> <!-- This same as your request attribute.This is to check whether the user is logged in or not -->
    
    
    <header class="header header_style_01">
        <nav class="megamenu navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/Housing"><img src="${pageContext.request.contextPath}/images/logos/RentARoof.jpeg" height="60px;" alt="image"></a>
                </div>
                
                <c:set var="userDetails" value="${sessionScope.userData}" /> <!-- This same as your request attribute -->
                
               <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                    	<li><a href="<spring:url value='/'/>">Home</a></li>
                         <li><a href="<spring:url value='/services'/>">Services</a></li>
                        <li><a href="<spring:url value='/about_us'/>">About us </a></li>
                        <li><a href="<spring:url value='/property/property_list'/>">Properties</a></li>
                        <li><a href="<spring:url value='/contact'/>">Contact Us</a></li>
                        <c:choose>
						    <c:when test="${userDetails.email == null}">
						        <li><a href="<spring:url value='/user/login'/>">Login/Register</a></li>
						    </c:when>
						    <c:otherwise>
						    <li class="search-option">
								<button class="search tran3s dropdown-toggle" id="searchDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-search" aria-hidden="true"></i></button>
							<ul class="p-color-bg dropdown-menu tran3s">
								<li style="margin-left: 20px;">Hello, ${userDetails.firstName} ${userDetails.lastName}</li>
								<li><a href="<spring:url value='/user/profile'/>">My Profile</a></li>
								<c:choose>
									<c:when test="${userDetails.userType == 'owner'}">
										<li><a href="<spring:url value='/property/post_property'/>">Post a Property</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="<spring:url value='/user/tenant_wishlist'/>">My Wish List</a></li>
									</c:otherwise>
								</c:choose>
								<li><a href="<spring:url value='/user/logout'/>">Logout</a></li>
							</ul>
					   		</li>
						    </c:otherwise>      
						</c:choose>
                    </ul>
                </div>
                
            </div>
        </nav>
    </header>
    
    
    <div class="about-box">
        <!-- <div class="container">
            <div class="row">
            </div>
        </div> -->
    </div>
    
    
    <div class="about-box">
		<div class="container">
			<div class="row">
			</div>
			<div class="row">
				<%-- <div class="col-md-6">
                    <div class="post-media wow fadeIn" style="visibility: visible; animation-name: fadeIn;">
                        <img src="${pageContext.request.contextPath}/uploads/about_bg.jpg" alt="" class="img-responsive">                        
                    </div><!-- end media -->
                </div> --%>
                <form:form id="contactform1" class="row" name="contactform" method="post">
				<div class="col-md-6" style="width:100%; text-align: center;">
					<div class="message-box right-ab">
					<h2>${requestScope.response}</h2>
					<h2>Schedule Appointment</h2>
                       
                        <p> Thank you for showing interest in the below property !!!</p>
                        
                 <div class="row">
				<div class="col-md-6">
					<div id="da-thumbs" class="da-thumbs portfolio">
						<div class="post-media_g pitem item-w1 item-h1 cat2">
	                      <a href="${pageContext.request.contextPath}/${property.propertyPic}"  data-rel="prettyPhoto[gal]">   
	                      <img src="${pageContext.request.contextPath}/${property.propertyPic}" alt="" class="img-responsive">
	                        <div>
	                           	<i class="flaticon-unlink"></i>
	                       	</div>
	                  		</a>                     
	                  </div><!-- end media -->
					</div>
		        </div>
				<div class="col-md-6">
					<div class="message-box right-ab">
                      <h4><b>Location: </b> ${property.area}</h4>
                      <h3><b>Society Name: </b> ${property.societyName}</h3>
                      <h3><b>Additional Info: </b>${property.additionalInfo}</h3>
                      <h3><b>Bedroom: </b>${property.noOfRooms}</h3>
                      <h3><b>Property Size: </b>${property.size}</h3>
                      <h3><b>Furnished Status: </b> ${property.furnishedType}</h3>
					  <h3><b>Parking Type: </b>${property.parkingType}</h3>
					  <h3><b>Property Type: </b>${property.type}</h3>
                      <h3><b>Posted By: </b>${property.userId.firstName} ${property.userId.lastName}</h3>
                      <h3><b>Posted on: </b>${property.createdDate}</h3>
                      <input type="hidden" name="propertyId" id="propertyId" value="${property.id}">
		            </div>
				</div>
			</div>   
						
				<div class="contact_form">
                	<h3>Please select one of the below option to check out the property : </h3>
                	<form:form id="contactform1" class="row" name="contactform" method="post">
                		<fieldset class="row-fluid">
	                	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:25%; text-align: left;">
	                		<input type="radio" name="scheduleMode" id="visitASite" value="Visit A Site" onclick="showDiv();">Visit A Site <br>
	                		<input type="radio" name="scheduleMode" id="videoConferencing" value="Video Conferencing" onclick="showDiv();">Video Conferencing <br>
	                		<input type="hidden" name="dynamicName" id="dynamicName">
	                	</div>
	                	<div id="Div1" class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:75%; display: none;">
	                		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:30%;">
	                			<label>Select Date and Time : </label>
	                        </div>
	                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	                            <input type="datetime-local" min="${today}" name="date" id="date" class="form-control" placeholder="dd-mm-yyyy">
	                        </div>
	                    </div>
	                     <br>
	                     <br>
	                     <br>
						<%-- <a href="<spring:url value='/user/index'/>" class="btn btn-light btn-radius grd1 btn-brd"> Schedule Appointment </a> --%>
						<input type="submit" value="Schedule Appointment" id="submit1" class="btn btn-light btn-radius btn-brd grd1 btn-block">
					</fieldset>
				</form:form>
          	</div>
			
			</div>
			
		</div>
		</form:form>
	</div>
	</div>
	</div>
	
	<footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                           <img src="${pageContext.request.contextPath}/images/logos/RentARoof.jpeg" alt="">
                        </div>
                        <p> RentARoof is India's fastest growing "Managed Home Rental Network" attempting to provide better rental solutions via design and technology.</p>
						<p>We help find, book rental homes of choice across Indian cities without paying any brokerage. We assist with move-in, visiting sites and even move-out.</p>
                    </div><!-- end clearfix -->
                </div><!-- end col -->

                <div class="col-md-3 col-sm-3 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>Info Link</h3>
                        </div>

                        <ul class="twitter-widget footer-links">
                            <li><a href="#"> Home </a></li>
                            <li><a href="#"> About Us </a></li>
                            <li><a href="#"> Services</a></li>
							<li><a href="#"> Gallery</a></li>
							<li><a href="#"> Properties</a></li>
							<li><a href="#"> Contact</a></li>
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
				
				<div class="col-md-3 col-sm-3 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>Contact Details</h3>
                        </div>

                        <ul class="footer-links">
                            <li><a href="mailto:#">info@rentaroof.com</a></li>
                            <li><a href="#">www.rentaroof.com</a></li>
                            <li>Innovation Park 34, B/1, Panchawati Rd, Panchawati, Pashan, Pune, Maharashtra 411008</li>
                            <li>+91 xxxxx xxxxx</li>
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
				
                <div class="col-md-2 col-sm-2 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>Social</h3>
                        </div>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-facebook"></i> Facebook</a></li>
                            <li><a href="#"><i class="fa fa-github"></i> Github</a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i> Twitter</a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i> Dribbble</a></li>
                            <li><a href="#"><i class="fa fa-pinterest"></i> Pinterest</a></li>
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
				
            </div><!-- end row -->
        </div><!-- end container -->
    </footer><!-- end footer -->

    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
                <div class="footer-left">
                    <p class="footer-company-name">All Rights Reserved. &copy; 2021 <a href="#">Rent A Roof</a> Design By : <a href="#">Group 26</a></p>
                </div>

                <div class="footer-right">
                    <form method="get" action="#">
                        <input placeholder="Subscribe our newsletter.." name="search">
                        <i class="fa fa-envelope-o"></i>
                    </form>
                </div>
            </div>
        </div><!-- end container -->
    </div><!-- end copyrights -->

	<a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>

    <!-- ALL JS FILES -->
    <script src="${pageContext.request.contextPath}/js/all.js"></script>
    <!-- ALL PLUGINS -->
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/js/portfolio.js"></script>
    <script src="${pageContext.request.contextPath}/js/hoverdir.js"></script>    
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
   <!-- MAP & CONTACT -->
    <script src="${pageContext.request.contextPath}/js/map.js"></script>
    
    <script type="text/javascript">
    	function showDiv() {
    		var siteVisit = document.getElementById("visitASite");
    		var virtual = document.getElementById("videoConferencing");
    		
    		if(siteVisit.checked) {
    			document.getElementById("dynamicName").value = siteVisit.value;
    			
    		} else {
    			document.getElementById("dynamicName").value = virtual.value;
    		} 
    		if(document.getElementById('visitASite').checked
    				|| document.getElementById('videoConferencing').checked) {
    			document.getElementById('Div1').style.display = "block";
    		} 
    	}
    </script>
</body>
</html>
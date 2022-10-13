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

	<c:set var="userDetails" value="${sessionScope.userData}" /> <!-- This same as your request attribute -->
	
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
            	<div class="contact_form">
                    	<h3> 
                         Upload Tenant's documents
                        </h3>
                        
                        <form:form id="contactform1" class="row" name="contactform" method="post" enctype="multipart/form-data" modelAttribute="property">
                            <fieldset class="row-fluid">
                            	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:100%;">
	                                <h3>${requestScope.errorMsg}</h3>
	                                <h3>${requestScope.file_upload_error}</h3>
                                </div>
                                
                            	<c:choose>
								    <c:when test="${sessionScope.aadhaarStatus == 'both'}">
								        <%-- <li><a class="active" href="<spring:url value='/user/login'/>">Login/Register</a></li> --%>
								        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:25%;">
								        	<label id="panCardLabel" class="form-control" >Select PAN Card</label>
								        </div>
								        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:75%;">
								        	<input type="file" name="panCard" id="panCard" accept="image/*,.pdf" class="form-control" placeholder="Select PAN card">
								        </div>
								        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:25%;">
								        	<label id="aadhaarCardLabel" class="form-control" >Select Aadhaar Card</label>
								        </div>
								        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:75%;">
								        	<input type="file" name="aadhaarCard" id="aadhaarCard" accept="image/*,.pdf" class="form-control" placeholder="Select Aadhaar">
								        </div>
								    </c:when>
								    <c:when test="${sessionScope.aadhaarStatus == 'pan'}">
								    	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:25%;">
								        	<label id="panCardLabel" class="form-control" >Select PAN Card</label>
								        </div>
								    	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:75%;">
								        	<input type="file" name="panCard" id="panCard" accept="image/*,.pdf" class="form-control" placeholder="Select PAN card">
								        </div>
								    </c:when>
								    <c:when test="${sessionScope.aadhaarStatus == 'aadhaar'}">
								    	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:25%;">
								        	<label id="aadhaarCardLabel" class="form-control" >Select Aadhaar Card</label>
								        </div>
								    	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:75%;">
								        	<input type="file" name="aadhaarCard" id="aadhaarCard" accept="image/*,.pdf" class="form-control" placeholder="Select Aadhaar">
								        </div>
								    </c:when>
								</c:choose>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:75%;">
								        <input type="submit" name="post" value="Book this property" id="submit1" class="btn btn-light btn-radius btn-brd grd1 btn-block">
								    </div>
                            </fieldset>
                        </form:form>
                </div>
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

</body>
</html>
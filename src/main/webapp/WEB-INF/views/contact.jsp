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
<title>Contact Us</title>
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
                        <li><a class="active" href="<spring:url value='/contact'/>">Contact Us</a></li>
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
	
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>Contact</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="<spring:url value='/'/>">Home</a></li>
							<li>Contact</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<div id="support" class="section wb">
        <div class="container">
            <div class="section-title text-center">
                <h3>Request for Contact</h3>
                <p class="lead">Let us give you more details about the special offer you want with us. Please fill out the form below. <br>We have many customers who are happy to work with us!</p>
            </div><!-- end title -->

            <div class="row">
                <div class="col-md-6">
                    <div class="contact_form">
                    <h2>${requestScope.response}</h2>
                        <div id="message"></div>
                        <form:form id="contactform1" class="row" name="contactform11" method="post" modelAttribute="enquiry">
                            <fieldset class="row-fluid">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="firstName" id="firstName" class="form-control" placeholder="First Name"/>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="lastName" id="lastName" class="form-control" placeholder="Last Name"/>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="email" name="email" id="email" class="form-control" placeholder="Your Email"/>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="contactNo" id="contactNo" class="form-control" placeholder="Your Phone"/>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <label class="sr-only">Select Day</label>
                                    <select name="contactDay" id="contactDay" class="selectpicker form-control" data-style="btn-white">
                                        <option value="selecttime">Select Day</option>
                                        <option value="Weekdays">Weekdays</option>
                                        <option value="Weekend">Weekends</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <label class="sr-only">Select Time</label>
                                    <select name="contactTime" id="contactTime" class="selectpicker form-control" data-style="btn-white">
                                        <option value="9AM-12PM">9AM - 12PM</option>
                                        <option value="12PM-3PM">12PM - 3PM</option>
                                        <option value="3PM-6PM">3PM - 6PM</option>
                                    </select>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <textarea class="form-control" path="comments" name="comments" id="comments" rows="6" placeholder="Give us more details.."></textarea>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                    <input type="submit"" value="Get Appointment" id="submit" class="btn btn-light btn-radius btn-brd grd1 btn-block"/>
                                </div>
                            </fieldset>
                        </form:form>
                    </div>
                </div><!-- end col -->
				<div class="col-md-6">
					<div class="right-box-contact">
						<h4>Phone</h4>
						<div class="support-info">
							<div class="info-title">
								<i class="fa fa-phone" aria-hidden="true"></i>
								+ 91 xxxxx xxxxx
								<span>Booking Time: 0900 to 1800 Hrs</span>
							</div>
						</div>
					</div>
					<div class="right-box-contact">
						<h4>Address</h4>
						<div class="support-info">
							<div class="info-title">
								<i class="fa fa-map-marker" aria-hidden="true"></i>
								Address
								<span>Innovation Park 34, B/1, Panchawati Rd, Panchawati, Pashan, Pune, Maharashtra 411008</span>
							</div>
						</div>
					</div>
					<div class="right-box-contact">
						<h4>Your Feedback</h4>
						<div class="support-info">
							<div class="info-title">
								<i class="fa fa-envelope" aria-hidden="true"></i>
								info@rentaroof.com
								<span>Help Us Improve!</span>
							</div>
						</div>
					</div>
				</div><!-- end col -->
            </div><!-- end row -->
            
            <div class="row">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.8677913209394!2d73.80882141420439!3d18.534875673575588!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bf40bef092f1%3A0x48c508ccaa4ef9a!2sCentre%20For%20Development%20Of%20Advanced%20Computing%2C%20Innovation%20Park!5e0!3m2!1sen!2sin!4v1616324187044!5m2!1sen!2sin" width="100%" height="600" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
			</div>
        </div><!-- end container -->
    </div><!-- end section -->

	<!-- <div id="map"></div> -->
	

    

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
    <script src="js/all.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    <script src="js/portfolio.js"></script>
    <script src="js/hoverdir.js"></script>    
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
   <!-- MAP & CONTACT -->
    <script src="js/map.js"></script>

</body>
</html>
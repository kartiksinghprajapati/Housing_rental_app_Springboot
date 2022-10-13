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
                
                <c:set var="userDetails" value="${sessionScope.userDetails}" /> <!-- This same as your request attribute -->
                
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
                <%-- <form:form id="contactform1" class="row" name="contactform" method="post"> --%>
				<div class="col-md-6" style="width:100%; text-align: center;">
					<div class="message-box right-ab">
					<h2>${requestScope.response}</h2>
					<h2>Welcome to Rent A Roof</h2>
                        <h4>HOW IT WORKS?</h4>
                        <p>Now that you have successfully submitted your property with us, you are just one step away from making your property available to tenants.</p>
						<p>We at Rent A Roof are committed to deliver state of the art services to our clients and taking care of their properties as our own. Having said that, 
							we would just need below AMC (annual maintenance charges) from you so that we can take care of any maintenance that is required for your property.</p>
						<p>Our Maintenance charges are not on a higher side but depending on the size of your property, it gets calculated on a pro-rata basis from our system itself.</p>
						
						<hr class="hr1">
						
						<p>As per your property size, you are required to pay Rs. ${requestScope.calculatedValue}/-</p>
						<p>After your payment is successful, your property will go live and will be available in the search results within 24 hours of your payment.</p>
						
						<a href="<spring:url value='/property/transaction'/>" class="btn btn-light btn-radius grd1 btn-brd"> Click to Pay </a>
						<!-- <input type="submit" value="Search Properties" id="submit1" class="btn btn-light btn-radius btn-brd grd1 btn-block"> -->
                    </div>
				</div>
				<%-- </form:form> --%>
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
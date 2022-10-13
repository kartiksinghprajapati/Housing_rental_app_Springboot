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
			</div>
			<div class="row">
				<%-- <div class="col-md-6">
                    <div class="post-media wow fadeIn" style="visibility: visible; animation-name: fadeIn;">
                        <img src="${pageContext.request.contextPath}/uploads/about_bg.jpg" alt="" class="img-responsive">                        
                    </div><!-- end media -->
                </div> --%>
                <div class="contact_form">
                	<h2>Choose the Payment Mode </h2>
                	<form:form id="contactform1" class="row" name="contactform" method="post">
                	<fieldset class="row-fluid">
	                	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:25%;">
	                		<input type="radio" name="paymentMode" id="creditCard" value="Credit Card" onclick="showDiv();">Credit Card <br>
	                		<input type="radio" name="paymentMode" id="debitCard" value="Debit Card" onclick="showDiv();">Debit Card <br>
	                		<input type="radio" name="paymentMode" id="netBanking" value="Net Banking" onclick="showDiv();">Net Banking <br>
	                		<input type="hidden" name="dynamicName" id="dynamicName">
	                	</div>
	                	<div id="cardDiv1" class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="display: none;">
		                	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		                		<img alt="Credit Card Logos" title="Credit Card Logos" 
								src="http://www.credit-card-logos.com/images/visa_credit-card-logos/visa_mastercard_logo_6.gif" 
								width="102" height="32" border="0" />
								<img alt="Credit Card Logos" title="Credit Card Logos" src="http://www.credit-card-logos.com/images/american_express_credit-card-logos/american_express_logo_1.gif" 
								width="43" height="43" border="0" />
		                	</div>
	                		
	                	</div>
	                	<div id="cardDiv2" class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:75%; display: none;">
	                		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:30%;">
	                			<label>Card Holder's Name:</label>
	                        </div>
	                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	                            <input type="text" name="cardName" id="cardName" class="form-control" placeholder="Enter Card Holder's Name">
	                        </div>
	                		<!-- <div class="message-box right-ab">
	                		 <input type="text" name="cardName" id="cardName"  placeholder="e"> 
	                		<br><br>
	                		</div> -->
	                		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:30%;">
	                			<label>Card Number:</label>
	                        </div>
	                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	                        	<input type="text" maxlength="4" size="4" name="cardNo1" id="cardNo1" style="margin-bottom: 30px;"> - 
	            				<input type="text" maxlength="4" size="4" name="cardNo2" id="cardNo2" style="margin-bottom: 30px;"> - 
	            				<input type="text" maxlength="4" size="4" name="cardNo3" id="cardNo3" style="margin-bottom: 30px;"> - 
	            				<input type="text" maxlength="4" size="4" name="cardNo4" id="cardNo4" style="margin-bottom: 30px;">
	                        </div>
	                		 
	                		 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:30%;">
	                			 <label>Expiry Date:</label> 
	                		 </div>
	                		 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	                		 	<input type="text" maxlength="2" size="2" name=expiryMonth id="expiryMonth" placeholder="MM" style="margin-bottom: 30px;">
	                		 	/<input type="text" maxlength="4" size="4" name=expiryYear id="expiryYear" placeholder="YYYY" style="margin-bottom: 30px;">
	                		 	<label>CVV: </label>
	                		    <input type="password" maxlength="3" size="3" name=cvv id="cvv" style="margin-bottom: 30px;">
	                		</div>
	                	</div>
	                	<div id="netBankDiv" class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:75%; display: none;">
	                		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:100%;">
	                			 <select name="bankName" id="bankName" class="form-control" data-style="btn-white" onchange="showDiv();">
	                			 <option value="bankNameValue" disabled="disabled" selected="selected">Select Bank</option>
	                			 <option value="hdfcBank">HDFC Bank</option>
	                			 <option value="iciciBank">ICICI Bank</option>
	                			 <option value="axisBank">Axis Bank</option>
	                			 <option value="kotakBank">Kotak Mahindra Bank</option>
	                			 <option value="sbi">SBI</option>
	                			 <option value="pnb">Punjab National bank</option>
	                			 <option value="bob">Bank Of Baroda</option>
	                			 </select> 
	                		 </div>
	                	</div>
	                	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:25%;">
	                	</div>
	                	<div id="credentialsDiv" class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:75%; display: none;">
	                		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:30%;">
	                			 <label>Enter User ID:</label> 
	                		 </div>
	                		 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	                            <input type="text" name="userId" id="userId" class="form-control" placeholder="Enter user id">
	                        </div>
	                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="width:30%;">
	                			 <label>Enter Password:</label> 
	                		 </div>
	                		 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	                            <input type="password" name="password" id="password" class="form-control">
	                        </div>
	                	</div>
	                		
	                	
	               		<div id="btnDiv" class="col-md-6" style="width:100%; text-align: center; display: none;">
							<div class="message-box right-ab">
							<!-- <a href="http://www.credit-card-logos.com/">
							</a> -->
		                    </div>
		                    <div class="message-box right-ab">
		                    	<%-- <a href="<spring:url value='/property/transaction'/>" class="btn btn-light btn-radius grd1 btn-brd"> Pay </a> --%>
								<input type="submit"  name="pay" value="Pay" id="submit1" class="btn btn-light btn-radius btn-brd grd1 btn-brd">
		                    </div>
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
    
    <script type="text/javascript">
    	function showDiv() {
    		var cardDiv1 = document.getElementById("cardDiv1");
    		var cardDiv2 = document.getElementById("cardDiv2");
    		var netBankDiv = document.getElementById("netBankDiv");
    		var btnDiv = document.getElementById("btnDiv");
    		var bankName = document.getElementById("bankName");
    		var credentialsDiv = document.getElementById("credentialsDiv");
    		//
    		if(document.getElementById('creditCard').checked) {
    			document.getElementById("dynamicName").value = document.getElementById('creditCard').value;
    		} else if(document.getElementById('debitCard').checked) {
    			document.getElementById("dynamicName").value = document.getElementById('debitCard').value;
    		} else {
    			document.getElementById("dynamicName").value = document.getElementById('netBanking').value;
    		}
    		if(document.getElementById('creditCard').checked
    				|| document.getElementById('debitCard').checked) {
    			bankName.value = "bankNameValue";
    			netBankDiv.style.display = "none";
    			credentialsDiv.style.display = "none";
    			cardDiv1.style.display = "block";
    			cardDiv2.style.display = "block";
    			btnDiv.style.display = "block";
    		} else if(document.getElementById('netBanking').checked) {
    			cardDiv1.style.display = "none";
    			cardDiv2.style.display = "none";
    			credentialsDiv.style.display = "none";
    			btnDiv.style.display = "none";
    			netBankDiv.style.display = "block";
    		}
    		if(bankName.value != 'bankNameValue') {
    			credentialsDiv.style.display = "block";
    			btnDiv.style.display = "block";
    		}
    	}
    </script>
    
</body>
</html>
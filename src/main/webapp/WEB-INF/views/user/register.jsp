<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--import JSTL supplied core tag lib --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--import spring supplied JSP tag lib --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%--import spring supplied JSP tag lib --%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<title>Registration</title>
</head>
<body class="realestate_version">

	<!-- LOADER -->
    <div id="preloader">
        <span class="loader"><span class="loader-inner"></span></span>
    </div><!-- end loader -->
    <!-- END LOADER -->
    
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
						        <li><a class="active" href="<spring:url value='/user/login'/>">Login/Register</a></li>
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
    
    <!-- <div class="parallax first-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6 wow slideInLeft hidden-xs hidden-sm">
                    
                </div>
            </div>
        </div>
    </div> -->
    
    <div class="about-box">
        <!-- <div class="container">
            <div class="row">
            </div>
        </div> -->
    </div>
    
    <!-- <div class="about-box" > -->
    	<div id="validations" class="container" style="display:none;">
            <div class="row">
		    	<span id="fnames" class="text-danger"></span><br>
		    	<span id="lnames" class="text-danger"></span><br>
		    	<span id="emails" class="text-danger"></span><br>
		    	<span id="mobiles" class="text-danger"></span><br>
		    	<span id="addresss" class="text-danger"></span><br>
		    	<span id="passwords" class="text-danger"></span><br>
		    	<span id="cpasswords" class="text-danger"></span><br>
    		</div>
    	</div>
    <!-- </div> -->
    
    <div class="about-box">
        <div class="container">
            <div class="row">
            	<div class="contact_form">
                    	<h3> 
                         REGISTER
                        </h3>
                        <h2>${requestScope.response}</h2>
                        <form:form id="contactform1" class="row" name="contactform" method="post" modelAttribute="user">
                            <fieldset class="row-fluid">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="firstName" id="firstName" class="form-control" placeholder="First Name*">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="lastName" id="lastName" class="form-control" placeholder="Last Name*">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="email" name="email" id="email" class="form-control" placeholder="Your Email*">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="contactNo" id="contactNo" class="form-control" placeholder="Your Phone*">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="address1" id="address1" class="form-control" placeholder="Address Line 1*">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="address2" id="address2" class="form-control" placeholder="Address Line 2">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password*">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" name="confirmpwd" id="confirmpwd" class="form-control" placeholder="Confirm Password*">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <!-- <label class="sr-only">Choose First Security Question*</label> -->
                                    <select name="securityQuesOne" id="securityQuesOne" class="form-control" data-style="btn-white">
									     <option value="selectQues" disabled="disabled" selected="selected">Select First Question</option>
									     <c:forEach items="${securityQuestions}"  var="ques">
									         <option value="${ques.questionName}">${ques.questionName}</option>
									     </c:forEach>
									 </select>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="securityAnsOne" id="securityAnsOne" class="form-control" placeholder="Enter First Answer">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <!-- <label class="sr-only">Choose Second Security Question</label> -->
                                    <select name="securityQuesTwo" id="securityQuesTwo" class="form-control" data-style="btn-white">
									     <option value="selectQues1" disabled="disabled" selected="selected">Select Second Question</option>
									     <c:forEach items="${securityQuestions}"  var="ques">
									         <option value="${ques.questionName}">${ques.questionName}</option>
									     </c:forEach>
									 </select>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                     <input type="text" name="securityAnsTwo" id="securityAnsTwo" class="form-control" placeholder="Enter Second answer">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <!-- <label class="sr-only">Choose Third Security Question</label> -->
                                    <select name="securityQuesThree" id="securityQuesThree" class="form-control" data-style="btn-white">
									     <option value="selectQues2" disabled="disabled" selected="selected">Select Third Question</option>
									     <c:forEach items="${securityQuestions}"  var="ques">
									         <option value="${ques.questionName}">${ques.questionName}</option>
									     </c:forEach>
									 </select>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="securityAnsThree" id="securityAnsThree" class="form-control" placeholder="Enter Third answer">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <!-- <label class="sr-only">I am a </label> -->
                                    <select name="userType" id="userType" class="form-control" data-style="btn-white">
                                    <option value="selectQues2" disabled="disabled" selected="selected">I am a</option>
                                        <option value="owner">Owner</option>
                                        <option value="tenant">Tenant</option>
                                    </select>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                	<%-- <form:form method="post" modelAttribute="property"> --%>
                                    <input type="submit" onclick="return validation();" value="Sign Up" id="submit1" class="btn btn-light btn-radius btn-brd grd1 btn-block">
                                	<%-- </form:form> --%>
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
        function validation(){
        	var validationsDiv = document.getElementById("validations");
    var firstname=document.getElementById("firstName").value;
    var lastname=document.getElementById('lastName').value;
    var email=document.getElementById('email').value;
    var password=document.getElementById('password').value;
    var cnfpassword=document.getElementById('confirmpwd').value; 
    var mobile=document.getElementById('contactNo').value;
    var address=document.getElementById('address1').value;
    
		   	 if(firstname=="" && lastname=="" && email == "" && password=="" && address=="" && mobile=="")
		    	{
		   		validationsDiv.style.display = "block";
		    	document.getElementById('fnames').innerHTML=" **First name is required";
		    	document.getElementById('lnames').innerHTML=" **Last name is required";
		    	document.getElementById('emails').innerHTML="**Please Enter Your Valid Email-Id !!!!";
		    	document.getElementById('passwords').innerHTML="**Please Enter Your Password !!!!";
		    	document.getElementById('addresss').innerHTML=" **Please fill the address.";
		    	document.getElementById('mobiles').innerHTML=" **Please fill the mobile no.";
		    	return false;
		    	}
    
            if(firstname=="")
            {
            	validationsDiv.style.display = "block";
                document.getElementById('fnames').innerHTML=" **First name is required";
                return false;
            }
            else 
            {
            	validationsDiv.style.display = "block";
                if((firstname.length <0)|| (firstname.length >20))
                {
                  document.getElementById('fnames').innerHTML=" **First name should be between 5 to 20 character";
                  return false;
                }
                else if(!isNaN(firstname))
                {
                  document.getElementById('fnames').innerHTML=" **First name should not be number";
                  return false;
                }
                else {
                	validationsDiv.style.display = "none";
                	 document.getElementById('fnames').innerHTML="";
                }
               
                
            }    


            if(lastname=="")
            {
            	validationsDiv.style.display = "block";
                document.getElementById('lnames').innerHTML=" **Last name is required";
               return false;
            }
           else  
           {
        	   validationsDiv.style.display = "block";
               if((lastname.length <0)|| (lastname.length >20))
               {
                document.getElementById('lnames').innerHTML=" **Last name should be between 5 to 20 character";
                return false;
               }
               else if(!isNaN(lastname))
               {
                document.getElementById('lnames').innerHTML=" **Last name should not be number";
                return false;
               }
                else {
                	validationsDiv.style.display = "none";
                	document.getElementById('lnames').innerHTML="";
                }
                
                //return true;
            }    


            if(email == "")
            {
            	validationsDiv.style.display = "block";
            	document.getElementById('emails').innerHTML="**Please Enter Your Valid Email-Id !!!!";
                return false;
            }
            else if(email!="") 
            {
            	validationsDiv.style.display = "none";
                document.getElementById('emails').innerHTML="";
            }
            
            if(mobile=="")
            {
            	validationsDiv.style.display = "block";
                document.getElementById('mobiles').innerHTML=" **Please fill the mobile no.";
               return false;
            }
            else
            {
            	validationsDiv.style.display = "block";
                if(isNaN(mobile))
                {
                    document.getElementById('mobiles').innerHTML=" **Mobile no should not be character";
                    return false;
                }
                else if(mobile.length!=10)
                {
                    document.getElementById('mobiles').innerHTML=" **Mobile no should be 10 digits";
                    return false;
                }
                else
                {
                	validationsDiv.style.display = "none";
                    document.getElementById('mobiles').innerHTML="";
                }
            }
            
            if(address=="")
            {
            	validationsDiv.style.display = "block";
                document.getElementById('addresss').innerHTML=" **Please fill the address.";
                return false;
            }
            if(address.length>20)
            {
            	validationsDiv.style.display = "block";
                document.getElementById('addresss').innerHTML=" **Please use next field to complete the address !!";
            }

            if(password=="")
            {
            	validationsDiv.style.display = "block";
                document.getElementById('passwords').innerHTML="**Please Enter Your Password !!!!";
                return false;
            }
	        else 
            {
	        	validationsDiv.style.display = "block";
                if(password.length<8)
                {
                    document.getElementById('passwords').innerHTML=" **Password should be >= 8 digits";
                   return false;
                }
               
            }    


            if(cnfpassword!=password)
	    	{
            	validationsDiv.style.display = "block";
		    	document.getElementById('cpasswords').innerHTML=" **Password must be same";
                return false;
		    }

            

            
            
        }
    </script>
    
</body>
</html>
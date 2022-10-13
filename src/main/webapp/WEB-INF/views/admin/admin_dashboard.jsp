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
<title>Login</title>
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
                
                <c:set var="adminDetails" value="${sessionScope.adminData}" /> <!-- This same as your request attribute -->
                
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <c:choose>
						    <c:when test="${adminDetails.email == null}">
						        <li><a href="<spring:url value='/admin/'/>">Login</a></li>
						        <li><a href="<spring:url value='/admin/register'/>">Register</a></li>
						    </c:when>
						    <c:otherwise>
						    	<li><a class="active" href="<spring:url value='/admin/admin_dashboard'/>">Dashboard</a></li>
								<li><a href="<spring:url value='/admin/logout'/>">Logout</a></li>
						    </c:otherwise>      
						</c:choose>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    
    <div class="about-box">
    </div>
    
    <div class="about-box">
        <div class="container">
            <div class="row">
            <h2>Welcome: ${adminDetails.firstName} ${adminDetails.lastName}</h2>
            
            <h3> ${requestScope.response}</h3>
            <h3>Properties for your approval</h3>
            <form:form id="contactform1" class="row" name="contactform" method="post">
            <table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Property Id</th>
			      <th scope="col">Property Address</th>
			      <th scope="col">Rooms</th>
			      <th scope="col">Posted By</th>
			      <th scope="col">Action</th>
			    </tr>
			  </thead>
	            <c:forEach var="v" items="${requestScope.propertyApprovalList}">
					  <tbody>
					    <tr>
					      <th scope="row">${v.id}</th>
					      <td>${v.propertyNumber}, ${v.societyName}, ${v.area}</td>
					      <td>${v.noOfRooms}</td>
					      <td>${v.userId.firstName} ${v.userId.lastName}</td>
					      <td>
					      <a href="<spring:url value='/admin/approve?pid=${v.id}&type=property'/>" 
										class="btn btn-light btn-radius grd1 btn-brd"> Approve </a>
						  </td>
					    </tr>
					  </tbody>
				</c:forEach>
			</table>
			</form:form>
            </div>
            
            <div class="row">
            
            <h3> ${requestScope.response}</h3>
            <h3>Scheduled visits from tenants</h3>
            <form:form id="contactform1" class="row" name="contactform" method="post">
            <table class="table table-striped">
			  <thead>
			    <tr>
			    <th scope="col">Tenant Name</th>
			      <th scope="col">Property Address</th>
			      <th scope="col">Mode of visit</th>
			      <th scope="col">Date and Time of visit</th>
			      <th scope="col">Action</th>
			    </tr>
			  </thead>
	            <c:forEach var="v" items="${requestScope.scheduledVisitsList}">
					  <tbody>
					    <tr>
					      <td>${v.tenantName}</td>
					      <td>${v.propertyAddress}</td>
					      <td>${v.visitMode}</td>
					      <td>${v.visitDateTime}</td>
					      <td>
					      <a href="<spring:url value='/admin/approve?pid=${v.id}&type=sitevisit'/>" 
										class="btn btn-light btn-radius grd1 btn-brd">  Acknowledge  </a>
						  </td>
					    </tr>
					  </tbody>
				</c:forEach>
			</table>
			</form:form>
            </div>
            
            <div class="row">
            
            <h3> ${requestScope.response}</h3>
            <h3>User Inquiries</h3>
            <form:form id="contactform1" class="row" name="contactform" method="post">
            <table class="table table-striped">
			  <thead>
			    <tr>
			    <th scope="col">Inquiry Number</th>
			    <th scope="col">Visitor Name</th>
			      <th scope="col">Visitor Email</th>
			      <th scope="col">Contact Number</th>
			      <th scope="col">Day and Time of Contact</th>
			      <th scope="col">Comments</th>
			      <th scope="col">Action</th>
			    </tr>
			  </thead>
	            <c:forEach var="v" items="${requestScope.userEnquiriesList}">
					  <tbody>
					    <tr>
					      <th scope="row">${v.id}</th>
					      <td>${v.firstName} ${v.lastName}</td>
					      <td>${v.email}</td>
					      <td>${v.contactNo}</td>
					      <td>${v.contactDay} between ${v.contactTime}</td>
					      <td>${v.comments}</td>
					      <td>
					      <a href="<spring:url value='/admin/approve?pid=${v.id}&type=enquiry'/>" 
										class="btn btn-light btn-radius grd1 btn-brd"> Acknowledge </a>
						  </td>
					    </tr>
					  </tbody>
				</c:forEach>
			</table>
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
             
                    </div><!-- end clearfix -->
                </div><!-- end col -->
			 </div>
	     </div>
	 </footer>
    
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
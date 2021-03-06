<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>	
		<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="assets/img/cisco-logo.ico" />
	<title>NSO</title>
	<link href="<c:url value="/assets/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/main.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/stylesheet.css" />" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
	<link href="css/style.css" rel="stylesheet" type="text/css">
	
	<%--  <%List<String> deviceList=(List<String>)request.getAttribute("device"); %> --%>
</head>
<body>
<!-- navbar -->
   <header id="header" class="animated fadeIn">
   <nav class="navbar navbar-default">
   <div class="container">
      <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="assets/img/cisco-logo.png" alt=""></a>
    </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item active"><a href="<c:url value="home"/>">Home</a></li>
        <li><a href="#">Settings</a></li>
        <li><a href="#">Applications</a></li>
        <li><a href="#">Work queue</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("user")%><span class="caret"></span></a>
          <ul class="dropdown-menu">
           <!--  <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li> -->
            <li><a href="NSOController?type=logout">logout</a></li>
          </ul>
        </li>
      </ul>
    </div>

       </div>
    </nav>
    </header>
   <!-- navbar -->
	<div class="add-device">
  <div class="container">
   		<section>
        	<div class="wrapper">
            	<div class="butn-row">
                	<h3><img src="<c:url value="/resources/img/service-name.png" />" alt="" /> services</h3>
                </div>
                <div class="service-main"> 
                    
                    <table width="100%" cellpadding="0" cellspacing="0" border="1px solid #bebbbb">
                    	<tr class="serviceGridHeader">                      	
                            <td>&nbsp;</td>
                       		<td align="center"><input type="checkbox" value="1" /></td>
                            <td> VPN Name</td>             
                            <td align="right">
                            	<div class="showMain">
                                	<div class="showDiv">show</div>
                                    <div class="showDiv"><input type="text" value="all" class="show-text" /></div>
                                    <div class="filter"><a href="#"><img src="<c:url value="/resources/img/filter-icon.png" />" alt="filter" /></a></div>
                               </div>
                            </td>   	
                           
                        </tr>
                        <c:forEach var="service" items="${device}">                        
                        <c:if test="${fn:contains(service,'l2')}">
                        <c:set var="splitArray" value="${fn:split(service, '/')}" />
                      	<c:set var="vpnName" value="${fn:split(splitArray[1], ':')}" />
                        <tr class="gridRows">
                        <td>    
                          <img src="<c:url value="/resources/img/services-small.png"/>"alt="service" /></td>
                          <td align="center"> <input type="checkbox" value="1" /></td>
                           <td><a href="l2VpnService?path=${service}&vpn=${vpnName[1]}">${vpnName[1]}</a></td> 
                        <%--   <td><a href="NSOController?type=vpnService&path=<%=device%>"><%=arr[2]%></a></td> --%>      
                          <td>&nbsp;</td>
                                                   
                        </tr>
                          </c:if>
                        </c:forEach>
                     </table>
                </div>
            </div>
        </section>
 </div>
	</div>
<!-- Footer -->
       <footer id="footer" class="animated fadeIn">
     <p>� 2010-2016 Cisco Systems, Inc.</p>
   </footer>
<!-- Footer -->
  	<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
  	<script src="assets/js/vendor/bootstrap.min.js"></script>
  	<script src="assets/js/vendor/jquery.validate.min.js"></script>
  	<script src="assets/js/main.js"></script>
</body>
</html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/img/cisco-logo.ico" />
	<title>NSO Home page</title>
	<!-- <link href="../../assets/css/style.css" rel="stylesheet" type="text/css"> -->
	
		<link href="<c:url value="/assets/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/main.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/stylesheet.css" />" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
  </head>
  <body>
  	  <!-- navbar -->
   <header id="header">
   <nav class="navbar navbar-default">
   <div class="container animated fadeIn">
      <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="<c:url value="/assets/img/cisco-logo.png" />" alt=""></a>
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
           <li><a href="<c:url value="logout" />">logout</a></li>
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
                	<h3><img src="<c:url value="/resources/img/service-name.png" />" alt="" />ncs:/services</h3>
                    <a href="#" class="actions"><span></span>actions <i class="fa fa-chevron-down"></i></a>
                	<a href="#" class="columnBtn"><span></span>column <i class="fa fa-chevron-down"></i></a>
                </div>
                <div class="service-main">
                <div class="butn-row">
                        <a href="<c:url value="Popup" />" class="icon-bg" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i></a>
                        <a href="#" class="icon-bg"><i class="fa fa-edit"></i></a>
                       <a href="#" class="icon-bg"><i class="fa fa-trash-o"></i></a>
                    </div> 
                    
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
                        <c:forEach var="vpns" items="${existVPNs}">   
                        <tr class="gridRows">
                       	<td><img src="<c:url value="/resources/img/services-small.png" />" alt="service" /></td>
                        <td align="center"><input type="checkbox" value="1" /></td>
                        <td><a href="viewService?vpnName=${vpns}">${vpns}</a> </td>  
                    	<td>&nbsp;</td> </tr>
                        </c:forEach>
                        
                        <!--  <tr class="gridRowsAlt">   --> 
                                              	
                           	 	
                      
                       
                        
                       
                    </table>
                    
                </div>
              
            </div>
        </section>
	 
	
	</div>
</div>
	<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
    </div>
  </div>
</div>
<script src="<c:url value="/assets/js/vendor/jquery-1.11.2.min.js" />"></script>
	<script src="<c:url value="/assets/js/vendor/bootstrap.min.js" />"></script>
	<script src="<c:url value="/assets/js/vendor/jquery.validate.min.js" />"></script>
	<script src="<c:url value="/assets/js/main.js" />"></script>
<!-- Footer -->
     
     <footer id="footer" class="animated fadeIn">
     <p>&copy;  2010-2016 Cisco Systems, Inc.</p>
   </footer>
<!-- Footer -->
<!-- Modal -->
  	
	
</body>
</html>
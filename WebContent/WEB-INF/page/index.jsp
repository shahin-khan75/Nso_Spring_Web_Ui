<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NSO Catlog</title>
	<link href="<c:url value="/assets/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/main.css" />" rel="stylesheet">
	<link href="<c:url value="assets/img/cisco-logo.ico" />" rel="shortcut icon">
   
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
      <a class="navbar-brand" href="#"><img src="<c:url value="/assets/img/cisco-logo.png" />" /></a>
    </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item active"><a href="#">Home</a></li>
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
   <!-- Catolog -->
  	 <section id="catolog">
     <div class="container">
      <div class="row">
        <div class="col-md-6">
             <div class="DisOprcatolog pull-right animated fadeIn">
                  <div class="text-center"><img src="<c:url value="/assets/img/Cat_Design.png" />" /></div>
                  <p><a href="" class="btn btn-primary btn-block">Design</a></p>
             </div>
        </div>
        <div class="col-md-6">
           <div class="DisOprcatolog pull-left animated fadeIn">
                  <div class="text-center">
                  <img src="<c:url value="/assets/img/Cat_Operate.png" />" /> </div>
                  <p><a href="<c:url value="catalogue" />" class="btn btn-primary btn-block">Operate</a></p>
             </div>
        </div>
      </div> 
      </div>
     </section>
  <!-- Catolog -->
   <!-- Footer -->
       <footer id="footer" class="animated fadeIn">
     <p>© 2010-2016 Cisco Systems, Inc.</p>
   </footer>
   <!-- Footer -->
	<script src="<c:url value="/assets/js/vendor/jquery-1.11.2.min.js" />"></script>
	<script src="<c:url value="/assets/js/vendor/bootstrap.min.js" />"></script>
	<script src="<c:url value="/assets/js/vendor/jquery.validate.min.js" />"></script>
	<script src="<c:url value="/assets/js/main.js" />"></script>
  	
  </body>
  </html>
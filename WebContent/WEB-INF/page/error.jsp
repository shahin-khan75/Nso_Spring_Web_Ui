<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/img/cisco-logo.ico" />
  <title>NSO Error</title>
  <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
    </head>
    <body>
      <!-- navbar -->
      <header id="header">
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
    <!-- error -->
    <section id="errorpage">
     <div class="container">
      <div class="error text-center">
        <img src="assets/img/errorIcon.png" alt="">
      </div>
      <p class="text-center errorMesg">Ohh.... you Requested the page that is no longer There</p>
      <p class="text-center"><a href="<c:url value="home"/>">">BACK TO HOME</a></p>
    </div>
  </section>
  <!-- error -->
  <footer id="footer" class="animated fadeIn">
   <p>© 2010-2016 Cisco Systems, Inc.</p>
 </footer>
 <!-- Footer -->
 <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
 <script src="assets/js/vendor/bootstrap.min.js"></script>
 <script src="assets/js/vendor/jquery.validate.min.js"></script>
 <script src="assets/js/main.js"></script>
</body>
</html>
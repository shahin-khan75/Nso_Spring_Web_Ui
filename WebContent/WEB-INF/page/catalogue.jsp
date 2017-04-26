<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/img/cisco-logo.ico" />
	<title>NSO Home page</title>
		<link href="<c:url value="/assets/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/main.css" />" rel="stylesheet">
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
           <li><a href="<c:url value="logout" />">logout</a></li>
          </ul>
        </li>
    
      </ul>
    </div>

       </div>
    </nav>
    </header>
   <!-- navbar -->
   <!-- Thumb Icons -->
   <div id="iconContainer" class="animated fadeIn">
      <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="<c:url value="l2VpnProvision"/>" class="tc1" ><img src="assets/img/thumb/provision.png" alt=""></a>
                 <p><a href="<c:url value="l2VpnProvision"/>"  data-toggle="modal" data-target="#myModal"> L2 VPN Provisioning</a> </p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="<c:url value="servicesInstance"/>" class="tc2"><img src="assets/img/thumb/service-instance.png" alt=""></a>
                 <p><a href="<c:url value="servicesInstance" />">Service Instance</a></p>
<!--  NSOController?type=queryData -->              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc3"><img src="assets/img/thumb/report.png" alt=""></a>
                 <p><a href="#">Compliance Reporting</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc4"><img src="assets/img/thumb/device-management.png" alt=""></a>
                 <p><a href="#">Device Manangement</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc5"><img src="assets/img/thumb/device-turn-up.png" alt=""></a>
                 <p><a href="#">Device Turn Up</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc6"><img src="assets/img/thumb/network-services.png" alt=""></a>
                 <p><a href="#">Network Services</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc7"><img src="assets/img/thumb/validator.png" alt=""></a>
                 <p><a href="#">NED Validator</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc8"><img src="assets/img/thumb/workflow.png" alt=""></a>
                 <p><a href="#">Workflow Builder</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc9"><img src="assets/img/thumb/service-path.png" alt=""></a>
                 <p><a href="#">Service Path</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc10"><img src="assets/img/thumb/golden-services.png" alt=""></a>
                 <p><a href="#">Golden Services</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc11"><img src="assets/img/thumb/job-manager.png" alt=""></a>
                 <p><a href="#">Job Manager</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc12"><img src="assets/img/thumb/form-builder.png" alt=""></a>
                 <p><a href="#">Form Builder</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc13"><img src="assets/img/thumb/policy-manager.png" alt=""></a>
                 <p><a href="#">Policy Manager</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc14"><img src="assets/img/thumb/service-manager.png" alt=""></a>
                 <p><a href="#">Service Manager</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc15"><img src="assets/img/thumb/service-provisioner.png" alt=""></a>
                 <p><a href="#">Service Provisioner</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc16"><img src="assets/img/thumb/mop.png" alt=""></a>
                 <p><a href="#">MOP</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc17"><img src="assets/img/thumb/configuration-manager.png" alt=""></a>
                 <p><a href="#">Configuration Manager</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc18"><img src="assets/img/thumb/network-view.png" alt=""></a>
                 <p><a href="#">Network View</a></p>
              </article>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
              <article class="thumb__icon">
                 <a href="#" class="tc19"><img src="assets/img/thumb/acl-manager.png" alt=""></a>
                 <p><a href="#">ACL Manager</a></p>
              </article>
            </div>
        </div>
      </div>
   </div>
   <!-- Thumb Icons -->
     <footer id="footer" class="animated fadeIn">
     <p>Â© 2010-2016 Cisco Systems, Inc.</p>
   </footer>
   <!-- Footer -->
<!-- model box -->
<div aria-labelledby="myModalLabel" class="modal fade" id="myModal" role="dialog" tabindex="-1">
  <div class="modal-dialog" role="document">
  <form class="form-horizontal ng-untouched ng-pristine ng-valid" novalidate="" id="addVpnForm">
    <div class="modal-content">
      <div class="modal-header">
        <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">X—</span></button>
        <h4 class="modal-title" id="myModalLabel">L2 VPN Provisioning</h4>
      </div>
      <div class="modal-body">
         <p class="p1">ADD DEVICE</p>
         
         
    <div class="form-group">
      <label class="control-label col-sm-3">Name:</label>
      <div class="col-sm-8">
        <input class="form-control" name="uName" required="" type="text">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3">Address:</label>
      <div class="col-sm-8">          
        <input class="form-control" name="uAddress" required="" type="text">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3">Port:</label>
      <div class="col-sm-8">          
        <input class="form-control" name="uPort" required="" type="text">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3">Device Type:</label>
      <div class="col-sm-8">   
      <select class="form-control" name="uDeviceType" required="">
     
        <option value="12">Device Type 1</option>
        <option value="123">Device Type 1</option>
        <option value="1234">Device Type 1</option>
      </select>       
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3">Author Group:</label>
      <div class="col-sm-8">          
        <input class="form-control" name="uAuthorGroup" required="" type="text">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3">Device Group:</label>
      <div class="col-sm-8">          
        <input class="form-control" name="uDeviceGroup" required="" type="text">
      </div>
    </div>
         
      </div>
      <div class="modal-footer">
        <button class="btn btn-warning" type="submit">Add</button>
        <button class="btn btn-primary" data-dismiss="modal" type="button">Cancel</button>
      </div>
    </div>
    </form>
  </div>
</div>
<!-- model box -->
  	<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
  	<script src="assets/js/vendor/bootstrap.min.js"></script>
  	<script src="assets/js/vendor/jquery.validate.min.js"></script>
  	<script src="assets/js/main.js"></script>
  </body>
  </html>
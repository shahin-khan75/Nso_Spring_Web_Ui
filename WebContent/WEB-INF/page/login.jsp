<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link href="<c:url value="/nsoassets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/nsoassets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/nsoassets/css/main.css" />" rel="stylesheet">
<link href="<c:url value="nsoassets/img/cisco-logo.ico" />" rel="shortcut icon">

<title>NSO Login</title>
</head>
<body>
	<%String errorVal= (String)request.getParameter("l");%>
	<section id="login">
		<div class="login_Form">
			<div class="row" style="margin-top: 5%">
				<div class="col-xs-12">
					<div class="logoDiv">
						<img src="<c:url value="/resources/img/cisco-logo-inner.png" />" />
					</div>
					<p class="formHeading">NSO Member Login</p>
					<form id="loginForm" method="post" action="login">
						<%if(errorVal==null) {%>
						<%}else if(errorVal.equals("f")){%>
						<div align="center" style="color: yellow; top: 40%; size: 20px;">Authentication
							failed</div>
						<%} %>
						<p class="icnLog">
							<span class="logImg"><img src="assets/img/icons/email.png"
								alt="logo"></span> <span class="logInp"><input type="text"
								name="username" placeholder="username" class="required"></span>
						</p>
						<p class="icnLog">
							<span class="logImg"><img src="assets/img/icons/lock.png"
								alt="logo"></span> <span class="logInp"><input
								type="password" name="password" placeholder="Password"
								class="required"></span>
						</p>
						<p class="ForgotPass">
							<a href="">Forgot Password</a>
						</p>
						<p class="SubmitBtn">
							<input type="submit" value="Login" class="greyBtn">
						</p>
					</form>
				</div>
			</div>
		</div>
	</section>

	<script src="<c:url value="/assets/js/vendor/jquery-1.11.2.min.js" />"></script>
	<script src="<c:url value="/assets/js/vendor/bootstrap.min.js" />"></script>
	<script src="<c:url value="/assets/js/vendor/jquery.validate.min.js" />"></script>
	<script src="<c:url value="/assets/js/main.js" />"></script>
 
</body>
</html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="assets/img/cisco-logo.ico" />
<title>NSO Home page</title>

<link href="<c:url value="/assets/css/style.css" />" rel="stylesheet"
	type="text/css">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css">
<link
	href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
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
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><img
						src="<c:url value="/assets/img/cisco-logo.png" />" alt=""></a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="nav-item active"><a href="<c:url value="home"/>">Home</a></li>
						<li><a href="#">Settings</a></li>
						<li><a href="#">Applications</a></li>
						<li><a href="#">Work queue</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><%=session.getAttribute("user")%><span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<!--  <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li> -->
								<li><a href="<c:url value="logout" />">logout</a></li>
							</ul></li>

					</ul>
				</div>

			</div>
		</nav>
	</header>
	<section>
		<div class="wrapper">
			<div class="butn-row">
				<h3>
					<img src="<c:url value="/resources/img/service-name.png" />" alt="" />ncs:/services
				</h3>

			</div>
			<div class="tabs">
				<ul>
					<li><a href="#" class="active">L2 provision</a></li>
					<li><a href="#">Modified</a></li>
					<li><a href="#">Directly modified</a></li>
					<li><a href="#">L2 provision</a></li>

				</ul>
			</div>
			<div class="tab-main">
				<div class="tabButtons">
					<a href="javascript:void(0)" id="dryRun"> <span class="Touchbtnicon"></span> Dry Run
					</a> <a href="#"> <span class="btnicon"></span> redeploy
					</a> <a href="#"> <span class="Syncbtnicon"></span> check sync
					</a> <a href="<c:url value="commitVPN" />"> <span class="undeploybtnicon"></span> Commit
					</a>

				</div>
				<p>info</p>
				<div class="service-col-01">
					<form action="" method="post">
						<label>vpn name</label><input type="text" name="name"
							value="${vpnName}" class="textbox">
						<!--  <label>device modification</label><textarea cols="4" rows="3" class="textbox" onchange="UpdateData(this.value=value);"></textarea> -->

						<label>device1</label>
						<!-- <textarea cols="4" rows="3" class="textbox"></textarea>
						 -->
						<select name="device1" id="device1" class="textbox"
							onblur="UpdateData(this.value,this.name);">
							<c:forEach var="device" items="${devices}">
								<option value="${device}">${device}</option>
							</c:forEach>

						</select> <label>intf-number1</label><input type="text" name="intf-number1"
							id="intf-number1" value="" class="textbox"
							onblur="UpdateData(this.value,this.name);"> <label>remote-ip1</label><input
							type="text" name="remote-ip1" id="remote-ip1" value=""
							class="textbox" onblur="UpdateData(this.value,this.name);">
					</form>
				</div>

				<div class="service-col-01">
					<form>
						<label>pw-id</label><input type="text" name="pw-id" value=""
							class="textbox" onblur="UpdateData(this.value,this.name);">
						<!--  <label>type</label><textarea cols="4" rows="3" class="textbox" onchange="UpdateData(this.value=value);"></textarea> -->
						<label>device2</label>
						<!-- <textarea cols="4" rows="3" class="textbox"></textarea>
						 -->
						<select name="device2" id="device2" class="textbox"
							onblur="UpdateData(this.value,this.name);">
							<c:forEach var="device" items="${devices}">
								<option value="${device}">${device}</option>
							</c:forEach>

						</select> <label>intf-numumber2</label><input type="text"
							name="intf-number2" id="intf-number2" value="" class="textbox"
							onblur="UpdateData(this.value,this.name);"> <label>remote-ip2</label><input
							type="text" name="remote-ip2" id="remote-ip2" value=""
							class="textbox" onblur="UpdateData(this.value,this.name);">
					</form>
				</div>
			</div>


		</div>
	</section>

	<footer id="footer" class="animated fadeIn">
		<p>&copy; 2010-2016 Cisco Systems, Inc.</p>
	</footer>
	<script src="<c:url value="/assets/js/vendor/jquery-1.11.2.min.js" />"></script>
	<script src="<c:url value="/assets/js/vendor/bootstrap.min.js" />"></script>
	<script
		src="<c:url value="/assets/js/vendor/jquery.validate.min.js" />"></script>
	<script src="<c:url value="/assets/js/main.js" />"></script>
	<script type="text/javascript">
		function UpdateData(value, deviceType) {
			$.ajax({
				url : "setValuebyAjax?value=" + value + "&deviceType="
						+ deviceType,
				type : "post",
				success : function(response) {
					//alert(response);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus, errorThrown);
					alert(" value is " + value + " not correct in "
							+ deviceType + " field");

				}

			});
		}

		$(function() {
			$('#dryRun').on('click', function() {
				$.ajax({
					url : "dryRunCommit",
					type : "get",
					success : function(response) {
						alert(response);
						console.log(response);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus, errorThrown);

					}

				});

			});
		});
	</script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="shortcut icon" href="jsp/images/index.png" type="image/png" />
<title>Login Form</title>
<link rel="stylesheet" href="jsp/css/login.css">
<link rel="stylesheet" href="jsp/css/base.css" />
<script type="text/javascript" src="jsp/js/validation.js"></script>
</head>
<body>
	<div class="header">
		<img src="jsp/images/estuate-inc-logo.png" alt="logo" />
		<h1>Estuate Strategic Automation Tool</h1>
	</div>
	<div class="login-page">
		<div class="form">
			<c:if test="${error.length()!=0}">
				<br />
				<span id="mail"><font color=red size=2px>${error}</font></span>
				<br />
			</c:if>
			<span id="mail" style="display: none"></span>
			<form class="login-form" action="login.do" method="post" name="form1"
				onsubmit="return validate();">
				<input class="username" type="text" name="emailid"
					placeholder="e-mail ID" id="emailid" /> <input class="password"
					type="password" name="password" placeholder="Password"
					id="password" /> <input class="submit" type="submit" value="login">
			</form>
		</div>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="jsp/js/index.js"></script>
</body>
</html>

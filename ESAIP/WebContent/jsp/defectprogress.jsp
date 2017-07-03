<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<html>
<head>
<!-- This page displays file drop down in it -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Defects</title>
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/progress.css" />
<script type="text/javascript" src="js/dropdown.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<c:if test="${defectstatus<100}">
		<meta http-equiv="Refresh" content="5;url=progress.do">
		<div class="header">
			<img src="images/estuate-inc-logo.png" alt="logo" />
			<h1>Estuate Strategic Automation Tool</h1>
		</div>
		<div style="width: 100%;" align="left">
			<ul>
				<li><a href="">Master Plan</a></li>
				<li><a href="">Run Plan</a></li>
				<li><a href="">Execute</a></li>
				<li><a href="">Results</a></li>
				<li class="active"><a href=""> Defects </a></li>
				<li class="logout"><a href="logout.do">Logout</a></li>
			</ul>
		</div>
		<br />
		<div style="background-color: white; height: 250px;">
			<h2  style="padding-left: 10px;">Please wait, Defect id updation will take a few moment.</h2>
			<div class="progress">
				<span class="progress-val">${defectstatus}%</span> <span
					class="progress-bar"><span class="progress-in"
					style="width: ${defectstatus}%"></span></span>
			</div>
			<c:if test='${stopExecution.equals("No")}'>
				<div style="padding-left: 150px">
					<button onclick="stopDefectLogging(); showMessage();">Stop
						Execution</button>
				</div>
				<div>
					<div align="center" style="width: 400px;">
						<span id="stop" style="display: none"><font color=red
							size=4px>Please wait, Execution will stop after current
								Defect Logging completes</font></span>
					</div>
				</div>
			</c:if>
			<c:if test='${stopExecution.equals("Yes")}'>
				<div align="center" style="width: 400px;">
					<span id="stop"><font color=red size=4px>Please wait,
							Execution will stop after current Defect Logging completes</font></span>
				</div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${defectstatus==100}">
		<div class="header">
			<img src="images/estuate-inc-logo.png" alt="logo" />
			<h1>Estuate Strategic Automation Tool</h1>
		</div>
		<div style="width: 100%;" align="left">
			<ul>
				<li><a href="fetch.do">Master Plan</a></li>
				<li><a href="runplan.do">Run Plan</a></li>
				<li><a href="filedetails.do">Execute</a></li>
				<li><a href="results.do">Results</a></li>
				<li class="active"><a href="location.do"> Defects </a></li>
				<li class="logout"><a href="logout.do">Logout</a></li>
			</ul>
		</div>
		<br />
		<div style="background-color: white; height: 250px">
			<h2 style="padding-left: 10px;">Defect Logging Status:</h2>
			<div class="progress">
				<span class="progress-val">${defectstatus}%</span> <span
					class="progress-bar"><span class="progress-in"
					style="width: ${defectstatus}%"></span></span>
			</div>
			<c:if test='${stopExecution.equals("Yes")}'>
				<font color=red size=4px> ${defectname}</font>
			</c:if>
			<form action="defects.do" method="post">
				<input type="hidden" value="${defectfile}" name="filelocation">
				<div style="padding-left: 50px;">
					<font color=green size=4px><strong>${defectmessage}</strong></font>
				</div>
				<div style="padding-left: 150px;">
					<input type="submit" value="Continue">
				</div>
			</form>
		</div>
	</c:if>
</body>
</html>
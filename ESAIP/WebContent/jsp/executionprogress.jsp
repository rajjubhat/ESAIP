<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<html>
<!-- This page is used to display the result drop down with progress bar -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/index.png" type="image/png" />
<title>Results</title>
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/progress.css" />
<script type="text/javascript" src="js/dropdown.js"></script>
</head>
<body>
	<c:if test="${resultstatus<100}">
		<meta http-equiv="Refresh" content="5;url=process.do">
		<div class="header">
			<img src="images/estuate-inc-logo.png" alt="logo" />
			<h1>Estuate Strategic Automation Tool</h1>
		</div>
		<div style="width: 100%;" align="left">
			<ul>
				<li><a href="">Master Plan</a></li>
				<li><a href="">Run Plan</a></li>
				<li class="active"><a href="">Execute</a></li>
				<li><a href="">Results</a></li>
				<li><a href=""> Defects </a></li>
				<li class="logout"><a href="logout.do">Logout</a></li>
			</ul>
		</div>
		<br />
		<div style="background-color: white; height: 250px;">
			<h2 style="padding-left: 10px;">Please wait, the test case execution will take a few moment.</h2>
			<div class="progress">
				<span class="progress-val">${resultstatus}%</span> <span
					class="progress-bar"><span class="progress-in"
					style="width: ${resultstatus}%"></span></span>
			</div>
			<c:if test='${stopStatus.equals("No")}'>
				<c:if test='${nodeStatus.equals("Yes")}'>
					<div style="padding-left: 150px">
						<button onclick="stopExecution(); showMessage();">Stop
							Execution</button>
					</div>
				</c:if>
				<div align="center" style="width: 400px;">
					<span id="stop" style="display: none"><font color=red
						size=4px>Please wait, Execution will stop after current
							test case execution completes</font></span>
				</div>
				<c:if test='${nodeStatus.equals("No")}'>
					<div>
						<font color=red size=4px>Seems your <strong>node
								server</strong> is not running. Start node server and try again
						</font>
						<form action="generate.do" method="post">
							<input type="hidden" value="${runplan}" name="filelocation">
							<div style="padding-left: 150px;">
								<input type="submit" value="Continue">
							</div>
						</form>
					</div>
				</c:if>
			</c:if>
			<c:if test='${stopStatus.equals("Yes")}'>
				<div align="center" style="width: 400px;">
					<span id="stop"><font color=red size=4px>Please wait,
							Execution will stop after current test case execution completes</font></span>
				</div>
			</c:if>
		</div>
	</c:if>
	<c:if test="${resultstatus==100}">
		<div class="header">
			<img src="images/estuate-inc-logo.png" alt="logo" />
			<h1>Estuate Strategic Automation Tool</h1>
		</div>
		<div style="width: 100%;" align="left">
			<ul>
				<li><a href="fetch.do">Master Plan</a></li>
				<li><a href="runplan.do">Run Plan</a></li>
				<li class="active"><a href="filedetails.do">Execute</a></li>
				<li><a href="results.do">Results</a></li>
				<li><a href="location.do"> Defects </a></li>
				<li class="logout"><a href="logout.do">Logout</a></li>
			</ul>
		</div>
		<div style="background-color: white; height: 250px;">
			<div style="background-color: white; height: 250px;">
				<h2 style="padding-left: 10px;">Execution Status:</h2>
				<div class="progress">
					<span class="progress-val">${resultstatus}%</span> <span
						class="progress-bar"><span class="progress-in"
						style="width: ${resultstatus}%"></span></span>
				</div>
				<c:if test='${stopStatus.equals("Yes")}'>
					<div>
						<font color=red size=4px>${testCase}</font>
					</div>
				</c:if>
				<form action="display.do" method="post">
					<input type="hidden" value="${resultfile}" name="filelocation">
					<div style="padding-left: 100px;">
						<font color=green size=4px><strong>Execution
								complete</strong></font>
					</div>
					<div style="padding-left: 150px;">
						<input type="submit" value="Continue">
					</div>
				</form>
			</div>
		</div>
	</c:if>
</body>
</html>
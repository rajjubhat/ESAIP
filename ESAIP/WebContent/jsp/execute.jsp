<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<!-- This page is used to display execution plan and start execution of testing -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/index.png" type="image/png" />
<title>execute</title>
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/modal.css" />
<script type="text/javascript" src="js/dropdown.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<style type="text/css">
.data {
	height: 275px;
	width: 70%;
	overflow: auto;
	border: 0.5px solid #167f92;
}
</style>
<style type="text/css">
.tab1 {
	padding-left: 2em;
}
</style>
</head>
<body>
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
	<br />
	<div style="background-color: white; height: 500px">
		<form action="generate.do" method="Post" name="form1"
			onsubmit="return selectrunplan()">
			<table>
				<tr>
					<th>Select other Run Plan:</th>
					<td><select name="filelocation">
							<option value=""></option>
							<c:forEach var="type" items="${runplans}">
								<option value="${type.value}">${type.key}</option>
							</c:forEach>
					</select></td>
					<td><input type="submit" value="View Run Plan"></td>
					<td><span id="result" style="display: none"></span></td>
				</tr>
			</table>
		</form>
		<center>
			<c:if test="${executiondata.size()!=0}">
				<h2>Execution Plan: ${executiondata.get(0).getFileName()}</h2>
				<form action="execute.do" method="get">
					<div class="data">
						<input type="hidden" name="filelocation"
							value="${executiondata.get(0).getFileLocation()}"></input>
						<table class="responstable" style="width: 98%;">
							<tr>
								<th>SL No</th>
								<th>Business Requirement</th>
								<th>Modules</th>
								<th>Test Cases</th>
							</tr>
							<c:forEach var="data" items="${executiondata}">
								<tr>
									<td>${data.getId()}</td>
									<td>${data.getBR()}</td>
									<td>${data.getModule()}</td>
									<td>${data.getTestCase()}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<c:if test='${newnode.equals("Yes")}'>
						<div style="padding-left: 10px;">
							<font color=Red size=2px>New Version ${version} available
								Download Now.</font>
						</div>
					</c:if>
					Node server running <input type="checkbox" name="startbutton"
						onclick="showButton()"> <a href="#openModal"><font
						color="blue"> How to start?</font></a><a href="download.do"><font
						color="blue"> Download</font></a>
					<div id="div1" style="display: none">
						<table width="100%">
							<tr>
								<td align="center"><input type="submit"
									value="Start Execution"></td>
							</tr>
						</table>
					</div>
				</form>
			</c:if>
			<c:if test="${executiondata.size()==0}">
				<h2>No Run plan available to Execute in this file</h2>
			</c:if>
		</center>
	</div>
	<div id="openModal" class="modalbg">
		<div class="dialog">
			<a href="#close" title="Close" class="close">X</a>
			<center>
				<h2>How to start Node server on your system</h2>
			</center>
			<div class="modaldata">
				<p>
					<strong>a) If you have not downloaded NodeserverBundle.exe</strong>
				</p>
				<p class="tab1">
					1. Download the NodeserverBundle.exe from below Download link.<br>
					2. Double click on downloaded NodeserverBundle.exe.<br> 3.
					When prompt is displayed enter the folder location where the files
					need to be extracted and click on OK.<br> 4. Wait till the
					file extraction is completed.<br> 5. Go to the extracted
					location. <br /> 6. Double click on Nodeserver.exe<br> 7.
					Command prompt opens and Nodeserver is started.<br> 8. Please
					do not close the command prompt until Test execution is complete. <br>
				</p>
				<p>
					<strong>b) If you have already downloaded and extracted
						NodeserverBundle.exe</strong>
				</p>
				<p class="tab1">
					1. Go to the previously extracted location.<br> 2. Double
					click on Nodeserver.exe<br> 3. Command prompt opens and Node
					server is started.<br> 4. Please do not close the command
					prompt until Test execution is complete.
				</p>
			</div>
			<p class="fineprint">
				<a href="download.do"><font color="blue">Download</font></a>
			</p>
		</div>
	</div>
</body>
</html>
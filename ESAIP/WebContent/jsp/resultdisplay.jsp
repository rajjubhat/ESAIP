<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<!-- This page is used to display the result details with progress bar-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/index.png" type="image/png" />
<title>Results</title>
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/dropdown.js"></script>
<style type="text/css">
.floatLeft {
	width: 500px;
	float: left;
	padding-left: 10px;
}

.floatRight {
	width: 40%;
	float: right;
	overflow: hidden;
}

.container {
	overflow: hidden;
}

.runtable {
	height: 110px;
	width: 1100px;
	overflow: auto;
	border: 0.5px solid #167f92;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var pass = parseInt(document.form2.pass.value);
		var fail = parseInt(document.form2.fail.value);
		var norun = parseInt(document.form2.noRun.value);
		var chart = new CanvasJS.Chart("chartContainer", {
			legend : {
				maxWidth : 350,
				itemWidth : 120
			},
			data : [ {
				type : "pie",
				showInLegend : true,
				toolTipContent : "{y} - #percent %",
				legendText : "{Label}",
				dataPoints : [ {
					y : pass,
					color : "Green",
					Label : "Pass"
				}, {
					y : fail,
					color : "Red",
					Label : "Fail"
				}, {
					y : norun,
					color : "Grey",
					Label : "No Run"
				} ]
			} ]
		});
		chart.render();
	}
</script>
<script type="text/javascript" src="js/canvasjs.min.js"></script>
</head>
<body>
	<c:if test="${result.size()>0}">
		<form name="form2">
			<input type="hidden" name="pass"
				value="${result.get(5).getResultvalue()}"> <input
				type="hidden" name="fail" value="${result.get(6).getResultvalue()}">
			<input type="hidden" name="noRun"
				value="${result.get(7).getResultvalue()}">
		</form>
	</c:if>
	<div class="header">
		<img src="images/estuate-inc-logo.png" alt="logo" />
		<h1>Estuate Strategic Automation Tool</h1>
	</div>
	<div style="width: 100%;" align="left">
		<ul>
			<li><a href="fetch.do">Master Plan</a></li>
			<li><a href="runplan.do">Run Plan</a></li>
			<li><a href="filedetails.do">Execute</a></li>
			<li class="active"><a href="results.do">Results</a></li>
			<li><a href="location.do"> Defects </a></li>
			<li class="logout"><a href="logout.do">Logout</a></li>
		</ul>
	</div>
	<br />
	<div style="background-color: white;">
		<form action="display.do" method="Post" name="form1"
			onsubmit="return selectResult()">
			<table>
				<tr>
					<td><h2>Select other result file:</h2></td>
					<td><select name="filelocation">
							<option value=""></option>
							<c:forEach var="data" items="${resultFileList}">
								<option value="${data.getValue()}">${data.getKey()}</option>
							</c:forEach>
					</select></td>
					<td><input type="submit" value="View Results"></td>
					<td><span id="result" style="display: none"></span></td>
				</tr>
			</table>
		</form>
		<table width="1190px">
			<tr>
				<td><h2 style="padding-left: 10px;">${UsedRunPlan.get(0).getFileName()}</h2></td>
				<td align="right"><a
					href="save.do?filelocation=${result.get(0).getFileLocation()}">Download
						result file </a>|<a
					href="logs.do?filelocation=${result.get(0).getFileLocation()}">
						Download log file </a> <c:if test="${defectsize>0}">
							|<a
							href="defects.do?filelocation=${result.get(0).getFileLocation()}">
							Log Defects</a>
					</c:if></td>
			</tr>
		</table>
		<center>
			<div class="runtable">
				<table class="responstable" style="width: 99%;">
					<tr>
						<th class="excelHeading">SL No</th>
						<th class="excelHeading">Business Requirement</th>
						<th class="excelHeading">Modules</th>
						<th class="excelHeading">Test Case Id</th>
						<th class="excelHeading">Test Cases</th>
						<th class="excelHeading">Criticality</th>
						<th class="excelHeading">Result</th>
						<th class="excelHeading">Time Taken</th>
					</tr>
					<c:forEach var="data" items="${UsedRunPlan}">
						<tr>
							<td class="excelrow">${data.getId()}</td>
							<td class="excelrow">${data.getBR()}</td>
							<td class="excelrow">${data.getModule()}</td>
							<td class="excelrow">${data.getTestCaseId()}</td>
							<td class="excelrow">${data.getTestCase()}</td>
							<td class="excelrow">${data.getCriticality()}</td>
							<td class="excelrow">${data.getResult()}</td>
							<td class="excelrow">${data.getTimeTaken()}</td>
						</tr>
					</c:forEach>
				</table>
				<br />
			</div>
		</center>
		<table width="100%">
			<tr>
				<td width="50%">
					<center>
						<h2>Status</h2>
						<div
							style="height: 240px; width: 80%; overflow: auto; border: 0.5px solid #167f92;">
								<table class="responstable" style="width: 95%;">
									<c:forEach var="data" items="${result}">
										<tr>
											<th width="40%">${data.getResultkey()}</th>
											<td width="60%">${data.getResultvalue()}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
					</center>
				</td>
				<td width="50%">
					<center>
						<h2>Graph</h2>
						<!-- <div id="piechart" style="width: 300x; height: 198px; align: left"></div> -->
						<div id="chartContainer"
							style="height: 250px; width: 75%; border: 0.5px solid #167f92;"></div>
					</center>
				</td>
			</tr>
		</table>
		<br />
	</div>
</body>
</html>
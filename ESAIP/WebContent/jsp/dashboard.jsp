<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/index.png" type="image/png" />
<title>Master Sheet</title>
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style type="text/css">
.data {
	height: 450px;
	width: 98%;
	overflow: auto;
	border: 0.5px solid #167f92;
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
				<li class="active"><a href="fetch.do">Master
						Plan</a></li>
				<li><a href="runplan.do">Run Plan</a></li>
				<li><a href="filedetails.do">Execute</a></li>
				<li><a href="results.do">Results</a></li>
				<li><a href="location.do">Defects</a></li>
				<li class="logout"><a href="logout.do">Logout</a></li>
			</ul>
		</div>
		<br>
		<div style="background: white;" align="center">
			<br />
			<div class="data">
				<table class="responstable" style="width: 98%">
					<tr>
						<th width="20px" >SL No</th>
						<th width="100px">Business Requirement</th>
						<th width="142px">Description</th>
						<th width="100px">Impacted BRs</th>
						<th width="50px">Modules</th>
						<th width="10px">Test Case</th>
						<th width="80px">Test Case Id</th>
					</tr>
					<c:forEach var="data" items="${list}">
						<tr>
							<td height="10px">${data.getId()}</td>
							<td>${data.getBusinessRequirement()}</td>
							<td>${data.getDescription()}</td>
							<td>${data.getImpactedBRs()}</td>
							<td>${data.getModules()}</td>
							<td>${data.getTestCases()}</td>
							<td>${data.getTestCaseId()}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<form action="runplan.do" method="get">
				<table width="98%">
					<tr>
						<td align="center"><input type="submit" value="Next"></td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>
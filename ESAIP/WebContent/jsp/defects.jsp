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
			<li><a href="filedetails.do">Execute</a></li>
			<li><a href="results.do">Results</a></li>
			<li class="active"><a href="location.do"> Defects </a></li>
			<li class="logout"><a href="logout.do">Logout</a></li>
		</ul>
	</div>
	<br />
	<div style="background-color: white; height: 500px">
		<form action="defects.do" method="Post" name="form1"
			onsubmit="return selectResult()">
			<table>
				<tr>
					<td><h2>Select a Defect file:</h2></td>
					<td><select name="filelocation">
							<option value=""></option>
							<c:forEach var="type" items="${defectFiles}">
								<option value="${type.value}">${type.key}</option>
							</c:forEach>
					</select></td>
					<td><input type="submit" value="View Defects"></td>
					<td><span id="result" style="display: none"></span></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
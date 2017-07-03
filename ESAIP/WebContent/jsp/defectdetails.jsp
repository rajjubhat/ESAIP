<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- This page is used to edit the defect details -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/index.png" type="image/png" />
<title>Defects</title>
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/dropdown.js"></script>
<style type="text/css">
.data {
	height: 250px;
	width: 90%;
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
			<li><a href="fetch.do">Master Plan</a></li>
			<li><a href="runplan.do">Run Plan</a></li>
			<li><a href="filedetails.do">Execute</a></li>
			<li><a href="results.do">Results</a></li>
			<li class="active"><a href="location.do">Defects </a></li>
			<li class="logout"><a href="logout.do">Logout</a></li>
		</ul>
	</div>
	<br />
	<div style="background: white; padding-left: 10px;">
		<form action="defects.do" method="Post" name="form1"
			onsubmit="return selectResult()">
			<table>
				<tr>
					<td><h2>Select a Defect file:</h2></td>
					<td><select name="filelocation">
							<option value=""></option>
							<c:forEach var="data" items="${defectfiles}">
								<option value="${data.getValue()}">${data.getKey()}</option>
							</c:forEach>
					</select></td>
					<td><input type="submit" value="View Defects"></td>
					<td><span id="result" style="display: none"></span></td>
				</tr>
			</table>
		</form>
		<c:if test="${defects.size()!=0}">
			<h2>${defects.get(0).getFileName()}</h2>
			<center>
				<form>
					<div class="data">
						<input type="hidden" name="length" value="${defects.size()}">
						<table class="responstable">
							<tr>
								<th>Sl No</th>
								<th>Test Case Id</th>
								<th>Test Case Name</th>
								<th>Defect ID</th>
								<th>Logged Date</th>
								<th>LogDefect</th>
								<th>Summary</th>
								<th>Description</th>
								<th>Reproducibility</th>
								<th>Severity</th>
								<th>Priority</th>
								<th>Assign To</th>
								<th>Steps to Reproduce</th>
								<th>Additional Information</th>
								<th>Upload File Path</th>
								<th>Defect URL</th>
							</tr>
							<c:forEach var="data" items="${defects}">
								<input type="hidden" name="filelocation"
									value="${defects.get(0).getFileLocation()}">
								<tr>
									<td><input type="text" name="id${data.getIndex()}"
										value="${data.getId()}" size="5"></td>
									<td><input type="text" name="testCaseid${data.getIndex()}"
										value="${data.getTestCaseid()}" size="16"></td>
									<td><input type="text"
										name="testCaseName${data.getIndex()}"
										value="${data.getTestCaseName()}" size="10"></td>
									<td><input type="text" name="defectID${data.getIndex()}"
										value="${data.getDefectID()}" size="10"></td>
									<td><input type="text" name="loggerdate${data.getIndex()}"
										value="${data.getLoggedDate()}" size="12"></td>
									<td><select name='logDefect${data.getIndex()}'>
											<c:forEach var="type" items="${logDefect}">
												<option value="${type.key}"
													${type.key.equals(data.getLogDefect()) ? "selected='selected'" : ""}>
													${type.value}</option>
											</c:forEach>
									</select></td>
									<td><input type="text" name="summary${data.getIndex()}"
										value="${data.getSummary()}" size="16"></td>
									<td><input type="text"
										name="description${data.getIndex()}"
										value="${data.getDescription()}" size="16"></td>
									<td><select name='reproducibility${data.getIndex()}'
										style="width: 100px;">
											<c:forEach var="type" items="${reproducibilityTypes}">
												<option value="${type.key}"
													${type.key.equals(data.getReproducibility()) ? "selected='selected'" : ""}>
													${type.value}</option>
											</c:forEach>
									</select></td>
									<td><select name='severity${data.getIndex()}'>
											<c:forEach var="type" items="${severityTypes}">
												<option value="${type.key}"
													${type.key.equals(data.getSeverity()) ? "selected='selected'" : ""}>
													${type.value}</option>
											</c:forEach>
									</select></td>
									<td><select name='priority${data.getIndex()}'>
											<c:forEach var="type" items="${priorityTypes}">
												<option value="${type.key}"
													${type.key.equals(data.getPriority()) ? "selected='selected'" : ""}>
													${type.value}</option>
											</c:forEach>
									</select></td>
									<td><select name='assignTo${data.getIndex()}'>
											<c:forEach var="type" items="${assignToTypes}">
												<option value="${type.key}"
													${type.key.equals(data.getAssignTo()) ? "selected='selected'" : ""}>
													${type.value}</option>
											</c:forEach>
									</select></td>
									<td><input type="text"
										name="stepsToReproduce${data.getIndex()}"
										value="${data.getStepsToReproduce()}" size="10"></td>
									<td><input type="text"
										name="additionalInformation${data.getIndex()}"
										value="${data.getAdditionalInformation()}" size="10"></td>
									<td><input type="text"
										name="uploadFilePath${data.getIndex()}"
										value="${data.getUploadFilePath()}" size="10"></td>
									<td><a href="${data.getDefectUrl()}" target="_blank">${data.getDefectUrl()}</a>
										<input type="hidden" name="url${data.getIndex()}"
										value="${data.getUploadFilePath()}"></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<table>
						<tr>
							<td><input type="submit" value="Save"
								onclick="javascript: form.action='update.do';"> <input
								type="submit" value="Log Defect"
								onclick="javascript: form.action='data.do';" /></td>
						</tr>
					</table>
				</form>
			</center>
		</c:if>
		<c:if test="${defects.size()==0}">
			<center>
				<h2>No defects to display</h2>
			</center>
		</c:if>
	</div>
</body>
</html>
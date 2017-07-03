<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<!-- this page is used to update run plan based on requirement  -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/index.png" type="image/png" />
<title>Run Plan</title>
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
			<li><a href="fetch.do">Master Plan</a></li>
			<li class="active"><a href="runplan.do">Run Plan</a></li>
			<li><a href="filedetails.do">Execute</a></li>
			<li><a href="results.do">Results</a></li>
			<li><a href="location.do"> Defects </a></li>
			<li class="logout"><a href="logout.do">Logout</a></li>
		</ul>
	</div>
	<br />
	<div style="background: white;">
		<center>
			<br />
			<form action="create.do" method="post">
				<div class="data">
					<input type="hidden" name="length" value="${runplanlist.size()}">
					<table class="responstable" style="width: 98%">
						<tr>
							<th>SL No</th>
							<th>Business Requirement</th>
							<th>Description</th>
							<th>Impacted BRs</th>
							<th>Include</th>
							<th>Modules</th>
							<th>Include</th>
							<th>Test Case</th>
							<th>Include</th>
						</tr>
						<c:forEach var="data" items="${runplanlist}">
							<tr>
								<td><input type="text" name="id${data.getIndex()}"
									value='${data.getId()}' readonly size="5"></td>
								<td><input type="text"
									name="businessRequirement${data.getIndex()}"
									value='${data.getBusinessRequirement()}' readonly size="16"></td>
								<td><input type="text" name="description${data.getIndex()}"
									value='${data.getDescription()}' readonly size="16"></td>
								<td><input type="text" value='${data.getImpactedBRs()}'
									readonly size="16"></td>
								<td><c:if
										test='${data.getIncludeImpactedBRs().length() != 0}'>
										<select name='includeImpactedBRs${data.getIndex()}'>
											<option value="Yes"
												${data.getIncludeImpactedBRs().equals("Yes") ? "selected='selected'" : ""}>Yes</option>
											<option value="No"
												${data.getIncludeImpactedBRs().equals("No") ? "selected='selected'" : ""}>No</option>
										</select>
									</c:if></td>
								<td><input name="modules${data.getIndex()}" type="text"
									value='${data.getModules()}' readonly size="16"></td>
								<td><c:if test='${data.getModulesInclude().length() != 0}'>
										<select name='modulesInclude${data.getIndex()}'>
											<option value="Yes"
												${data.getModulesInclude().equals("Yes") ? "selected='selected'" : ""}>Yes</option>
											<option value="No"
												${data.getModulesInclude().equals("No") ? "selected='selected'" : ""}>No</option>
										</select>
									</c:if></td>
								<td><input name="testCases${data.getIndex()}" type="text"
									value='${data.getTestCases()}' readonly size="16"></td>
								<td><c:if
										test='${data.getTestCasesInclude().length() != 0}'>
										<select name='testCasesInclude${data.getIndex()}'>
											<option value="Yes"
												${data.getTestCasesInclude().equals("Yes") ? "selected='selected'" : ""}>Yes</option>
											<option value="No"
												${data.getTestCasesInclude().equals("No") ? "selected='selected'" : ""}>No</option>
										</select>
									</c:if></td>
							</tr>
							<input type="hidden" name="criticality${data.getIndex()}"
								value="${data.getCriticality()}">
							<input name="testCaseId${data.getIndex()}" type="hidden"
								value='${data.getTestCaseId()}' readonly>
						</c:forEach>
					</table>
				</div>
				<table>
					<tr>
						<td><input type="submit" value="Create Run plan"></td>
					</tr>
				</table>
			</form>
		</center>
	</div>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>ESAIP|Defects</title>
<link rel="shortcut icon" href="images/index.png" type="image/png" />
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="css/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="css/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<script type="text/javascript" src="js/dropdown.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="fetch.do" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><img src="images/index.png"
					alt="logo" /></span> <!-- logo for regular state and mobile devices --> <span
				class="logo-lg"><img src="images/estuate-inc-logo.png"
					alt="logo" /></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a><a href=""
					style="text-align: center; font-size: 30px; color: white; padding-left:300px;">
					Estuate Strategic Automation Tool </a>
				<div class="navbar-custom-menu" style="margin-right: 10px;">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="images/avatar5.png" class="user-image" alt="User Image">
								<!--<span class="hidden-xs">User</span>-->
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img src="images/avatar5.png"
									class="img-circle" alt="User Image">
									<p>
										User
										<!--  	 <small>Member since
											Nov. 2012</small>-->
									</p></li>
								<!-- Menu Body -->
								<!--<li class="user-body">
									<div class="row">
									</div> 
								</li>-->
								<!-- Menu Footer-->
								<li class="user-footer">
									<!--  <div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">Profile</a>
									</div>--> <!--  <div class="pull-right">--> <!--  <div class="pull-right">-->
									<div style="text-align: center;">
										<a href="logout.do" class="btn btn-default btn-flat">Log
											out</a>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>

		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="treeview"><a href="#"> <i
							class="fa fa-dashboard"></i> <span>Testing</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="fetch.do"><i class="fa fa-circle-o"></i>Master
									Plan</a></li>
							<li><a href="runplan.do"><i class="fa fa-circle-o"></i>
									Runplan</a></li>
							<li><a href="filedetails.do"><i class="fa fa-circle-o"></i>Execute</a></li>
							<li><a href="results.do"><i class="fa fa-circle-o"></i>Results</a></li>
							<li><a href="location.do"><i class="fa fa-circle-o"></i>Defects</a></li>
						</ul>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>
		<!-- /.Left side column. contains the logo and sidebar -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<form action="defects.do" method="Post" name="form1"
					onsubmit="return selectDefect()">
					<table>
						<tr>
							<th>Select a Defect file:</th>
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
					<font style="font-size: 20px; padding-left: 15px;">
						${defects.get(0).getFileName()}</font>
				</c:if>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${defects.size()!=0}">
							<form method="post">
								<input type="hidden" name="length" value="${defects.size()}">
								<div class="box">
									<!-- /.box-header -->
									<div class="box-body"
										style="max-height: 380px; overflow: auto;">
										<table id="example1"
											class="table table-bordered table-striped">
											<thead>
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
											</thead>
											<tbody>
												<c:forEach var="data" items="${defects}">
													<input type="hidden" name="filelocation"
														value="${defects.get(0).getFileLocation()}">
													<tr>
														<td><input type="text" name="id${data.getIndex()}"
															value="${data.getId()}" size="5" readonly
															style="border-style: hidden; background-color: transparent;"></td>
														<td><input type="text"
															name="testCaseid${data.getIndex()}"
															value="${data.getTestCaseid()}" size="14" readonly
															style="border-style: hidden; background-color: transparent;"></td>
														<td><input type="text"
															name="testCaseName${data.getIndex()}"
															value="${data.getTestCaseName()}" size="10" readonly
															style="border-style: hidden; background-color: transparent;"></td>
														<td><input type="text"
															name="defectID${data.getIndex()}"
															value="${data.getDefectID()}" size="10" readonly
															style="border-style: hidden; background-color: transparent;"></td>
														<td><input type="text"
															name="loggeddate${data.getIndex()}"
															value="${data.getLoggedDate()}" size="14" readonly
															style="border-style: hidden; background-color: transparent;"></td>
														<td><select name='logDefect${data.getIndex()}'>
																<c:forEach var="type" items="${logDefect}">
																	<option value="${type.key}"
																		${type.key.equals(data.getLogDefect()) ? "selected='selected'" : ""}>
																		${type.value}</option>
																</c:forEach>
														</select></td>
														<td><input type="text"
															name="summary${data.getIndex()}"
															value="${data.getSummary()}" size="16"
															style="border-style: hidden; background-color: transparent;"></td>
														<td><input type="text"
															name="description${data.getIndex()}"
															value="${data.getDescription()}" size="16"
															style="border-style: hidden; background-color: transparent;"></td>
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
															value="${data.getStepsToReproduce()}" size="10"
															style="border-style: hidden; background-color: transparent;"></td>
														<td><input type="text"
															name="additionalInformation${data.getIndex()}"
															value="${data.getAdditionalInformation()}" size="10"
															style="border-style: hidden; background-color: transparent;"></td>
														<td><input type="text"
															name="uploadFilePath${data.getIndex()}"
															value="${data.getUploadFilePath()}" size="10"
															style="border-style: hidden; background-color: transparent;"></td>
														<td><a href="${data.getDefectUrl()}" target="_blank">${data.getDefectUrl()}</a>
															<input type="hidden" name="defecturl${data.getIndex()}"
															value="${data.getDefectUrl()}"></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.box-body -->
									<br>
									<div align="center">
										<table>
											<tr>
												<td><input type="submit" value="Save"
													onclick="javascript: form.action='update.do';"> <input
													type="submit" value="Log Defect"
													onclick="javascript: form.action='data.do';" /></td>
											</tr>
										</table>
										<br>
									</div>
								</div>
								<!-- /.box -->
							</form>
						</c:if>
						<c:if test="${defects.size()==0}">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body" style="text-align: center;">
									<font style="font-size: 20px; padding-left: 15px;"> No
										defects to display</font>
								</div>
								<!-- /.box-body -->

							</div>
							<!-- /.box -->
						</c:if>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0
			</div>
			<strong>Copyright &copy; 2017 <a
				href="https://www.estuate.com/">Estuate Inc</a>.
			</strong> All rights reserved.
		</footer>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="js/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="js/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="js/demo.js"></script>
	<!-- page script -->
	<!-- <script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>  -->
</body>
</html>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>ESAIP|Run plan</title>
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
				</a> <a href=""
					style="text-align: center; font-size: 30px; color: white; padding-left: 300px;">
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
				<h1>Run plan</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<form action="create.do" method="post">
							<input type="hidden" name="length" value="${runplanlist.size()}">
							<div class="box" style="height: 380px; overflow-y: auto;">
								<!-- /.box-header -->
								<div class="box-body">
									<table id="example1" class="table table-bordered table-striped">
										<thead>
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
										</thead>
										<tbody>
											<c:forEach var="data" items="${runplanlist}">
												<tr>
													<td><input type="text" name="id${data.getIndex()}"
														value='${data.getId()}' readonly size="5"
														style="border-style: hidden; background-color: transparent;"></td>
													<td><input type="text"
														name="businessRequirement${data.getIndex()}"
														value='${data.getBusinessRequirement()}' readonly
														size="16"
														style="border-style: hidden; background-color: transparent;"></td>
													<td>${data.getDescription()}<input type="hidden"
														name="description${data.getIndex()}"
														value='${data.getDescription()}' readonly size="16"
														style="border-style: hidden; background-color: transparent;"></td>
													<td><input type="text"
														value='${data.getImpactedBRs()}' readonly size="16"
														style="border-style: hidden; background-color: transparent;"></td>
													<td><c:if
															test='${data.getIncludeImpactedBRs().length() != 0}'>
															<select name='includeImpactedBRs${data.getIndex()}'>
																<option value="Yes"
																	${data.getIncludeImpactedBRs().equals("Yes") ? "selected='selected'" : ""}>Yes</option>
																<option value="No"
																	${data.getIncludeImpactedBRs().equals("No") ? "selected='selected'" : ""}>No</option>
															</select>
														</c:if></td>
													<td><input name="modules${data.getIndex()}"
														type="text" value='${data.getModules()}' readonly
														size="16"
														style="border-style: hidden; background-color: transparent;"></td>
													<td><c:if
															test='${data.getModulesInclude().length() != 0}'>
															<select name='modulesInclude${data.getIndex()}'>
																<option value="Yes"
																	${data.getModulesInclude().equals("Yes") ? "selected='selected'" : ""}>Yes</option>
																<option value="No"
																	${data.getModulesInclude().equals("No") ? "selected='selected'" : ""}>No</option>
															</select>
														</c:if></td>
													<td>${data.getTestCases()}<input name="testCases${data.getIndex()}"
														type="hidden" value='${data.getTestCases()}' readonly
														size="16"
														style="border-style: hidden; background-color: transparent;"></td>
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
										</tbody>
									</table>
								</div>
								<!-- /.box-body -->
							</div>
							<div align="center">
								<input type="submit" value="Create Run plan">
							</div>
							<!-- /.box -->
						</form>
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
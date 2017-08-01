<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>ESAIP|Execute</title>
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
<script type="text/javascript" src="js/validation.js"></script>
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
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<c:if test="${executiondata.size()!=0}">
								<font style="font-size: 20px; padding-left: 15px;">Execution
									Plan: ${executiondata.get(0).getFileName()}</font>
							</c:if>
							<!-- /.box-header -->
							<form action="execute.do" method="Post">
								<div class="box-body" style="height: 275px; overflow-y: auto;">
									<c:if test="${executiondata.size()!=0}">

										<input type="hidden" name="filelocation"
											value="${executiondata.get(0).getFileLocation()}"></input>
										<table id="example1"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>SL No</th>
													<th>Business Requirement</th>
													<th>Modules</th>
													<th>Test Cases</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="data" items="${executiondata}">
													<tr>
														<td>${data.getId()}</td>
														<td>${data.getBR()}</td>
														<td>${data.getModule()}</td>
														<td>${data.getTestCase()}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</c:if>
									<c:if test="${executiondata.size()==0}">
										<h2>No Run plan available to Execute in this file</h2>
									</c:if>
								</div>
								<!-- /.box-body -->
								<div align="center">
									<c:if test='${newnode.equals("Yes")}'>
										<div style="padding-left: 10px;">
											<font color=Red size=2px>Latest version available:
												${version}</font>
										</div>
									</c:if>
									Node server running <input type="checkbox" name="startbutton"
										onclick="showButton()"><a href="#myModal"
										role="button" data-toggle="modal"><font color="blue">
											How to start?</font></a><a href="download.do"><font color="blue">
											Download</font></a>
									<div id="div1" style="display: none">
										<input type="submit" value="Start Execution">
									</div>
								</div>
							</form>
							<br>
						</div>
						<!-- /.box -->
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
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel"
							style="text-align: center;">How to start Node server on your
							system</h4>
					</div>
					<div class="modal-body">
						<p>
							<font color="red" size="2px">*Prerequisite: Latest java to
								be set in your machine. </font><a
								href="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
								target="_blank"><font color="blue" size="2px">Get Now</font></a>
						</p>
						<p>
							<strong>a) If you have not downloaded
								NodeserverBundle.exe</strong>
						</p>
						<p style="padding-left: 15px;">
							1. Download the NodeserverBundle.exe from below Download link.<br>
							2. Double click on downloaded NodeserverBundle.exe.<br> 3.
							When prompt is displayed enter the folder location where the
							files need to be extracted and click on OK.<br> 4. Wait till
							the file extraction is completed.<br> 5. Go to the extracted
							location. <br /> 6. Double click on Nodeserver.exe<br> 7.
							Command prompt opens and Nodeserver is started.<br> 8.
							Please do not close the command prompt until Test execution is
							complete. <br>
						</p>
						<p>
							<strong>b) If you have already downloaded and extracted
								NodeserverBundle.exe</strong>
						</p>
						<p style="padding-left: 15px;">
							1. Go to the previously extracted location.<br> 2. Double
							click on Nodeserver.exe<br> 3. Command prompt opens and Node
							server is started.<br> 4. Please do not close the command
							prompt until Test execution is complete.
						</p>
					</div>
					<div class="modal-footer">
						<a href="download.do"><font color="blue">Download</font></a>
					</div>
				</div>
			</div>
		</div>
		<!-- /Modal -->
		<div class="control-sidebar-bg"></div>
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
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
<link rel="stylesheet" type="text/css" href="css/progress.css" />
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
					</a> <c:if test="${resultstatus<100}">
							<ul class="treeview-menu">
								<li><a href=""><i class="fa fa-circle-o"></i>Master
										Plan</a></li>
								<li><a href=""><i class="fa fa-circle-o"></i> Runplan</a></li>
								<li><a href=""><i class="fa fa-circle-o"></i>Execute</a></li>
								<li><a href=""><i class="fa fa-circle-o"></i>Results</a></li>
								<li><a href=""><i class="fa fa-circle-o"></i>Defects</a></li>
							</ul>
						</c:if> <c:if test="${resultstatus==100}">
							<ul class="treeview-menu">
								<li><a href="fetch.do"><i class="fa fa-circle-o"></i>Master
										Plan</a></li>
								<li><a href="runplan.do"><i class="fa fa-circle-o"></i>
										Runplan</a></li>
								<li><a href="filedetails.do"><i class="fa fa-circle-o"></i>Execute</a></li>
								<li><a href="results.do"><i class="fa fa-circle-o"></i>Results</a></li>
								<li><a href="location.do"><i class="fa fa-circle-o"></i>Defects</a></li>
							</ul>
						</c:if>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>
		<!-- /.Left side column. contains the logo and sidebar -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header"></section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box" style="height: 380px;">
							<c:if test="${resultstatus<100}">
								<meta http-equiv="Refresh" content="10;url=process.do">
								<font style="font-size: 20px; padding-left: 10px;">Please
									wait, execution is in progress.</font>
							</c:if>
							<c:if test="${resultstatus==100}">
								<font style="font-size: 20px; padding-left: 10px;">Execution
									Status:</font>
							</c:if>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="progress">
									<span class="progress-val">${resultstatus}%</span> <span
										class="progress-barr"><span class="progress-in"
										style="width: ${resultstatus}%"></span></span>
								</div>
								<div
									style="padding-left: 25px; width: 400px; text-align: center;">
									<font color=red size=4px><strong>${nodeMessage}</strong></font>
								</div>
								<c:if test="${resultstatus<100}">
									<c:if test='${stopStatus.equals("No")}'>
										<c:if test='${nodeStatus.equals("Yes")}'>
											<div style="padding-left: 150px">
												<button onclick="stopExecution(); showMessage();">Stop
													Execution</button>
											</div>
										</c:if>
										<div
											style="padding-left: 25px; width: 400px; text-align: center;">
											<span id="stop" style="display: none"><font color=red
												size=4px>Execution Terminates after current testcase
													execution completes.</font></span>
										</div>
										<c:if test='${nodeStatus.equals("No")}'>
											<div
												style="padding-left: 25px; width: 400px; text-align: center;">
												<form action="generate.do" method="post">
													<input type="hidden" value="${runplan}" name="filelocation">
													<div>
														<input type="submit" value="Continue">
													</div>
												</form>
											</div>
										</c:if>
									</c:if>
									<c:if test='${stopStatus.equals("Yes")}'>
										<div
											style="padding-left: 25px; width: 400px; text-align: center;">
											<span id="stop"><font color=red size=4px>Execution
													Terminates after current testcase execution completes.</font></span>
										</div>
									</c:if>
								</c:if>
								<c:if test="${resultstatus==100}">

									<div
										style="padding-left: 25px; width: 400px; text-align: center;">
										<font color=red size=4px>${stopMessage}</font>
									</div>
									<form action="display.do" method="post">
										<input type="hidden" value="${resultfile}" name="filelocation">
										<div
											style="padding-left: 25px; width: 400px; text-align: center;">
											<font color=green size=4px><strong>Execution
													complete</strong></font>
										</div>
										<div
											style="padding-left: 25px; width: 400px; text-align: center;">
											<input type="submit" value="Continue">
										</div>
									</form>
								</c:if>
							</div>
							<!-- /.box-body -->
						</div>
						<div></div>
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
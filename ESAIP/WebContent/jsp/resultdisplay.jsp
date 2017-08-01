<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>ESAIP|Results</title>
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
				<form action="display.do" method="Post" name="form1"
					onsubmit="return selectResult()">
					<table>
						<tr>
							<th style="padding-left: 5px;">Select other result file:</th>
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
				<c:if test="${UsedRunPlan.size()!=0}">
					<font style="font-size: 20px; padding-left: 15px;">
						${UsedRunPlan.get(0).getFileName()}</font>
				</c:if>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<c:if test="${result.size()!=0}">
								<div style="text-align: right; margin-right: 15px;">
									<a
										href="save.do?filelocation=${result.get(0).getFileLocation()}">Download
										result file </a>|<a
										href="logs.do?filelocation=${result.get(0).getFileLocation()}">
										Download log file </a>
									<c:if test="${defectsize>0}">
							|<a
											href="defects.do?filelocation=${result.get(0).getFileLocation()}">
											Log Defects</a>
									</c:if>
								</div>
							</c:if>
							<!-- /.box-header -->
							<div class="box-body" style="height: 125px; overflow-y: auto;">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>SL No</th>
											<th>Business Requirement</th>
											<th>Modules</th>
											<th>Test Case Id</th>
											<th>Test Cases</th>
											<th>Criticality</th>
											<th>Result</th>
											<th>Time Taken</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="data" items="${UsedRunPlan}">
											<tr>
												<td>${data.getId()}</td>
												<td>${data.getBR()}</td>
												<td>${data.getModule()}</td>
												<td>${data.getTestCaseId()}</td>
												<td>${data.getTestCase()}</td>
												<td>${data.getCriticality()}</td>
												<td>${data.getResult()}</td>
												<td>${data.getTimeTaken()}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
							<br/>
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-md-7">
						<!--Status -->
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Status</h3>
							</div>
							<div class="box-body">
								<div
									style="height: 190px; overflow-y: auto; text-align: center;">
									<table id="example1" class="table table-bordered table-striped">
										<c:forEach var="data" items="${result}">
											<tr>
												<th>${data.getResultkey()}</th>
												<td>${data.getResultvalue()}</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col (LEFT) -->
					<div class="col-md-5">
						<!-- Graph -->
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Graph</h3>
							</div>
							<div class="box-body">
								<div class="chart" style="height: 190px; overflow: hidden;">
									<div id="piechart" style="height: 210px; align: left"></div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col (RIGHT) -->
				</div>
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
	<c:if test="${result.size()>0}">
		<form name="form2">
			<input type="hidden" name="pass"
				value="${result.get(5).getResultvalue()}"> <input
				type="hidden" name="fail" value="${result.get(6).getResultvalue()}">
			<input type="hidden" name="noRun"
				value="${result.get(7).getResultvalue()}">
		</form>
	</c:if>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var pass = parseInt(document.form2.pass.value);
			var fail = parseInt(document.form2.fail.value);
			var norun = parseInt(document.form2.noRun.value);
			var data = google.visualization.arrayToDataTable([
					[ 'Test Case', 'success' ], [ 'Pass', pass ],
					[ 'Fail', fail ], [ 'No Run', norun ], ]);
			var options = {
				colors : [ '#2faf3c', '#ff0000', '#708090' ],
				is3D : true,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));

			chart.draw(data, options);
		}
	</script>
</body>
</html>
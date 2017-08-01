function selectResult() {
	if (document.form1.filelocation.value == "") {
		document.getElementById("result").innerHTML = "<font color=red size=2px>Please select a result file.</font>";
		document.getElementById("result").style.display = "inline";
		document.form1.filelocation.focus();
		return false;
	}
}
function selectDefect() {
	if (document.form1.filelocation.value == "") {
		document.getElementById("result").innerHTML = "<font color=red size=2px>Please select a defect file.</font>";
		document.getElementById("result").style.display = "inline";
		document.form1.filelocation.focus();
		return false;
	}
}
function selectrunplan() {
	if (document.form1.filelocation.value == "") {
		document.getElementById("result").innerHTML = "<font color=red size=2px>Please select a run plan.</font>";
		document.getElementById("result").style.display = "inline";
		document.form1.filelocation.focus();
		return false;
	}
}
function stopExecution() {
	var xmlhttp;
	var urls = "stop.do";
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("GET", urls, true);
	xmlhttp.send();
}
function showMessage() {
	document.getElementById("stop").style.display = "inline";
}

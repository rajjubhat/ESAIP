function validate() {
	var emailId = document.getElementById("emailid");
	if (trim(emailId.value) == "") {
		document.getElementById("mail").innerHTML = "<font color=red size=2px>Please enter e-mail ID.</font>";
		document.getElementById("mail").style.display = "inline";
		emailid.focus();
		return false;
	}

	var email = document.form1.emailid;
	var e_mail = document.form1.emailid.value;
	var atpos = e_mail.indexOf("@");
	var dotpos = e_mail.lastIndexOf(".");
	if (email.value == "" || atpos < 1 || dotpos < atpos + 2
			|| dotpos + 2 >= e_mail.length) {
		document.getElementById("mail").innerHTML = "<font color=red size=2px>Please enter valid e-mail ID</font>";
		document.getElementById("mail").style.display = "inline";
		emailid.focus();
		return false;
	}

	var password = document.getElementById("password");
	if (trim(password.value) == "") {
		document.getElementById("mail").innerHTML = "<font color=red size=2px>Please enter Password.</font>";
		document.getElementById("mail").style.display = "inline";
		password.focus();
		return false;
	}
}
function trim(str) {
	return str.replace(/^\s+|\s+$/g, '');
}
function showButton() {
	var chboxs = document.getElementsByName("startbutton");
	var vis = "none";
	for (var i = 0; i < chboxs.length; i++) {
		if (chboxs[i].checked) {
			vis = "block";
			break;
		}
	}
	document.getElementById("div1").style.display = vis;
}

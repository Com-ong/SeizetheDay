<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Forgot</title>
<link rel="stylesheet" href="CSS/forgot.css">
<script type="text/javascript">
var display_forgot = true;
function display_find_id(){
	var con = document.getElementById("find_id");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
	
	/* ��й�ȣ ã�Ⱑ ���� ���� �� display�� none���� ���� */
	var con2 = document.getElementById("find_pw");
	if(con2.style.display != 'none') {
		con2.style.display = 'none';
	}
}
function display_find_pw(){
	var con = document.getElementById("find_pw");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
	
	/* ���̵� ã�Ⱑ ���� ���� �� display�� none���� ���� */
	var con2 = document.getElementById("find_id");
	if(con2.style.display != 'none') {
		con2.style.display = 'none';
	}
}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="forgot_area">
	<div class="forgot_title">FORGOT</div>
	
	<div class="forgot_select">
		<table>
			<tr>
				<td><input type="button" id="forgot_id" name="forgot_id" value="���̵� ã�� �;��" onclick="display_find_id();"></td>
				<td><input type="button" id="forgot_pw" name="forgot_pw" value="��й�ȣ�� ã�� �;��" onclick="display_find_pw();"></td>
			</tr>
			<tr>
				<td>
				<div id="find_id" style="display: none;">
					<form name="find_id_form">
						<a>������ �� ����� �̸��� �̸����� �ۼ����ּ���.</a><br>
						<div>
							<h3>NAME<input type="text" name="find_id_name" id="find_id_name" value=""></h3>
							<h3>EMAIL<input type="text" name="find_id_email" id="find_id_email" value=""></h3>
							<input type="button" id="find_id_btn" name="find_id_btn" value="���̵� ã��" onclick="find_id_window(this.form.find_id_name.value, this.form.find_id_email.value)">
						</div>
					</form>
				</div>
				<div id="find_pw" style="display: none;">
					<form name="find_pw_form">
						<a>������ �� ����� ID, �̸�, �̸����� �ۼ����ּ���.</a><br>
						<a>ȸ�� Ȯ���� �Ϸ�Ǹ� ���ο� ��й�ȣ�� ������ �� �ֽ��ϴ�.</a>
						<div>
							<h3>ID<input type="text" name="find_pw_id" id="find_pw_id" value=""></h3>
							<h3>NAME<input type="text" name="find_pw_name" id="find_pw_name" value=""></h3>
							<h3>EMAIL<input type="text" name="find_pw_email" id="find_pw_email" value=""></h3>
							<input type="button" id="find_pw_btn" name="find_pw_btn" value="ȸ�� Ȯ��" onclick="find_pw_window(this.form.find_pw_id.value, this.form.find_pw_name.value, this.form.find_pw_email.value)">
						</div>
					</form>
				</div>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
<script type="text/javascript">
function find_id_window(find_id_name, find_id_email) {
	frm = document.find_id_form;
	if (document.find_id_form.find_id_name.value == "") {
		alert("�̸��� �Է��� �ּ���.");
		frm.find_id_name.focus();
		return;
	}
	if(document.find_id_form.find_id_email.value=="") {
		alert("�̸����� �Է��� �ּ���.");
		frm.find_id_email.focus();
		return;
	}
	frm.reset();
	window_url = "find_id.jsp?find_id_name=" + find_id_name + "&find_id_email=" + find_id_email;
	window.open(window_url, "find id", "width=300,height=150");
}

function find_pw_window(find_pw_id, find_pw_name, find_pw_email) {
	frm = document.find_pw_form;
	if (document.find_pw_form.find_pw_id.value == "") {
		alert("���̵� �Է��� �ּ���.");
		frm.find_pw_id.focus();
		return;
	}
	if(document.find_pw_form.find_pw_name.value=="") {
		alert("�̸��� �Է��� �ּ���.");
		frm.find_pw_name.focus();
		return;
	}
	if(document.find_pw_form.find_pw_email.value=="") {
		alert("�̸����� �Է��� �ּ���.");
		frm.find_pw_email.focus();
		return;
	}
	
	frm.reset();
	window_url = "find_pw.jsp?find_pw_id=" + find_pw_id + "&find_pw_name=" + find_pw_name + "&find_pw_email=" + find_pw_email;
	console.log(window_url);
	window.open(window_url, "find pw", "width=500,height=200");
}
</script>
</html>
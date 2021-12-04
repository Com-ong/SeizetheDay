<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="JavaBeans.UserBean" %>
<%
	request.setCharacterEncoding("EUC-KR");
	UserBean currUser= (UserBean)session.getAttribute("currUser");
%>
<!DOCTYPE html>
<html>
<head>
<title>create exhibition</title>
<link rel="stylesheet" href="CSS/create_fileinput.css">
</head>
<body>
<script>
<%if(currUser==null){%>
	window.onload = function(){
		alert("�α��� �� �̿����ּ���.");
		location.href="./";
	}
<%}%>
</script>
	<jsp:include page="header.jsp"></jsp:include>
	<div class = "make-exhibition">
		<div class = "make-title">
			CREATE EXHIBITION
		</div>
		<div class = "make-content">
			<form method="post" action="create_insertDB.jsp" enctype="multipart/form-data">
				<label for="exhibition-title">����</label>
				<input type="text" id="exhibition-title" name="exhibition-title"><br><br>
				<label for="exhibition-theme">���� ����</label>
				<select name="exhibition-theme" id="exhibition-theme">
  					<option value="IT">IT</option>
  					<option value="Art">Art</option>
  					<option value="Science">Science</option>
  					<option value="Geometric">Geometric</option>
				</select>
				<label for="exhibition-start-date">�Ⱓ</label>
				<input type="date" id="exhibition-start-date" name="exhibition-start-date"> ~ 
						<input type="date" id="exhibition-finish-date" name="exhibition-finish-date"><br><br>
				<span>����/����� ����</span>
						<input type="radio" name="exhibition-open" id="public" value="public" checked>
						<label for="public">����</label>
						<input type="radio" name="exhibition-open" id="private" value="private">
						<label for="private">�����</label><br><br>
				<label for="exhibition-explain">����ȸ ����</label>
				<input type="text" id="exhibition-explain" name="exhibition-explain"><br><br>
				<label for="exhibition-background-color">��� ����</label>
				<input type="color" id="exhibition-background-color" name="exhibition-background-color"><br><br>
				<label for="exhibition-file">��ǰ �߰�</label>
				<button type="button" id="addImgBtn" onclick="addFileInput()"><!-- �߰� ��ư�� ������ ���� ���� input Ȱ��, ���� �߰� -->
        			<img src="./srcImg/plus.png">
    			</button>
    			<input type="hidden" id = "exhibition-file-cnt" name = "exhibition-file-cnt" value="0">
				<input type="file" id="exhibition-file1" name="exhibition-file1" style="display:none;"><br><br><!--���� ������ 5���� ����. -->
				<input type="file" id="exhibition-file2" name="exhibition-file2" style="display:none;" disabled><br><br>
				<input type="file" id="exhibition-file3" name="exhibition-file3" style="display:none;" disabled><br><br>
				<input type="file" id="exhibition-file4" name="exhibition-file4" style="display:none;" disabled><br><br>
				<input type="file" id="exhibition-file5" name="exhibition-file5" style="display:none;" disabled><br><br>
				
				<label for="exhibition-file-explain1">��ǰ ����</label>
				<input type="text" id="exhibition-file-explain1" name="exhibition-file-explain1"><br><br>
				<input type="text" id="exhibition-file-explain2" name="exhibition-file-explain2" disabled><br><br>
				<input type="text" id="exhibition-file-explain3" name="exhibition-file-explain3" disabled><br><br>
				<input type="text" id="exhibition-file-explain4" name="exhibition-file-explain4" disabled><br><br>
				<input type="text" id="exhibition-file-explain5" name="exhibition-file-explain5" disabled><br><br>
				<div class = "submit-btn">
					<input type="submit" class="press-btn" id="exhibition-make-btn" name="make" value = "Create">
					<input type="button" class="press-btn" id="exhibition-cancel-btn" name="cancel" value = "Cancel">
				</div>
			</form>
		</div>
		
	</div>
	<script>
	function addFileInput(){
		
		var file_cnt = parseInt(document.getElementById("exhibition-file-cnt").value);
		file_cnt = file_cnt + 1;
		console.log(file_cnt);
		
		if (file_cnt<=5) document.getElementById("exhibition-file-cnt").value = String(file_cnt);
		else alert("��ǰ�� �ִ� 5�� ÷���� �� �ֽ��ϴ�.");
		
		var file_input_id="exhibition-file"+file_cnt;
		var explain_input_id = "exhibition-file-explain"+file_cnt;
		
		document.getElementById(file_input_id).disabled = false;
		document.getElementById(file_input_id).click();
		document.getElementById(explain_input_id).disabled = false;
	}
	</script>
</body>                                                                                                                                                                                                                                                                                                                                                                    
</html>
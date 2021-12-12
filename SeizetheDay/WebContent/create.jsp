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
<link rel="stylesheet" href="CSS/create.css">
</head>
<body>
<script>
<%if(currUser==null){%>
	window.onload = function(){
		alert("로그인 후 이용해주세요.");
		location.href="./";
	}
<%}%>
</script>
	<jsp:include page="header.jsp"></jsp:include>
	<div class = "make-exhibition">
		<div class = "make-title">
			CREATE EXHIBITION
		</div>
		<br>
		<div class = "make-content">
		<br>
			<form method="post" action="create_insertDB.jsp" enctype="multipart/form-data">
				<label for="exhibition-title">제목</label>
				<input type="text" id="exhibition-title" name="exhibition-title" class="textbox"><br><br>
				<label for="exhibition-theme">주제 선택</label>
				<select name="exhibition-theme" id="exhibition-theme">
  					<option value="IT">IT</option>
  					<option value="Art">Art</option>
  					<option value="Science">Science</option>
  					<option value="Modern">Modern</option>
  					<option value="Geometric">Geometric</option>
				</select><br><br>
				<label for="exhibition-start-date">기간</label>
				<input type="date" id="exhibition-start-date" name="exhibition-start-date"> ~ 
						<input type="date" id="exhibition-finish-date" name="exhibition-finish-date"><br><br>
				<span>공개/비공개 설정</span>
						<input type="radio" name="exhibition-open" id="public" value="public" checked>
						<label for="public">공개</label>
						<input type="radio" name="exhibition-open" id="private" value="private">
						<label for="private">비공개</label><br><br>
				<label for="exhibition-explain" >전시회 설명</label><br>
				<textarea class="textbox" id="exhibition-explain" name="exhibition-explain"></textarea><br><br>
				<label for="exhibition-background-color">배경 색상</label>
				<input type="color" id="exhibition-background-color" name="exhibition-background-color"><br><br>
				<label for="exhibition-file">작품 추가 및 설명</label>
				<button type="button" id="addImgBtn" onclick="addFileInput()"><!-- 추가 버튼을 누르면 다음 파일 input 활성, 파일 추가 -->
        			<img src="./srcImg/plus.png">
    			</button><br>
    			<input type="hidden" id = "exhibition-file-cnt" name = "exhibition-file-cnt" value="0">
				
				<!-- 전시회 썸네일 -->
				<p style="font-size:0.5em;">전시회 썸네일 및 작품 등록은 반드시 "+" 버튼으로 진행해주세요. 전시 썸네일(표지)의 경우 전시의 가장 첫번째로 나타납니다.</p>
				
				<label for="exhibition-profile" style="font-size:0.7em;">전시회 썸네일</label>
				<input type="file" id="exhibition-file0" name="exhibition-file0">
				<input type="text" id="exhibition-file-explain0" name="exhibition-file-explain0" value="전시회 썸네일" readonly><br><br>
				<!-- ///// -->
				
				<!-- <input type="file" id="exhibition-file1" name="exhibition-file1">파일 개수를 5개로 제한. style="display:none;"
				<input type="text" id="exhibition-file-explain1" name="exhibition-file-explain1" placeholder="사진 설명 입력"> -->
				
				<input type="file" id="exhibition-file1" name="exhibition-file1" disabled>
				<input type="text" id="exhibition-file-explain1" name="exhibition-file-explain1" placeholder="사진 설명 입력" disabled><br><br>
				
				<input type="file" id="exhibition-file2" name="exhibition-file2" disabled>
				<input type="text" id="exhibition-file-explain2" name="exhibition-file-explain2" disabled><br><br>
				
				<input type="file" id="exhibition-file3" name="exhibition-file3" disabled>
				<input type="text" id="exhibition-file-explain3" name="exhibition-file-explain3" disabled><br><br>
				
				<input type="file" id="exhibition-file4" name="exhibition-file4" disabled>
				<input type="text" id="exhibition-file-explain4" name="exhibition-file-explain4" disabled><br><br>
				
				<input type="file" id="exhibition-file5" name="exhibition-file5" disabled>
				<input type="text" id="exhibition-file-explain5" name="exhibition-file-explain5" disabled><br><br>
				
				<div class = "submit-btn">
					<input type="submit" class="press-btn" id="exhibition-make-btn" name="make" value = "Create">
					<input type="button" class="press-btn" id="exhibition-cancel-btn" name="cancel" value = "Cancel">
				</div>
			</form>
			<div id="clear" style="clear:both;"></div>
		</div>
		
	</div>
	<script>
	function addFileInput(){
		
		var file_cnt = parseInt(document.getElementById("exhibition-file-cnt").value);
		file_cnt = file_cnt + 1;
		console.log(file_cnt);
		
		// 썸네일 추가 전
		/* if (file_cnt<=5) document.getElementById("exhibition-file-cnt").value = String(file_cnt);
		else alert("작품은 최대 5개 첨부할 수 있습니다.");
		
		var file_input_id="exhibition-file"+file_cnt;
		var explain_input_id = "exhibition-file-explain"+file_cnt;
		
		document.getElementById(file_input_id).disabled = false;
		document.getElementById(file_input_id).click();
		document.getElementById(explain_input_id).disabled = false; */
		
		// 썸네일 추가했을 때
		if (file_cnt<=6) document.getElementById("exhibition-file-cnt").value = String(file_cnt);
		else alert("작품은 최대 5개 첨부할 수 있습니다.");
		
		if(file_cnt == 1) {document.getElementById("exhibition-file0").click();}
		else { 
			var file_input_id="exhibition-file"+(file_cnt-1);
			var explain_input_id = "exhibition-file-explain"+(file_cnt-1);
			
			document.getElementById(file_input_id).disabled = false;
			document.getElementById(file_input_id).click();
			document.getElementById(explain_input_id).disabled = false;
		}
	}
	</script>
</body>                                                                                                                                                                                                                                                                                                                                                                    
</html>
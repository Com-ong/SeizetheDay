<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>create page - multi file</title>
<link rel="stylesheet" href="CSS/create.css">
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class = "make-exhibition">
		<div class = "make-title">
			CREATE EXHIBITION
		</div>
		<div class = "make-content">
			<form method="post" action="create_insertDB.jsp" enctype="multipart/form-data">
				<label for="exhibition-title">제목</label>
				<input type="text" id="exhibition-title" name="exhibition-title"><br><br>
				<label for="exhibition-theme">주제 선택</label>
				<select name="exhibition-theme" id="exhibition-theme">
  					<option value="A">A</option>
  					<option value="B">B</option>
  					<option value="C">C</option>
  					<option value="D">D</option>
				</select>
				<label for="exhibition-start-date">기간</label>
				<input type="date" id="exhibition-start-date" name="exhibition-start-date"> ~ 
						<input type="date" id="exhibition-finish-date" name="exhibition-finish-date"><br><br>
				<span>공개/비공개 설정</span>
						<input type="radio" name="exhibition-open" id="public" value="public" checked>
						<label for="public">공개</label>
						<input type="radio" name="exhibition-open" id="private" value="private">
						<label for="private">비공개</label><br><br>
				<label for="exhibition-explain">전시회 설명</label>
				<input type="text" id="exhibition-explain" name="exhibition-explain"><br><br>
				<label for="exhibition-background-color">배경 색상</label>
				<input type="color" id="exhibition-background-color" name="exhibition-background-color"><br><br>
				<label for="exhibition-file">작품 추가</label>
				<button type="button" id="imageButton" onclick="document.getElementById('exhibition-file').click()">
        			<img src="./srcImg/plus.png">
    			</button>
				<input type="file" id="exhibition-file" name="exhibition-file" style="display:none;"><br><br>
				<label for="exhibition-file-explain">작품 설명</label>
				<input type="text" id="exhibition-file-explain" name="exhibition-file-explain"><br><br>
				<div class = "submit-btn">
					<input type="button" id="exhibition-cancel-btn" name="cancel" value = "Cancel">
					<input type="submit" id="exhibition-make-btn" name="make" value = "Create">
				</div>
			</form>
		</div>
	</div>
	<script>
	</script>
</body>                                                                                                                                                                                                                                                                                                                                                                    
</html>
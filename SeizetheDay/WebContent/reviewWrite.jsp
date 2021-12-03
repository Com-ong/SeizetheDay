<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Add Review</title>
<link rel = "stylesheet" href = "CSS/ReviewWitePageCSS.css">
</head>
<body>
<<<<<<< HEAD
	<jsp:include page="header.jsp"></jsp:include>'
	<div class="reviewWrite_area1">
	<div class="reviewWrite_list">
		<table id="reviewWrite_area2">
			<tr>
				<td><input type="button" id="back_btn" value="후기 목록으로 돌아가기" onClick="if(confirm('작성하던 내용이 사라집니다.\n돌아가시겠습니까?')){location.href='ReviewPage.html';} else {return false;}"></td>
			</tr>
			<tr>
				<td><h1 id="reviewWriteText">후기 작성하기</h1></td>
			</tr>
			<tr>
				<td><br><br>전시 관람 후 후기를 작성해주세요.<br><br></td>
			</tr>
			<tr>
				<td><label><b>[관람한 전시 제목]</b></label>
			<tr>
			<tr>
				<td>
					<label id="reviewWrite_title">제목</label>
					<input type="text" id="reviewWrite_title_input" value="">
				</td>
			</tr>
			<tr>
				<td><label>[작성자 이름]</label></td>
			</tr>
			<tr>
				<td>
					<textarea class="reviewWrite_input" rows="10" cols="100" required>여기에 전시 관람 후기를 작성하세요.</textarea>
				</td>
			</tr>
			<tr>
				<td id="reviewWrite_btns">
					<input type="submit" id="reviewWrite_cancel" value="취소" onClick="if(confirm('작성하던 내용이 사라집니다.\n계속하시겠습니까?')){location.href='ReviewPage.html';} else {return false;}">
					<input type="submit" id="reviewWrite_store" value="저장" onClick="if(confirm('후기를 저장하시겠습니까?')){location.href='ReviewPage.html';} else {return false;}">
				</td>
			</tr>
		</table>
	</div>
</div>
=======
	<jsp:include page="header.jsp"></jsp:include>

	<hr>
	<div class="reviewWrite_area1">
		<div class="reviewWrite_list">
			<table id="reviewWrite_area2">
				<tr>
					<td><input type="button" id="back_btn" value="후기 목록으로 돌아가기" onClick="if(confirm('작성하던 내용이 사라집니다.\n돌아가시겠습니까?')){location.href='review.jsp';} else {return false;}"></td>
				</tr>
				<tr>
					<td><h1 id="reviewWriteText">후기 작성하기</h1></td>
				</tr>
				<tr>
					<td><br><br>전시 관람 후 후기를 작성해주세요.<br><br></td>
				</tr>
				<tr>
					<td><label><b>[관람한 전시 제목]</b></label>
				<tr>
				<tr>
					<td>
						<label id="reviewWrite_title">제목</label>
						<input type="text" id="reviewWrite_title_input" value="">
					</td>
				</tr>
				<tr>
					<td><label>[작성자 이름]</label></td>
				</tr>
				<tr>
					<td>
						<textarea class="reviewWrite_input" rows="10" cols="100" required>여기에 전시 관람 후기를 작성하세요.</textarea>
					</td>
				</tr>
				<tr>
					<td id="reviewWrite_btns">
						<input type="submit" id="reviewWrite_cancel" value="취소" onClick="if(confirm('작성하던 내용이 사라집니다.\n계속하시겠습니까?')){location.href='review.jsp';} else {return false;}">
						<input type="submit" id="reviewWrite_store" value="저장" onClick="if(confirm('후기를 저장하시겠습니까?')){location.href='ReviewPage.html';} else {return false;}">
					</td>
				</tr>
			</table>
		</div>
	</div>

>>>>>>> 41f3ada4a7f71fef47059192330992c842864417
</body>
</html>
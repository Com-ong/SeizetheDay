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
				<td><input type="button" id="back_btn" value="�ı� ������� ���ư���" onClick="if(confirm('�ۼ��ϴ� ������ ������ϴ�.\n���ư��ðڽ��ϱ�?')){location.href='ReviewPage.html';} else {return false;}"></td>
			</tr>
			<tr>
				<td><h1 id="reviewWriteText">�ı� �ۼ��ϱ�</h1></td>
			</tr>
			<tr>
				<td><br><br>���� ���� �� �ı⸦ �ۼ����ּ���.<br><br></td>
			</tr>
			<tr>
				<td><label><b>[������ ���� ����]</b></label>
			<tr>
			<tr>
				<td>
					<label id="reviewWrite_title">����</label>
					<input type="text" id="reviewWrite_title_input" value="">
				</td>
			</tr>
			<tr>
				<td><label>[�ۼ��� �̸�]</label></td>
			</tr>
			<tr>
				<td>
					<textarea class="reviewWrite_input" rows="10" cols="100" required>���⿡ ���� ���� �ı⸦ �ۼ��ϼ���.</textarea>
				</td>
			</tr>
			<tr>
				<td id="reviewWrite_btns">
					<input type="submit" id="reviewWrite_cancel" value="���" onClick="if(confirm('�ۼ��ϴ� ������ ������ϴ�.\n����Ͻðڽ��ϱ�?')){location.href='ReviewPage.html';} else {return false;}">
					<input type="submit" id="reviewWrite_store" value="����" onClick="if(confirm('�ı⸦ �����Ͻðڽ��ϱ�?')){location.href='ReviewPage.html';} else {return false;}">
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
					<td><input type="button" id="back_btn" value="�ı� ������� ���ư���" onClick="if(confirm('�ۼ��ϴ� ������ ������ϴ�.\n���ư��ðڽ��ϱ�?')){location.href='review.jsp';} else {return false;}"></td>
				</tr>
				<tr>
					<td><h1 id="reviewWriteText">�ı� �ۼ��ϱ�</h1></td>
				</tr>
				<tr>
					<td><br><br>���� ���� �� �ı⸦ �ۼ����ּ���.<br><br></td>
				</tr>
				<tr>
					<td><label><b>[������ ���� ����]</b></label>
				<tr>
				<tr>
					<td>
						<label id="reviewWrite_title">����</label>
						<input type="text" id="reviewWrite_title_input" value="">
					</td>
				</tr>
				<tr>
					<td><label>[�ۼ��� �̸�]</label></td>
				</tr>
				<tr>
					<td>
						<textarea class="reviewWrite_input" rows="10" cols="100" required>���⿡ ���� ���� �ı⸦ �ۼ��ϼ���.</textarea>
					</td>
				</tr>
				<tr>
					<td id="reviewWrite_btns">
						<input type="submit" id="reviewWrite_cancel" value="���" onClick="if(confirm('�ۼ��ϴ� ������ ������ϴ�.\n����Ͻðڽ��ϱ�?')){location.href='review.jsp';} else {return false;}">
						<input type="submit" id="reviewWrite_store" value="����" onClick="if(confirm('�ı⸦ �����Ͻðڽ��ϱ�?')){location.href='ReviewPage.html';} else {return false;}">
					</td>
				</tr>
			</table>
		</div>
	</div>

>>>>>>> 41f3ada4a7f71fef47059192330992c842864417
</body>
</html>
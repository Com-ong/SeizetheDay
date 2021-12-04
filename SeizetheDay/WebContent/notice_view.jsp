<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!-- DB 연결 위한 추가 부분 -->
<%@ page import="java.util.*, java.sql.*, JavaBeans.*"%>
<jsp:useBean id="noticeMgr" class="JavaBeans.NoticeMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<!-- #################################### -->


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>notice_view page</title>
<!-- 참고링크:https://peterkimlab.github.io/jsp/JSP-%EA%B2%8C%EC%8B%9C%ED%8C%90-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8-%EB%A7%8C%EB%93%A4%EA%B8%B0/ -->
<!--notice페이지지만  간소화를 위해 css 링크는 trend.css사용. 헷갈림 방지 -->
<link rel="stylesheet" href="CSS/notice.css">
</head>
<style>
#ExhLeft {
	float: left;
	width: 300px;
	margin-top: 20px;
	margin-left: 30px;
	margin-right: 30px;
	margin-bottom: 20px;
	border-radius: 9%;
	overflow: hidden; th { background-color : #eeeeee;
	text-align: center;
	width: 10%;
}

table {
	display: table;
	border-color: grey;
}

table tbody tr {
	border: solid 1px rgba(210, 215, 217, 0.75);
	border-left: 0;
	border-right: 0;
}

table tbody tr:nth-child(2n + 1) {
	background-color: rgba(230, 235, 237, 0.25);
}

table td {
	padding: 0.75em 0.75em;
}

table th {
	color: #3d4449;
	font-size: 0.9em;
	font-weight: 600;
	padding: 0 0.75em 0.75em 0.75em;
	text-align: left;
}

table thead {
	border-bottom: solid 2px rgba(210, 215, 217, 0.75);
}

table tfoot {
	border-top: solid 2px rgba(210, 215, 217, 0.75);
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="notice" style="height:130%;">
		<div class="notice-title">Notice</div>
		<div class="container">
			<div class="row">
				<table style="text-align: center; width: 100%;">
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">notice</th>
						</tr>
					</thead>
					<tbody>
						<!-- DB 연결 위한 추가 부분 -->
						<%
							request.setCharacterEncoding("EUC-KR");
						
							int notice_seq = Integer.parseInt(request.getParameter("notice_seq"));
							//String notice_writer = "";
							
							Vector<UserBean> userlist = userMgr.getRegisterList();
							Vector<NoticeBean> vlist = noticeMgr.getNoticeList();
							System.out.println("notice_seq: "+notice_seq);
							String notice_title = "", notice_text = "", notice_date = "";
							String notice_writer="";
							for (int i = 0; i < vlist.size(); i++) {
								NoticeBean noticeBean = vlist.get(i);
								if (noticeBean.getNOTICE_SEQ() == notice_seq) {
									notice_title = noticeBean.getNOTICE_TITLE();
									notice_text = noticeBean.getNOTICE_TEXT();
									notice_date = noticeBean.getNOTICE_DATE().toString();
									//notice_writer_=noticeBean.getUSER_SEQ();//추가
									notice_writer=noticeMgr.getUSER_NAME(noticeBean.getUSER_SEQ());//
									System.out.println("sql문 적용 notice_writer: "+notice_writer);
								}
							}
						%>
						<tr>
							<td style="width: 10%;">글제목</td>
							<td colspan="2"><%=notice_title%></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%=notice_writer%></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"><%=notice_date%></td>
						</tr>
						<tr style="height: 450px;">
							<td>내용</td>
							<td colspan="2" style="min-height: 200px; text-align: left;">
								<%=notice_text%>
							</td>
						</tr>
						<!-- #################################### -->
					</tbody>
				</table>

				<div style="padding: 30px;">
					<input type="button" value="Notice List"
						onClick="javascript:location.href='notice.jsp'">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
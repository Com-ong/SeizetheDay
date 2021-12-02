<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB 연결 위한 추가 부분 -->
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="noticeMgr" class="JavaBeans.NoticeMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<!-- #################################### -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice_view page</title>
<!-- 참고링크:https://peterkimlab.github.io/jsp/JSP-%EA%B2%8C%EC%8B%9C%ED%8C%90-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8-%EB%A7%8C%EB%93%A4%EA%B8%B0/ -->
<!--notice페이지지만  간소화를 위해 css 링크는 trend.css사용. 헷갈림 방지 -->
<link rel="stylesheet" href="CSS/trend.css">
</head>
<style>
	#ExhLeft {float : left; width : 300px;  margin-top : 20px; margin-left : 30px; margin-right : 30px; margin-bottom: 20px;
border-radius: 9%; overflow: hidden;
th{
background-color:#eeeeee; 
text-align: center; 
width:10%;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class = "trend">
		<div class = "trend-title">
			Notice
		</div>
		<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #333344; width:100%;">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">notice</th>						
					</tr>
				</thead>
				<tbody>
					<!-- DB 연결 위한 추가 부분 -->
					<%
						request.setCharacterEncoding("UTF-8");
						int notice_seq = Integer.parseInt(request.getParameter("notice_seq"));
						String notice_writer = request.getParameter("notice_writer");
						Vector<NoticeBean> vlist = noticeMgr.getRegisterList();
						String notice_title="", notice_text="", notice_date = "";
						for(int i=0; i<vlist.size(); i++)
						{
							NoticeBean noticeBean = vlist.get(i);
							if(noticeBean.getNOTICE_SEQ() == notice_seq)
							{
								notice_title = noticeBean.getNOTICE_TITLE();
								notice_text = noticeBean.getNOTICE_TEXT();
								notice_date = noticeBean.getNOTICE_DATE().toString();
								break;
							}
						}
					%>
					
					<tr>
						<td style="width:10%;">글제목</td>
						<td colspan="2"><%= notice_title %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= notice_writer %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= notice_date %></td>
					</tr>
					<tr style="height:450px;">
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;">
							<%= notice_text %>
						</td>
					</tr>
					<!-- #################################### -->
				</tbody>
			</table>
			<div class="head1">
			<div class="user-section">
			<a href="notice.jsp" class="user-button" style="border:2px solid #333344;">목록</a>
			</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
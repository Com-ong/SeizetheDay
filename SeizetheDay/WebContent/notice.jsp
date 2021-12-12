<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	  request.setCharacterEncoding("EUC-KR");
	  //String user_id = (String)session.getAttribute("idKey");
	  //String USER_SEQ=(String)session.getAttribute("USER_SEQ_KEY");
	  //int USER_SEQ=(int)session.getAttribute("USER_SEQ_KEY");
%>
    
<!-- DB 연결 위한 추가 부분 -->
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="noticeMgr" class="JavaBeans.NoticeMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<!-- #################################### -->
<%
	UserBean currUser = (UserBean)session.getAttribute("currUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Notice page</title>
<!-- 참고링크:https://peterkimlab.github.io/jsp/JSP-%EA%B2%8C%EC%8B%9C%ED%8C%90-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8-%EB%A7%8C%EB%93%A4%EA%B8%B0/ -->
<!--notice페이지지만  간소화를 위해 css 링크는 trend.css사용. 헷갈림 방지 -->
<link rel="stylesheet" href="CSS/notice.css">
</head>
<style>
	#ExhLeft {float : left; width : 300px;  margin-top : 20px; margin-left : 30px; margin-right : 30px; margin-bottom: 20px;
border-radius: 9%; overflow: hidden;
th{
background-color:#eeeeee; 
text-align: center; 
width:10%;
}

table{
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
	
	<div class = "notice">
		<div class = "notice-title">
			Notice
		</div>
		<div class="container" style="padding:20px;">
		<div class="row">
			<!--<table class="table table-striped" style="text-align: center; width:100%;">-->
			<table style="text-align: center; width:100%;">
				<thead>
					<tr >
						<th>번호</th>
						<th style="width:70%;">제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<!-- DB 연결 위한 추가 부분 -->
					<%
						Vector<NoticeBean> vlist = noticeMgr.getNoticeList();
						Vector<UserBean> userlist = userMgr.getRegisterList();	
						String notice_writer = "";
						int notice_seq;
						int counter = vlist.size();
						for(int i=0; i<vlist.size(); i++)
						{
							NoticeBean noticeBean = vlist.get(i);
							for(int j=0; j<userlist.size(); j++)
							{
								UserBean userBean = userlist.get(j);
								if(userBean.getUSER_SEQ() == noticeBean.getUSER_SEQ())
								{	
									notice_writer = userBean.getUSER_NAME();
									break;
								}
							}
							
					%>
					<tr style="height:60px; ">
						<td><%= noticeBean.getNOTICE_SEQ() %></td>
						<td><a href="notice_view.jsp?notice_seq=<%=noticeBean.getNOTICE_SEQ() %>&notice_writer=<%=notice_writer%>"><%= noticeBean.getNOTICE_TITLE() %></a></td>
						<td><%= notice_writer %></td>
						<td><%= noticeBean.getNOTICE_DATE() %></td>
					</tr>
					<% } %>
			<!-- <form name="postFrm" method="post" action="boardPost"
			enctype="multipart/form-data">
			<div class="table-wrapper">
				<table>
					<thead>
						<tr>
							<th>Name</th>
							<th>Description</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Item1</td>
							<td>Ante turpis integer aliquet porttitor.</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>Item2</td>
							<td>Vis ac commodo adipiscing arcu aliquet.</td>
							<td>19.99</td>
						</tr>
						<tr>
							<td>Item3</td>
							<td>Morbi faucibus arcu accumsan lorem.</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>Item4</td>
							<td>Vitae integer tempus condimentum.</td>
							<td>19.99</td>
						</tr>
						<tr>
							<td>Item5</td>
							<td>Ante turpis integer aliquet porttitor.</td>
							<td>29.99</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"></td>
							<td>100.00</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</form>-->
				</tbody>
			</table>
			<!--<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>  -->
		<div style="padding:30px;">
			<input type="button" value="Write" onClick="javascript:location.href='notice_write.jsp'">
		</div>
		
		</div>
	</div>
	</div>
</body>
</html>
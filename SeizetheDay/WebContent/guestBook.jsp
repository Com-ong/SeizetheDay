<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB 연결 위한 추가 부분 -->
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="guestMgr" class="JavaBeans.GuestMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<jsp:useBean id="exhibitionMgr" class="JavaBeans.ExhibitionMgrPool" />
<!-- #################################### -->
<!-- 로그인 상태 가져오기 -->
<%
	  request.setCharacterEncoding("EUC-KR");
	  //String user_id = (String)session.getAttribute("idKey");
	  UserBean currUser= (UserBean)session.getAttribute("currUser");
%>
<%
	UserBean writerBean = userMgr.findWithID(currUser.getUSER_ID());
	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq"));
	ExhibitionBean exhibitionBean = exhibitionMgr.findWithExhibitionSeq(exhibition_seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest Book</title>
<link rel="stylesheet" href="CSS/guestBook.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="visited_area1">
	<div class="visited_list">
		<div class="insert_visited_area">
		<% String action_url = "guestBook_insertDB.jsp?userid="+ writerBean.getUSER_ID() + "&exhibition_seq="+ exhibition_seq; %>
		<form method="post" action=<%= action_url %>> <!-- 추가 부분 -->
			<table id="visited_area2">
				<tr>
					<td><h1 id="visitedText">GuestBook</h1></td>
				</tr>
				<tr>
				<td><input type="button" id="back_btn" value="전시회로 돌아가기" 
				onClick="location.href='exhibition.jsp?exhibition_seq=<%=exhibition_seq%>&exhibition_background_seq=<%= exhibitionBean.getBACKGROUND_SEQ() %>'"></td>
				</tr>
				<tr>
					<td><h3 name="exhibition_name"><%= exhibitionBean.getEXHIBITION_NAME() %></h3></td>
				<tr>
					<td id="ment"><br>짧은 문구로 방명록을 남겨주세요.<br><br></td>
				</tr>
				<tr>
					<td>작성자 : <label id="userid" name="userid"><%= writerBean.getUSER_NAME() %></label></td>
				</tr>
				<tr>
					<td>
						<textarea class="visited_input" name="visited_input" rows="4" cols="70" required placeholder="여기에 짧은 문구를 작성하세요."></textarea>
					</td>
					<td><input type="submit" id="visited_store" value="저장"></td>
				</tr>
			</table>
		</form> <!-- 추가 부분 -->
		</div>
		
		<p>
		<% // 추가 부분
			Vector<GuestBean> vlist = guestMgr.getEachGuestList(exhibition_seq);
		%>총 방문자 수 : <%= vlist.size() %></p> <!-- 수정 부분 -->
		<table class="visited_lists" border=1>
			<thead>
				<tr>
					<th id="visited_writer">guest</th>
					<th id="visited_visited">guestBook</th>
					<th id="visited_date">Date</th>
					<!-- <th id="visited_change">수정</th> -->
					<th id="visited_delete"></th>
				</tr>
			</thead>
			<tbody>
				<!-- DB 연결 위한 추가 부분 -->
				<%
					/* Vector<GuestBean> vlist = guestMgr.getRegisterList(); */
							Vector<UserBean> userlist = userMgr.getRegisterList();	
							String board_writer = "";
							//int board_seq;
							int counter = vlist.size();
							for(int i=0; i<vlist.size(); i++)
							{
								GuestBean guestBean = vlist.get(i);
								for(int j=0; j<userlist.size(); j++)
								{
									UserBean userBean = userlist.get(j);
									if(userBean.getUSER_SEQ() == guestBean.getUSER_SEQ())
									{	
										board_writer = userBean.getUSER_NAME();
										break;
									}
								}
				%>
				<tr>
					<td class="visited_writer_input"><%= board_writer%></td>
					<td class="visited_visited_input"><%= guestBean.getBOARD_TEXT() %></td>
					<td class="visited_date_input"><%= guestBean.getBOARD_DATE() %></td>
					<%-- <td><input type="button" class="visited_change_btn" value="수정" name="visited_change_btn" onclick="location.href='guestBook_updateDB.jsp?board_seq=<%=guestBean.getBOARD_SEQ()%>'"></td> --%>
					<td>
						<input type="button" class="visited_delete_btn" value="삭제" name="visited_delete_btn" onclick="location.href='guestBook_deleteDB.jsp?board_seq=<%=guestBean.getBOARD_SEQ()%>&exhibition_seq=<%=exhibition_seq%>'">
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>
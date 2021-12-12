<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	UserBean currUser= (UserBean)session.getAttribute("currUser");
	  /* String user_id = (String)session.getAttribute("idKey"); */
	  //String USER_SEQ=(String)session.getAttribute("USER_SEQ_KEY");
	  //int USER_SEQ=(int)session.getAttribute("USER_SEQ_KEY");
%>
<!-- DB 연결 위한 추가 부분 -->
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="exhibitionMgr" class="JavaBeans.ExhibitionMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<jsp:useBean id="photoMgr" class="JavaBeans.PhotoMgrPool" />
<jsp:useBean id="backgroundMgr" class="JavaBeans.BackgroundMgrPool" />
<!-- #################################### -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/header.css">
<link rel="stylesheet" href="CSS/exhibition.css">
<script type="text/javascript" src="exhibition.js"></script>
<title>SHOW EXHIBITION</title>
<style>
#review_btn, #guestBook_btn {
	-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		-moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		background-color: white;
		border-radius: 0.375em;
		border: 0;
		box-shadow: inset 0 0 0 2px #2a2a55;
		color: #2a2a55 !important;
		cursor: pointer;
		display: inline-block;
		font-family: "Roboto Slab";
		font-size: 0.5em;
		font-weight: 700;
		height: 3.5em;
		width: 10.0em;
		letter-spacing: 0.075em;
		line-height: 1.5em;
		padding: 0 2.25em;
		text-align: center;
		text-decoration: none;
		text-transform: uppercase;
		white-space: nowrap;
}
#review_btn:hover,  #guestBook_btn:hover {
	background-color: rgba(245, 106, 106, 0.05);
}
#review_btn:active,  #guestBook_btn:active {
	background-color: rgba(245, 106, 106, 0.15);
}
#review_btn.icon:before,  #guestBook_btn:before {
	margin-right: 0.5em;
}
#review_btn.fit,  #guestBook_btn.fit {
	width: 100%;
}
#review_btn.small,  #guestBook_btn.small {
	font-size: 0.6em;
}
#review_btn.large,  #guestBook_btn.large {
	font-size: 1em;
	height: 3.65em;
	line-height: 3.65em;
}
#review_btn.primary,  #guestBook_btn.primary {
	background-color: #2a2a55;
	box-shadow: none;
	color: #ffffff !important;
}
#review_btn.primary:hover,  #guestBook_btn.primary:hover {
	background-color: #f67878;
}
#review_btn.primary:active,  #guestBook_btn.primary:active {
	background-color: #f45c5c;
}
#review_btn:disabled,  #guestBook_btn:disabled {
	pointer-events: none;
	opacity: 0.25;
}
</style>
<style>
#myEx_btn, #allEx_btn {
	-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		-moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		background-color: white;
		border-radius: 0.375em;
		border: 0;
		box-shadow: inset 0 0 0 2px #2a2a55;
		color: #2a2a55 !important;
		cursor: pointer;
		display: inline-block;
		font-family: "Roboto Slab";
		font-size: 0.5em;
		font-weight: 700;
		height: 3.5em;
		width: 20.0em;
		letter-spacing: 0.075em;
		line-height: 1.5em;
		padding: 0 2.25em;
		text-align: center;
		text-decoration: none;
		text-transform: uppercase;
		white-space: nowrap;
}
#myEx_btn:hover,  #allEx_btn:hover {
	background-color: rgba(245, 106, 106, 0.05);
}
#myEx_btn:active,  #allEx_btn:active {
	background-color: rgba(245, 106, 106, 0.15);
}
#myEx_btn.icon:before,  #allEx_btn:before {
	margin-right: 0.5em;
}
#myEx_btn.fit,  #allEx_btn.fit {
	width: 100%;
}
#myEx_btn.small,  #allEx_btn.small {
	font-size: 0.6em;
}
#myEx_btn.large,  #allEx_btn.large {
	font-size: 1em;
	height: 3.65em;
	line-height: 3.65em;
}
#myEx_btn.primary,  #allEx_btn.primary {
	background-color: #2a2a55;
	box-shadow: none;
	color: #ffffff !important;
}
#myEx_btn.primary:hover,  #allEx_btn.primary:hover {
	background-color: #f67878;
}
#myEx_btn.primary:active,  #allEx_btn.primary:active {
	background-color: #f45c5c;
}
#myEx_btn:disabled,  #allEx_btn:disabled {
	pointer-events: none;
	opacity: 0.25;
}
</style>
<script type="text/javascript">
function display_find_id(){
	var con = document.getElementById("info");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
	
}
</script>
	
</head>
<body>
<%
	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq"));
	int background_seq = Integer.parseInt(request.getParameter("exhibition_background_seq"));
	//int user_seq = 1; // 로그인한 사용자 번호
	ExhibitionBean exhibition = exhibitionMgr.findWithExhibitionSeq(exhibition_seq);
	
	Vector<PhotoBean> photoList = photoMgr.getPhotoListinEx(exhibition_seq);
	BackgroundBean bb = backgroundMgr.getBackground(background_seq);
	
	// 전시 썸네일 관련 추가
	String profile = exhibition.getEXHIBITION_PROFILE();
	/////////////////
	
%>
	<jsp:include page="header_exhibition.jsp"></jsp:include>
		
	<div class="show_content" style="background-color: <%=bb.getBACKGROUND_COLOR()%>;">
		
		<div class = "show-title"  style="margin: 0 auto; margin-bottom:2%; line-height:1.4em; border-radius: 10px; text-align:center; background-color:white;">
			<!-- EXHIBITION NAME --><%= exhibition.getEXHIBITION_NAME() %>
		</div>

		<div class="btns"  style="width:100%; height:100%; margin-bottom: 3%; text-align:center;">
			<div class="btns_1" style="float:left;">
				<input type="button" id="guestBook_btn" onClick="location.href='guestBook.jsp?exhibition_seq=<%= exhibition_seq%>'" value="방명록">
				<input type="button" id="review_btn" onClick="location.href='review.jsp?exhibition_seq=<%=exhibition_seq %>'" value="후기">
			</div>
			<div class="btns_2" style="float:right;">
				<input type="button" id="myEx_btn" onClick="location.href='myExhibition.jsp'" value="MY SHOW ROOM">
				<input type="button" id="allEx_btn" onClick="location.href='exhibition_list.jsp'" value="ALL SHOW">
			</div>
		</div>
		<div class="slideshow-container">

      <!-- Full-width images with number and caption text -->
      <%
      	int photo_count = exhibition.getPHOTO_SEQ();
      
      	// 전시 썸네일 관련 추가
      	photo_count++;
      	/////////////////
      	
      	for(int i=0; i<photo_count; i++)
      	{
      		PhotoBean pb = photoList.get(i);
      %>
      <div class="mySlides fade">
        <div class="numbertext"><%=i+1 %> / <%= photo_count %></div>
         <img src="FileStorage/<%= pb.getPHOTO_NAME() %>" style="width:100%" alt="<%= pb.getPHOTO_NAME() %>">
         <!-- 흰색 사진일 때 사진 설명 안보여서 배경색 추가 -->
         <div class="text" style="background-color:#333355;"><%= pb.getPHOTO_TEXT() %></div>
      </div>
      <% } %>

      <!-- Next and previous buttons -->
      <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
      <a class="next" onclick="moveSlides(1)">&#10095;</a>
    </div>
    <br/>

    <!-- The dots/circles -->
    <div style="text-align:center">
    <%for(int i=0; i<photo_count; i++) { %>
      <span class="dot" onclick="currentSlide(<%=i%>)"></span>
      <%} %>
    </div>
    
    <div style="margin-top:2%; margin-bottom:5%;">
    <input type="button" class="btn" id="allEx_btn" style="float:right; " value="INFO" onclick="display_find_id();">
    </div>
    <div id="info" style="background-color:white; display: none; border-radius:10px; padding:3%;">
					<b><h4>전시회 소개</h4></b><br>
					<p><%=exhibition.getEXHIBITION_TEXT() %></p>
				</div>
    </div>
</body>
</html>
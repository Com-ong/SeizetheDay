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
		<div class="btns">
			<a href="guestBook.jsp?exhibition_seq=<%= exhibition_seq%>">방명록</a>
			<a href="review.jsp?exhibition_seq=<%=exhibition_seq %>">후기</a>
		</div>
		<div class = "show-title"  style="margin: 0 auto; text-align:center;">
			<!-- EXHIBITION NAME --><%= exhibition.getEXHIBITION_NAME() %>
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
    </div>
</body>
</html>
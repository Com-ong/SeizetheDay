<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String user_id = (String)session.getAttribute("idKey");
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
<%@ include file="head.html" %>
<head>
<link rel="stylesheet" href="CSS/header.css">
<link rel="stylesheet" href="CSS/exhibition.css">
<script type="text/javascript" src="exhibition.js"></script>
</head>
<body>
<%
	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq"));
	int background_seq = Integer.parseInt(request.getParameter("exhibition_background_seq"));
	int user_seq = 1; // 로그인한 사용자 번호
	ExhibitionBean exhibition = exhibitionMgr.findWithExhibitionSeq(exhibition_seq);
	
	Vector<PhotoBean> photoList = photoMgr.getPhotoListinEx(exhibition_seq);
	BackgroundBean bb = backgroundMgr.getBackground(background_seq);
	
%>
	<jsp:include page="header_exhibition.jsp"></jsp:include>
	<div class="show_content" style="background-color: <%=bb.getBACKGROUND_COLOR()%>;">
		<div class="btns">
			<a href="guestBook.jsp?exhibition_seq=<%= exhibition_seq%>">방명록</a>
			<a href="review.jsp">후기</a>
		</div>
		<div class = "show-title"  style="margin: 0 auto; text-align:center;">
			<!-- EXHIBITION NAME --><%= exhibition.getEXHIBITION_NAME() %>
		</div>
		

		<div class="slideshow-container">

      <!-- Full-width images with number and caption text -->
      <%
      	int photo_count = exhibition.getPHOTO_SEQ();
      	for(int i=0; i<photo_count; i++)
      	{
      		PhotoBean pb = photoList.get(i);
      %>
      <div class="mySlides fade"<%--  style="background-color: <%=bb.getBACKGROUND_COLOR()%>" --%>>
        <div class="numbertext"><%=i+1 %> / <%= photo_count %></div>
         <img src="FileStorage/<%= pb.getPHOTO_NAME() %>" style="width:100%" alt="<%= pb.getPHOTO_NAME() %>">
        <!-- <img src="http://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425456/ltekybkstiyl7faumrsq/acne-studios-acne-studio-potsdamer-strasse.jpg" style="width:100%"> -->
        <div class="text"><%= pb.getPHOTO_TEXT() %></div>
      </div>
      <% } %>

      <!-- <div class="mySlides fade">
        <div class="numbertext">2 / 6</div>
        <img src="http://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425435/hwxwxqxfwo4htfgqksbu/acne-studios-acne-studio-potsdamer-strasse.jpg" style="width:100%">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">3 / 6</div>
        <img src="http://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425448/rnelglmoujifzlbzykxw/acne-studios-acne-studio-potsdamer-strasse.jpg" style="width:100%">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">4 / 6</div>
        <img src="http://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425434/coct9kmra7uhmeu4cxto/acne-studios-acne-studio-potsdamer-strasse.jpg" style="width:100%">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">5 / 6</div>
        <img src="http://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425440/xacfj7abitmifeyciiia/acne-studios-acne-studio-potsdamer-strasse.jpg" style="width:100%">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">6 / 6</div>
        <img src="http://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425434/cqxjhpdmepxto0nudsok/acne-studios-acne-studio-potsdamer-strasse.jpg" style="width:100%">
        <div class="text">ACNE STUDIO</div>
      </div> -->

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
      <!-- <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
      <span class="dot" onclick="currentSlide(4)"></span>
      <span class="dot" onclick="currentSlide(5)"></span> -->
    </div>
    </div>
</body>
</html>
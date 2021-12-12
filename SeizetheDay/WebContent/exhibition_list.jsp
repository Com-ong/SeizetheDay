<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "JavaBeans.UserBean"%>
<%@page import = "JavaBeans.PhotoBean"%>
<%@page import = "JavaBeans.ExhibitionBean"%>
<%@page import = "java.util.Vector"%>
<jsp:useBean id = "uMgr" class="JavaBeans.UserMgrPool"/>
<jsp:useBean id = "eMgr" class="JavaBeans.ExhibitionMgrPool"/>
<jsp:useBean id = "pMgr" class="JavaBeans.PhotoMgrPool"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>My Exhibition</title>
<link rel="stylesheet" href="CSS/create.css">
<style>
div.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  width: 180px;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: auto;
}

div.desc {
  padding: 15px;
  text-align: center;
}
</style>
</head>
<body>
   <jsp:include page = "header.jsp"></jsp:include>
<div class = "make-exhibition">
		<div class = "make-title">
			SHOW ALL EXHIBITION
		</div>
		<div class = "make-content">
<%
   request.setCharacterEncoding("EUC-KR");
   response.setContentType("text/html;charset=EUC-KR");

   UserBean currUser = (UserBean)session.getAttribute("currUser");
   Vector<ExhibitionBean> vlist = new Vector<ExhibitionBean>();
   vlist=eMgr.getExhibitionList();
   System.out.println("vlist size: " + vlist.size());
   // 전시회가  없을 때
   String message = "";
   if(vlist.size() == 0)
   {
	  message = "아직 등록된 전시회가 없습니다.";
%>
	<h4 style="text-align:center;"><%=message %></h4>
<%
   }
  
   for(int i=0;i<vlist.size();i++){
	   int exhibition_seq = vlist.elementAt(i).getEXHIBITION_SEQ();
	   int background_seq = vlist.elementAt(i).getBACKGROUND_SEQ();
	   System.out.println("seq: " + vlist.size() +" : " + exhibition_seq+" ,"+background_seq);
	   System.out.println(" test : " +pMgr.getPhotoListinEx(exhibition_seq).get(0).getPHOTO_NAME());
%>
      <div class = "gallery">
      	<a target="_blank" href="exhibition.jsp?exhibition_seq=<%=exhibition_seq%>&exhibition_background_seq=<%=background_seq%>">
      	<img src="FileStorage/<%=pMgr.getPhotoListinEx(exhibition_seq).elementAt(0).getPHOTO_NAME() %>" alt="<%=vlist.elementAt(i).getEXHIBITION_NAME() %>" width="600" height="400">
      	</a>
      	<div class="desc"><%=vlist.elementAt(i).getEXHIBITION_NAME()%></div>
      </div>
<%
   }
%>
</div>
</div>
</body>
</html>
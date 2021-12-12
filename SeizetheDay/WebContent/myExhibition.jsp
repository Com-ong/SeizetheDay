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
<style>
#delete_btn {
	-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		-moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		background-color: transparent;
		border-radius: 0.375em;
		border: 0;
		box-shadow: inset 0 0 0 2px #2a2a55;
		color: #2a2a55 !important;
		cursor: pointer;
		display: inline-block;
		font-family: "Roboto Slab";
		font-size: 0.5em;
		font-weight: 700;
		height: 2.5em;
		letter-spacing: 0.075em;
		line-height: 1.5em;
		padding: 0 2.25em;
		text-align: center;
		text-decoration: none;
		text-transform: uppercase;
		white-space: nowrap;
}
#delete_btn:hover {
	background-color: rgba(245, 106, 106, 0.05);
}
#delete_btn:active {
	background-color: rgba(245, 106, 106, 0.15);
}
#delete_btn.icon:before {
	margin-right: 0.5em;
}
#delete_btn.fit {
			width: 100%;
		}
		#delete_btn.small {
			font-size: 0.6em;
		}
			#delete_btn.large {
			font-size: 1em;
			height: 3.65em;
			line-height: 3.65em;
		}
		#delete_btn.primary {
			background-color: #2a2a55;
			box-shadow: none;
			color: #ffffff !important;
		}
		#delete_btn.primary:hover {
				background-color: #f67878;
			}
		#delete_btn.primary:active {
				background-color: #f45c5c;
			}
			#delete_btn:disabled {
			pointer-events: none;
			opacity: 0.25;
		}
</style>

<script>
	function deleted(exhibition_seq, background_seq) {
		//confirm(exhibition_seq);
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인

			// document.form.submit();
			location.href="delete_exhibition.jsp?exhibition_seq="+exhibition_seq+"&background_seq="+background_seq;

		 }else{
		     return false;
		 }
	}
</script>
</head>
<body>
   <jsp:include page = "header.jsp"></jsp:include>
<div class = "make-exhibition">
		<div class = "make-title">
			SHOW MY EXHIBITION
		</div>
		<div class = "make-content">
<%
   request.setCharacterEncoding("EUC-KR");
   response.setContentType("text/html;charset=EUC-KR");

   UserBean currUser = (UserBean)session.getAttribute("currUser");
   Vector<ExhibitionBean> vlist = new Vector<ExhibitionBean>();
   vlist=eMgr.getMyExhibitionList(currUser.getUSER_SEQ());
   
   // 전시회가  없을 때
   String message = "";
   System.out.println("vlist size " + vlist.size());
   if(vlist.size() == 0)
   {
	  message = "아직 등록된 전시회가 없습니다.";
%>
<h4 style="text-align:center;"><%=message %></h4>
<%
   }
   else {
   for(int i=0;i<vlist.size();i++){
	   int exhibition_seq = vlist.elementAt(i).getEXHIBITION_SEQ();
	   int background_seq = vlist.elementAt(i).getBACKGROUND_SEQ();
%>
      <div class = "gallery">
      	<a target="_blank" href="exhibition.jsp?exhibition_seq=<%=exhibition_seq%>&exhibition_background_seq=<%=background_seq%>">
      		<img src="FileStorage/<%=pMgr.getPhotoListinEx(exhibition_seq).elementAt(0).getPHOTO_NAME() %>" alt="<%=vlist.elementAt(i).getEXHIBITION_NAME() %>" width="600" height="400">
      	</a>
      	<div class="desc"><%=vlist.elementAt(i).getEXHIBITION_NAME()%></div>
      	<div align="center"><input type="button" id="delete_btn" value="DELETE" style="width:90%;" onClick="deleted(<%=exhibition_seq%>, <%=background_seq%>)"></div>
      </div>
<%
   }
   }
%>
</div>
</div>
</body>
</html>
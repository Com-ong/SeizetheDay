<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" class="JavaBeans.InquiryBean"/>
<jsp:useBean id="mgr" class="JavaBeans.InquiryMgrPool"/>
<!DOCTYPE html>
<jsp:setProperty property="*" name="bean"/>
<%
		System.out.println(bean.getUSER_SEQ());
		boolean result = mgr.insertInquiry(bean);
		String msg = "다시 작성하여 문의해주세요.";
		String location = "Inquiry.jsp";
		if(result){
			msg = "1:1문의가 접수되었습니다.";
			location = "index.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>

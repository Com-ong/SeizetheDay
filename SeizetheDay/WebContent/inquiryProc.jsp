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
		String msg = "�ٽ� �ۼ��Ͽ� �������ּ���.";
		String location = "Inquiry.jsp";
		if(result){
			msg = "1:1���ǰ� �����Ǿ����ϴ�.";
			location = "index.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>

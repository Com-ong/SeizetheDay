<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" class="JavaBeans.NoticeBean"/>
<jsp:useBean id="mgr" class="JavaBeans.NoticeMgrPool"/>
<!DOCTYPE html>
<jsp:setProperty property="*" name="bean"/>
<%
		System.out.println(bean.getUSER_SEQ());
		boolean result = mgr.insertNotice(bean);
		String msg = "�ۼ� ����";
		String location = "notice.jsp";
		if(result){
			msg = "�ۼ� ����";
			location = "notice.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>

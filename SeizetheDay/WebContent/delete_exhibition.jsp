<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="JavaBeans.*, java.util.*" %>
<jsp:useBean id = "uMgr" class="JavaBeans.UserMgrPool"/>
<jsp:useBean id = "eMgr" class="JavaBeans.ExhibitionMgrPool"/>
<jsp:useBean id = "pMgr" class="JavaBeans.PhotoMgrPool"/>
<jsp:useBean id = "bMgr" class="JavaBeans.BackgroundMgrPool" />
<jsp:useBean id = "rMgr" class="JavaBeans.ReviewMgrPool" />
<jsp:useBean id = "gMgr" class="JavaBeans.GuestMgrPool" />
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setContentType("text/html;charset=EUC-KR");
	
	UserBean currUser = (UserBean)session.getAttribute("currUser");
	
	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq"));
	int background_seq = Integer.parseInt(request.getParameter("background_seq"));
	Vector<PhotoBean> plist = pMgr.getPhotoListinEx(exhibition_seq);
	Vector<ReviewBean> rlist = rMgr.getEachReviewList(exhibition_seq);
	Vector<GuestBean> glist = gMgr.getEachGuestList(exhibition_seq);
	ExhibitionBean exhibition_bean = eMgr.findWithExhibitionSeq(exhibition_seq);
	
	int background_seq_delete=exhibition_bean.getBACKGROUND_SEQ();
	for(int i=0; i<plist.size(); i++)
	{
		int photo_seq_delete=plist.get(i).getPHOTO_SEQ();
		pMgr.deletePhoto(photo_seq_delete);
	}
	for(int i=0; i<rlist.size(); i++)
	{
		int review_seq_delete=rlist.get(i).getCommentSeq();
		rMgr.deleteReview(review_seq_delete);
	}
	for(int i=0;i<glist.size(); i++)
	{
		int guest_seq_delete=glist.get(i).getBOARD_SEQ();
		gMgr.deleteGuest(guest_seq_delete);
	}
	eMgr.deleteExhibition(exhibition_seq);
	bMgr.deleteBackground(background_seq_delete);
%>
<script>
	alert("삭제되었습니다.");
	location.href="myExhibition.jsp";
</script>
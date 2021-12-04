<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="CSS/header.css">
<!-- 로그인 상태 가져오기 -->
<%
	  request.setCharacterEncoding("UTF-8");
	  String user_id = (String)session.getAttribute("idKey");
%>
 <style>
	
/*아래부터는 modal css  */
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 9999; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
   background-color: #fefefe;
   margin: 15% auto; /* 15% from the top and centered */
   padding: 20px;
   border: 1px solid #888;
   width: 50%; /* Could be more or less, depending on screen size */
   z-index: 10004;
   /*추가*/ height:55%;
   border-radius:3%;
}
/* The Close Button */
.close {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}
.close:hover, .close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}
/* #dragandrophandler{
    border:2px dotted #0B85A1;
    width:400px;
    color:#92AAB0;
    text-align:left;vertical-align:middle;
    padding:10px 10px 10 10px;
    margin-bottom:10px;
    font-size:200%;
} */
	</style>
	
<style> /* sidebar style*/
/* Fixed sidenav, full height */
.sidenav {
  	height: 100%;
  	width: 0;
  	position: fixed;
 	z-index: 9999;
 	top: 0;
 	left: 0;
 	background-color: white;
 	overflow-x: hidden;
  	padding-top: 60px;
	transition: 0.3s;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
 	font-size: 0.8em;
	color: #333355;
	display: block;
	border: none;
	background: none;
 	width:100%;
 	text-align: left;
 	cursor: pointer;
	outline: none;
	transition: 0.3s;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
	color: #a3a3a3;
}

.sidenav .closebtn {
	position: absolute;
	top: 1%;
	/* right: 25px; */
	font-size: 20px;
	margin-left: 70%;
	float: right;
	color: #333355;
}

/* .sidenav .openbtn {
	position: absolute;
	top: 1%; */
	/* right: 25px; */
/* 	font-size: 20px;
	float: left;
	color: white;
} */

/* Main content */
.main {
	margin-left: 200px; /* Same as the width of the sidenav */
	font-size: 20px; /* Increased text to enable scrolling */
	padding: 20px;
	transition: margin-left .5s;
}

/* Add an active class to the active dropdown button */
.active {
	background-color: white;
	color: #333355;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
	background-color: /* #6767a3 */white;
	padding-left: 8px;
	color: white;
}

/* Optional: Style the caret down icon */
.drop-down {
	float: right;
	padding-right: 8%;
}

@media screen and (max-height: 450px) {
	.sidenav {padding-top: 15px;}
	.sidenav a {font-size: 18px;}
}
</style>
<script> /*sidebar function*/
/* Set the width of the side navigation to 250px */
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>

<div class="head1">
	<!-- side menu 수정 -->
	<div class="sidenav" id="mySidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&#9776;</a>
		<a href="index.jsp">HOMEPAGE</a>
		<a href="notice.jsp">NOTICE</a>
		<button class="dropdown-btn">EXHIBITION
			<i class="drop-down"></i>
		</button>
		<div class="dropdown-container">
			<% if(user_id!=null) { %>
			<a href="create.jsp">CREATE</a>
			<% } else { %>
			<a onClick="loginAlert();">CREATE</a>
			<% } %>
			<% if(user_id!=null) { %>
			<a href="#">LIST</a>
			<% } else { %>
			<a onClick="loginAlert();">LIST</a>
			<% } %>
			<% if(user_id!=null) { %>
			<a href="guestBook.jsp">GUESTBOOK</a>
			<% } else { %>
			<a onClick="loginAlert();">GUESTBOOK</a>
			<% } %>
		</div>
		<button class="dropdown-btn">EXHIBITION CATEGORY
			<i class="drop-down"></i>
		</button>
		<div class="dropdown-container">
			<a href="#">IT</a>
			<a href="#">ART</a>
			<a href="#">SCIENCE</a>
			<a href="#">MODERN</a>
			<a href="#">GEOMETRIC</a>
		</div>
		<a href="trend.jsp">TREND</a>
		<% if(user_id!=null) { %>
  		<a href="#contact">1:1 INQUIRY</a>
  		<% } else { %>
  		<a onClick="loginAlert();">1:1 INQUIRY</a>
  		<% } %>
  		<% if(user_id!=null) { %>
  		<a href="myPage.jsp">MYPAGE</a>
  		<% } else { %>
  		<a onClick="loginAlert();">MYPAGE</a>
  		<% } %>
	</div>
	<!-- Use any element to open the sidenav -->
	<span class="user-button" onclick="openNav()" style="background-color: white;
	margin-top: 3%;	margin-left: 6%;	padding : 0.5%;	width: 2%;	
	text-align: center;	border-radius: 5px;	display:inline-block;">&#9776;</span>
	
	<!-- <div class="left-side-bar">
        <div class="status-ico">
            <span>≡</span>
            <span>≡</span>
        </div>
        <ul>
            <li><a href="notice.jsp">공지사항</a></li>
            <li><a href="#">전시회 보기</a></li>
            <li><a href="#">1:1 문의</a></li>
            <li><a href="#">마이페이지</a></li>
        </ul>
    </div> -->

	<!-- 수정한 부분 - 로그인 여부에 따라 login/logout 버튼 표시 -->
	<div class="user-section" style="text-align:right; margin-right: 5%;">
	<%if (user_id != null) {%>
			<p style="display: inline; color: white; font-size:0.7em;"><b><%=user_id%></b>님</p>
			<a class="user-button" href="#" class="user-button" style="width: 20%; font-size:0.7em;">My</a>					
			<a class="user-button" onclick="location.href='logout.jsp'" style="width: 20%; font-size:0.7em;">LogOut</a>
	<%} else {%>
	
			<!-- <li><a href="#" class="button big">My</a></li> -->
    		<!--<li><a href="#" class="button primary">LogIn</a></li>  -->
    		<a class="btn" style="width: 20%; font-size:0.7em;">LogIn</a>
	<%} %>
            <div class="modal">
               <!-- 첫 번째 Modal의 내용 -->
               <div class="modal-content">
                  <!--<span class="close">&times;</span>  -->
                  <div>
                  	<form name="loginForm" method="post" action="loginProc.jsp">
                  		<span class="close">×</span>
                  		<!-- <input type="text" name="USER_ID" id="id" value=""
							placeholder="ID">
                  		<br><input type="password" name="USER_PW" id="password" value=""
							placeholder="Password"> -->
                  	</form>
                  </div>
                  <!-- <div style="magin:0 auto; padding-top:20px">
    				<button value="LOGIN" class="button primary" style="width:100%;" onclick="loginCheck();">LogIn</button>
                  </div>
                  <div style="text-align:center; padding:20px;">
                  <a href="forgot.jsp" style="padding-right:40px; padding-left:40px;">FORGOT?</a>
                  			<td>/</td>
                  <a href="join.jsp" style="padding-right:40px; padding-left:40px;">SIGN UP</a>
                  </div> -->
               </div>
            </div>
		<!-- 기존 버튼 -->
		<!--<a href="login.jsp" class="user-button">MY</a>
	  	<a href="join.jsp" class="user-button">LOGOUT</a> -->
	</div>
</div>
<div class="head2">
	<a href="index.jsp" class="title-button"><span class = "title-section">SeizetheDay</span></a>
</div>
<hr>
<!-- 로그인 -->
<script type="text/javascript">
	function loginCheck() {
		if (document.loginForm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginForm.id.focus();
			return;
		}
		if (document.loginForm.password.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginForm.password.focus();
			return;
		}
		document.loginForm.submit();
	}
</script>
<script>
   // Modal을 가져옵니다.
   var modals = document.getElementsByClassName("modal");
   // Modal을 띄우는 클래스 이름을 가져옵니다.
   var btns = document.getElementsByClassName("btn");
   // Modal을 닫는 close 클래스를 가져옵니다.
   var spanes = document.getElementsByClassName("close");
   var funcs = [];
    
   // Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
   function Modal(num) {
     return function() {
       // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
       btns[num].onclick =  function() {
           modals[num].style.display = "block";
           console.log(num);
           $('body').css("overflow", "hidden");
       };
    
       // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
       spanes[num].onclick = function() {
           modals[num].style.display = "none";
           $('body').css("overflow", "scroll");
       };
     };
   }
    
   // 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
   for(var i = 0; i < btns.length; i++) {
     funcs[i] = Modal(i);
   }
    
   // 원하는 Modal 수만큼 funcs 함수를 호출합니다.
   for(var j = 0; j < btns.length; j++) {
     funcs[j]();
   }
    
   // Modal 영역 밖을 클릭하면 Modal을 닫습니다.
   window.onclick = function(event) {
     if (event.target.className == "modal") {
         event.target.style.display = "none";
         $('body').css("overflow", "scroll");
     }
   };
</script>

<script> /*drop down menu*/
//* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
    dropdownContent.style.display = "none";
  } else {
    dropdownContent.style.display = "block";
  }
});
}
</script>
<script>
   function loginAlert() {
	   alert("로그인이 필요한 서비스입니다.");
	   return;
   }
</script>
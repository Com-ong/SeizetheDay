<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="JavaBeans.UserBean" %>
<%
	  request.setCharacterEncoding("EUC-KR");
	  UserBean currUser = (UserBean)session.getAttribute("currUser");
	  System.out.println(currUser);
%>
<!DOCTYPE HTML>
<!--
	Editorial by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->

<html>
	<head>
	<style>
	
/*아래부터는 modal css  */
ul{
   list-style: none;
   margin: none;
}
a{
   border-bottom: none;
}
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
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
#dragandrophandler{
    border:2px dotted #0B85A1;
    width:400px;
    color:#92AAB0;
    text-align:left;vertical-align:middle;
    padding:10px 10px 10 10px;
    margin-bottom:10px;
    font-size:200%;
}
	</style>
		<style>
		h1{text-align:center;}
		
		.ul_main{list-style: none;}
		
		*{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:500px;overflow:hidden;}
    .slide ul{width:calc(100% * 4);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 4);height:500px; background-size: cover;} /*background-size: cover 추가 , 이미지 사이즈 자동 조절*/
    /*.slide li:nth-child(1){background-image:url(main_images/pic01.jpg);}*/
    .slide li:nth-child(1){background-image:url(main_images/main01.png);}
    .slide li:nth-child(2){background-image:url(main_images/main02.png);}
    .slide li:nth-child(3){background-image:url(main_images/main03.png);}
    .slide li:nth-child(4){background-image:url(main_images/main04.png);}
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
      
		</style>
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="main_assets/css/main.css" />
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<!-- Header -->
								<header id="header">
								<ul class="ul_main">
								<li><a href="index.jsp"><h1>SeizeTheDay</h1></a></li>
									
									<li>
									<%if (currUser != null) {%>
									<ul class="icons">
									<li><b><%=currUser.getUSER_NAME()%></b>님 </li>
									<li><a href="myPage.jsp" class="button big">My</a></li>									
									<li><button onclick="location.href='logout.jsp'">LogOut</button></li>
									</ul>
									<%} else {%>
									<ul class="icons">
										<!-- <li><a href="myPage.jsp" class="button big">My</a></li> -->
    									<!--<li><a href="#" class="button primary">LogIn</a></li>  -->
    									<li><button class="btn">LogIn</button></li>
									</ul>
									<%} %>
									<!-- 첫 번째 Modal -->
            <div class="modal">
               <!-- 첫 번째 Modal의 내용 -->
               <div class="modal-content">
                  <!--<span class="close">&times;</span>  -->
                  <div>
                  	<form name="loginForm" method="post" action="loginProc.jsp">
                  		<span class="close">×</span>
                  		<input type="text" name="USER_ID" id="id" value=""
							placeholder="ID">
                  		<br><input type="password" name="USER_PW" id="password" value=""
							placeholder="Password">
                  	</form>
                  </div>
                  <div style="magin:0 auto; padding-top:20px">
    				<button value="LOGIN" class="button primary" style="width:100%;" onclick="loginCheck();">LogIn</button>
                  </div>
                  <div style="text-align:center; padding:20px;">
                  <a href="forgot.jsp" style="padding-right:40px; padding-left:40px;">FORGOT?</a>
                  			<td>/</td>
                  <a href="join.jsp" style="padding-right:40px; padding-left:40px;">SIGN UP</a>
                  </div>
               </div>
            </div>
									
									</li>
								</ul>
								</header>
							<!-- Banner -->
								<section id="banner">
									<div class="slide" style="width:100%; margin:0 auto;"> <!-- 추가 적용 -->
											
   										 <ul style="padding-left:0em"> <!-- main.css에서 ul padding-left:1em 때문에 끝이 남아서 1순위 적용  -->
      									<!--<li><a href="www.google.com"><img src="main_images_pic01.jpg"/></a></li>  -->
      									<li onclick="location.href='trend.jsp'"></li>
      									<li></li>
      									<% if(currUser != null) { %>
										<li onClick="location.href='myPage.jsp'"></li>
										<% } else { %>
										<li onClick="loginAlert()"></li>
										<% } %>
      									<li></li>
    									</ul>
  									</div>
  									</section>
							<!-- Section -->
								<section>
									<div style="text-align:center; height:100px;">
										<button style="width:48%;height:100%;" onClick="location.href='trend.jsp'">Trend</button>
										<% if(currUser != null) { %>
										<button style="width:48%;height:100%;" onClick="location.href='myPage.jsp'">My show Room</button>
										<% } else { %>
										<button onClick="loginAlert();" style="width:48%;height:100%;">My show Room</button>
										<% } %>
									</div>
									
								</section>
						</div>
					</div>
				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">
							<!-- Search -->
								<!--<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>  -->
							<!-- Menu -->
                        <nav id="menu">
                           <header class="major">
                              <h2>Menu</h2>
                           </header>
                           <ul>
                              <li><a href="index.jsp">Homepage</a></li>
                              <li><a href="notice.jsp">Notice</a></li>
                              <li>
                              	<span class="opener">Exhibition</span>
                              	<ul>
                              	<% if(currUser!=null) { %>
                              		<li><a href="create.jsp">Create</a></li>
                              		<% } else { %>
                              		<li><a onClick="loginAlert();">Create</a></li>
                              		<%} %>
                              		<% if(currUser!=null) { %>
                              		<li><a href="#">List</a></li>
                              		<% } else { %>
                              		<li><a onClick="loginAlert()">List</a></li>
                              		<% } %>
                              		<%-- <% if(currUser!=null) { %>
                              		<li><a href="guestBook.jsp">GuestBook</a>
                              		<% } else { %>
                              		<li><a onClick="loginAlert()">GuestBook</a>
                              		<% } %> --%>
                              	</ul>
                              	<!-- <a href="#">Exhibition</a> -->
                              </li>
                              <!-- <li>
                                 <span class="opener">Exhibition Category</span>
                                 <ul>
                              	    <li><a href="#">IT</a></li>
                                    <li><a href="#">Art</a></li>
                                    <li><a href="#">Science</a></li>
                                    <li><a href="#">Modern</a></li>
                                    <li><a href="#">Geometric</a></li>
                                 </ul>
                              </li> -->
                              <li><a href="trend.jsp">Trend</a></li>
                              <% if(currUser!=null) { %>
                              <li><a href="#">1:1 Inquiry</a></li>
                              <% } else { %>
                               <li><a onClick="loginAlert();")>1:1 Inquiry</a></li>
                               <% } %>
                               <% if(currUser!=null) { %>
                              <li><a href="myPage.jsp">MyPage</a></li>
                              <% } else { %>
                              <li><a onClick="loginAlert();">MyPage</a></li>
                              <% } %>
                           </ul>
                        </nav>
						</div>
					</div>
			</div>
		<!-- Scripts -->
			<script src="main_assets/js/jquery.min.js"></script>
			<script src="main_assets/js/browser.min.js"></script>
			<script src="main_assets/js/breakpoints.min.js"></script>
			<script src="main_assets/js/util.js"></script>
			<script src="main_assets/js/main.js"></script>

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
   <script>
   function loginAlert() {
	   alert("로그인이 필요한 서비스입니다.");
	   return;
   }
   </script>
	</body>
</html>
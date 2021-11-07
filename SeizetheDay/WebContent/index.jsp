<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   /*추가*/ height:50%;
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
    .slide li:nth-child(1){background:#2a2a55;}
    .slide li:nth-child(2){background:#faa;}
    .slide li:nth-child(3){background:#afa;}
    .slide li:nth-child(4){background:#aaf;}
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
									<ul class="icons">
										<li><a href="#" class="button big">My</a></li>
    									<!--<li><a href="#" class="button primary">LogIn</a></li>  -->
    									<li><button class="btn">LogIn</button></li>
									</ul>
									<!-- 첫 번째 Modal -->
            <div class="modal">
               <!-- 첫 번째 Modal의 내용 -->
               <div class="modal-content">
                  <!--<span class="close">&times;</span>  -->
                  <div>
                  <span class="close">×</span>
                  <input type="text" value="ID">
                  <br><input type="text" value="PASSWORD">
                  </div>
                  <div style="magin:0 auto; padding-top:20px">
    				<button value="LOGIN" class="button primary" style="width:100%;"">LogIn</button>
                  </div>
                  <div style="text-align:center; padding:20px;">
                  <a href="#" style="padding-right:40px; padding-left:40px;">FORGOT?</a>
                  			<td>/</td>
                  <a href="join.jsp" style="padding-right:40px; padding-left:40px;">SIGN UP</a>
                  </div>
               </div>
            </div>
									<div><input type="text" name="query" id="query" placeholder="Search" /></div>
									</li>
								</ul>
								</header>
							<!-- Banner -->
								<section id="banner">
									<div class="slide" style="width:100%; margin:0 auto;"> <!-- 추가 적용 -->
											
   										 <ul style="padding-left:0em"> <!-- main.css에서 ul padding-left:1em 때문에 끝이 남아서 1순위 적용  -->
      									<!--<li><a href="www.google.com"><img src="main_images_pic01.jpg"/></a></li>  -->
      									<li></li>
      									<li></li>
      									<li></li>
      									<li></li>
    									</ul>
  									</div>
  									</section>
							<!-- Section -->
								<section>
									<div style="text-align:center; height:100px;">
										<button style="width:48%;height:100%;">Trend</button>
										<button style="width:48%;height:100%;">My show Room</button>
									</div>
									
								</section>
							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ipsum sed dolor</h2>
									</header>
									<div class="posts">
										<article>
											<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
											<h3>Interdum aenean</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
											<h3>Nulla amet dolore</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
											<h3>Tempus ullamcorper</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a>
											<h3>Sed etiam facilis</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
											<h3>Feugiat lorem aenean</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>
											<h3>Amet varius aliquam</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
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
										<li><a href="index.html">Homepage</a></li>
										<li><a href="generic.html">Generic</a></li>
										<li><a href="elements.html">Elements</a></li>
										<li>
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul>
								</nav>
							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section>
							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
										<li class="icon solid fa-phone">(000) 000-0000</li>
										<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>
							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved.</p>
								</footer>
						</div>
					</div>
			</div>
		<!-- Scripts -->
			<script src="main_assets/js/jquery.min.js"></script>
			<script src="main_assets/js/browser.min.js"></script>
			<script src="main_assets/js/breakpoints.min.js"></script>
			<script src="main_assets/js/util.js"></script>
			<script src="main_assets/js/main.js"></script>
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
	</body>
</html>
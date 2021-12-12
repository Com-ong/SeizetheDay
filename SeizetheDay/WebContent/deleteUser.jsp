<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-latest.js"></script> 
 
<html>
<head>
    <title>탈퇴</title>
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
        
        .modal-content h1 {
        	text-align : center;
        }
        
        .modal-content #dntgo {
        	color : #BFBFBF;
        	margin-left : 7%;
        }
 
        
        .modal-content #delete_pw {
        	margin-left: auto; 
            margin-right: auto;
            margin-top : 5%;
        	border-radius : 4%;
        	height : 5%;
        	width : 90%;
        	font-size : 50px;
        }
        
        .modal-content .deleteBtnGroup {
        	margin-top : 5%;
        }
        
        .modal-content .deleteBtnGroup #deleteBtn1 {
			background-color : white;
			border : 3px solid #333344;
			border-radius : 10%;
			width : 30%;
			height : 5%;
		}
		
		.modal-content .deleteBtnGroup #deleteBtn2 {
			background-color : #333344;
			color : white;
			margin-left : 5%;
			border-radius : 10%;
			width : 30%;
			height : 5%;
		}
        
</style>
 
 </head>
<body>
 
    <!-- The Modal -->
    <form name="deleteform" method="post" action="deleteUserProc.jsp" onsubmit="return checkValue()">
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
      
      <span><h1>정말 탈퇴하실건가요?</h1></span>
      <span id="dntgo">본인 확인을 위해 비밀번호를 한 번 더 입력해주세요.</span>
 	  <input type="password" id="delete_pw" name = "delete_pw" maxlength="50">

            <div class = deleteBtnGroup style="cursor:pointer; text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
             	<input id = "deleteBtn1" type="button" value="취소" onclick="location.href='myPage.jsp'">
        		<input id = "deleteBtn2" type="submit" value="탈퇴"/> 
            </div>
           
      </div>
    </div>
    </form>
        <!--End Modal-->
 
 </body>
 
    <script type="text/javascript">
      
        jQuery(document).ready(function() {
                $('#myModal').show();
        });
        //팝업 Close 기능
        function close_pop(flag) {
             $('#myModal').hide();
        };
        
      </script>
      </html>
      
      
     
      
/*
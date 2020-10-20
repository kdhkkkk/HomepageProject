<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import="java.util.*"%>

<%Long userid = (Long)(application.getAttribute("userid")); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>익명 채팅방</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../CSS/default.css">
  <link rel="stylesheet" href="../CSS/chatting-ui.css">
  <link rel="stylesheet" href="../CSS/structure-web.css">
  <link rel="stylesheet" href="../CSS/moble-ui.css">




</head>
<body>
 <div class="chatting-page">
    <!-- header -->
    <header class="header">
      <h1 class="web-title"><a href="../Main/First-web.jsp"  style="text-decoration:none; color: dodgerblue;">MOBLE</a></h1>
      <form action="" class="search-form">
        <input type="search" class="search">
        <input type="submit" class="submit" value="검색">
      </form>
      <ul class="account-list">
        <li class="account-item"><a href="#"></a></li>
        <li class="account-item"><a href="#"></a></li>
      </ul>
    </header>
    <!-- menu -->
    <ul class="menu-list">
      <li class="menu-item">
        <a href="../StudyBoard/StudyBoard.jsp" class="menu-link">학습게시판</a>
      </li>
      <li class="menu-item">
        <a href="../FreeBoard/FreeBorad.jsp" class="menu-link">자유게시판</a>
      </li>
 
      <li class="menu-item">
        <a href="#" class="menu-link" id="sowon-link">소원수리함</a>
      </li>
           <li class="menu-item">
        <a href="#" class="menu-link">모블채팅방</a>
            <ul class = "submenu">
        	<li class="submenu-list" ><a href = "../Chat/User_chat.jsp" class = "submenu-item"> 실명 채팅방&emsp;&emsp;&emsp;&emsp;</a></li>
        	<li class="submenu-list" ><a href = "../Chat/Ann_chat.jsp" class = "submenu-item"> 익명 채팅방</a></li>
        </ul>
      </li>
    </ul>



	<div class="chatting-container">
		<div class="chatting-box">

		<textarea id="messageTextArea" class="chatting-textarea" readOnly disabled></textarea>
	
<div class="chatting-input-container">
         <input id = "user" type="hidden" value="익명" class="chatting-content" readonly>
         <input id = "textMessage" type="text" onkeyup="enterkey();" class="chatting-content">
          <input onclick="sendMessage()" type="button" class="chatting-submit" value="전송">
          <input  onclick="disconnect()" type="button" class="chatting-exit" value="나가기">
</div>
</div>
	</div>
	<footer class="chatting-footer">문의 번호 : 010-1234-1234 문의 메일 : mobel@gmail.com</footer>
</div>


	<script type="text/javascript">
	
	// 「test」는 프로젝트 명
		// 「socket2」는 endpoint 명
		// WebSocket 오브젝트 생성 
		var webSocket = new WebSocket(
				"ws://192.168.0.37:2871/test/socket2");
		// 콘솔 텍스트 에리어 오브젝트 ID로부터 요소를 가져옴
		var messageTextArea = document.getElementById("messageTextArea");
		// WebSocket 서버와 접속이 되면 호출되는 함수
		webSocket.onopen = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "익명 채팅방에 접속하셨습니다.\n";
			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
			message.value = "";
			
		};
		// WebSocket 서버와 접속이 끊기면 호출되는 함수
		webSocket.onclose = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "익명 채팅방 연결이 끊어졌습니다.\n";
			
		};
		// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
		webSocket.onerror = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "연결오류\n";
		};
		/// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
		webSocket.onmessage = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += message.data + "\n";
		};
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
			// 유저명 텍스트 박스 오브젝트를 취득
			var user = document.getElementById("user");
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
			var message = document.getElementById("textMessage");
			// 콘솔 텍스트에 메시지를 출력한다.		
			messageTextArea.value += user.value + " (me) : " + message.value
					+ "\n";
			// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
			webSocket.send("{{" + user.value + "}}" + message.value);
			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
			message.value = "";
			
		}
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			// WebSocket 접속 해제
			webSocket.close();
		}

		function enterkey() {
			if (window.event.keyCode == 13) {
				sendMessage();
			}
		}

    //스크롤바 자동으로 내려가는 함수 근데 다시못올림
		window.setInterval(function() {
			var elem = document.getElementById('messageTextArea');
			elem.scrollTop = elem.scrollHeight;
		}, 0);
		
    
	</script>
	
	  <script type="text/javascript">
	//999999 = 관리자 / 나머지 = 학생
	//관리자,일반학생 아이디 구분하여 링크걸기
	var user_ID=<%=userid%>;
	var sowon_link = document.querySelector('#sowon-link');

	sowon_link.addEventListener('click', function() {
		if(user_ID==999999){
	  		sowon_link.setAttribute('href',"../WishBoard/WishBoard.jsp");
	  		console.log(sowon_link.href);
	  		
	  	}
	  	else{
	  		sowon_link.setAttribute('href',"../WishBoard/WriteWishBoard.jsp");
	  	
	  	}
	});

  </script>
</body>
</html>



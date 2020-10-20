<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

Long userid = (Long)(application.getAttribute("userid"));


%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="../CSS/moble-ui.css">
  <!-- <link rel="stylesheet" href="rain-animation.css"> -->
  <link rel="stylesheet" href="../CSS/default.css">
  <link rel="stylesheet" href="../CSS/structure-web.css">
  
  
</head>

<body>
  <div class="page">
    <!-- header -->
    <header class="header">
      <h1 class="web-title"><a href="../Main/First-web.jsp"  style="text-decoration:none; color: dodgerblue; ">MOBLE</a></h1>

      <form action="" class="search-form">
        <input type="search" class="search">
        <input type="submit" class="submit" value="검색">
      </form>
      <ul class="account-list">
        <li class="account-item"><a href="../Login/LoginForm.jsp">로그아웃</a></li>
      </ul>
    </header>
    <!-- menu -->
    <ul class="menu-list">
      <li class="menu-item">
        <a href="../StudyBoard/StudyBoard.jsp" class="menu-link">학습게시판</a>
      </li>
      <li class="menu-item">
        <a href="../FreeBoard/FreeBoard.jsp" class="menu-link">자유게시판</a>
      </li>

      <li class="menu-item">
        <a href="#" class="menu-link" id="sowon-link">소원수리함</a>
      </li>
			<li class="menu-item"><a href="#" class="menu-link">모블채팅방</a>
				<ul class="submenu">
					<li class="submenu-list">
						<a href="../Chat/User_chat.jsp" class="submenu-item"> 실명 채팅방 &emsp;&emsp;&emsp;</a>
					</li>
					<li class="submenu-list">
						<a href="../Chat/Ann_chat.jsp" class="submenu-item"> 익명 채팅방</a>
					</li>
				</ul>
			</li>
		</ul>
    <!-- primary -->
    <section class="primary primary-left">
      <ul class="card-list">
        <li class="card-item">
          <figure class="card-image" style="background-image: url(../images/main/post1.PNG);"></figure>
          <div class="card-desc">강의명 : 인공지능 초급 <br>신청기간: 2020.07.19 ~ 2020.08.11</div>
        </li>
        <li class="card-item">
          <figure class="card-image" style="background-image: url(../images/main/post2.PNG);"></figure>
          <div class="card-desc">강의명 : 클라우드 프로그래밍 <br>신청기간: 2020.07.19 ~ 2020.08.11</div>
        </li>
        <li class="card-item">
          <figure class="card-image" style="background-image: url(../images/main/post3.PNG);"></figure>
          <div class="card-desc">강의명 : 빅데이터 <br>신청기간: 2020.07.19 ~ 2020.08.11</div>
        </li>
        <li class="card-item">
          <figure class="card-image" style="background-image: url(../images/main/post4.PNG);"></figure>
          <div class="card-desc">강의명 : 사물인터넷 <br>신청기간: 2020.07.19 ~ 2020.08.11</div>
        </li>
        <li class="card-item">
          <figure class="card-image" style="background-image: url(../images/main/post5.PNG);"></figure>
          <div class="card-desc">강의명 : 웹디자이너 <br>신청기간: 2020.07.19 ~ 2020.08.11</div>
        </li>
        <li class="card-item">
          <figure class="card-image" style="background-image: url(../images/main/post6.PNG);"></figure>
          <div class="card-desc">강의명 : 포토샵 디자이너 <br>신청기간: 2020.07.19 ~ 2020.08.11</div>
        </li>
      </ul>
    </section>
    <section class="primary primary-right">
      <input type="radio" id="snow-switch" name="weather" >
      <label for="snow-switch">
        <span>누르세요.</span>
      </label>
      <input type="radio" id="rain-switch"name="weather" checked="checked">
      <label for="rain-switch">
        <span>누르세요.</span>
      </label>
      <ul class="window-container">
        <li class="window">
          <div class="window-image"></div>
        </li>
        <li class="window">
          <div class="window-image"></div>
        </li>
        <li class="window">
          <div class="window-image"></div>
        </li>
        <li class="window">
          <div class="window-image"></div>
        </li>
        <li class="window">
          <div class="window-image"></div>
        </li>
        <li class="window">
          <div class="window-image"></div>
        </li>
      </ul>
      
    </section>
    <!-- side-left -->
    <aside class="side side-left">
      <ul class="message-list">
        <li class="message-item">안녕하세요 모블 교육센터입니다.</li>
        <li class="message-item">저희는 프로그래밍 기초부터 고급 그리고 현업에서 쓰이는 기술들을 자세히 교육합니다.</li>
        <li class="message-item">오시는 길은 우측 상단 깃발을 눌러주세요.</li>
      </ul>
      <ul class="user-list">
        <li class="user-item">
          <figure class="user-image" style="background-image: url(../images/main/사람1.PNG);"></figure>
          <p class="user-content">
            강사: 뽀로로
            <br>뽀로로세상 DB박사
            <br>전 NAVER클라우드 기술자
          </p>
        </li>
        <li class="user-item">
          <figure class="user-image" style="background-image: url(../images/main/사람2.PNG);"></figure>
          <p class="user-content">
            강사: 크롱
            <br>뽀로로세상 AI박사
            <br>전 NAVER AI 기술자
          </p>
        </li>
        <li class="user-item">
          <figure class="user-image" style="background-image: url(../images/main/사라마3.PNG);"></figure>
          <p class="user-content">
            강사: 루피
            <br>뽀로로세상 프론트박사
            <br>전 NAVER 웹 기술자
          </p>
        </li>
      </ul>
    </aside>
    <!-- side-right -->
    <!-- <aside class="side side-right">
      <ul class="teacher-list">
        <li class="teacher-item">
          <figure class="teacher-image" style="background-image: url(images/사람4.PNG);"></figure>
          <p class="teacher-content">Lorem ipsum dolor sit amet.
            <br> ipsum dolor sit amet.
            <br>Lorem ipsum dolor sit amet.
            <br>Lorem ipsum dolor sit amet.
            Lorem ipsum dolor sit amet.
          </p>
        </li>
        <li class="teacher-item">
          <figure class="teacher-image" style="background-image: url(images/사람5.PNG);"></figure>
          <p class="teacher-content">Lorem ipsum dolor sit amet.</p>
        </li>
        <li class="teacher-item">
          <figure class="teacher-image" style="background-image: url(images/사람6.PNG);"></figure>
          <p class="teacher-content">Lorem ipsum dolor sit amet.</p>
        </li>
      </ul>
    </aside> -->
    <!-- footer -->
    <footer class="footer">문의 번호 : 010-1234-1234 문의 메일 : mobel@gmail.com</footer>
  </div>

  <!-- 지도 표시 -->
  <input type="checkbox" id="modal-switch">
  <label for="modal-switch">
    <span class="modal-click">나를 눌러볼래?</span>
  </label>
  <div class="modal">
    <figure class="dialog" style="background-image: url(../images/main/모블지도약도.PNG);"></figure>
  </div>
  
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
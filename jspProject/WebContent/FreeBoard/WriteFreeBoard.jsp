<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Long userid = (Long) (application.getAttribute("userid"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title> 모블 자유 게시판(학 생) </title>
        <link href="../CSS/WriteFreeBoard.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/right-menu.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
      <div class="boardtitle">
         <p class="boardfont">모블 자유 게시판 글 작성</p>
      </div>
      
        <!-- ****** 네비게이션 바 메뉴 ****** -->
        <div class="wrap">
            <header class="app-header"> <!-- div태그를 써서 작성하여도 되지만 헤더를 이용하여 좀더 세세히 나눔 -->
                <h1 class="brand">
                   <a href="../Main/First-web.jsp" target="_self"> 
                       <span class="logo-name">Moble</span>
                           <!-- <SPAN>태그 인태그를 사용해서 위드나 헤이드 태그를 사용 DIV와의 차이 /
                           CSS로 모블 글씨의 변화를 주고자 함-->
                   </a>
                </h1>
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="../StudyBoard/StudyBoard.jsp" target="_self"> 학습자료 게시판</a></li>
                    <li class="nav-item">
                        <a class="nav-link" href="../FreeBoard/FreeBoard.jsp" target="_self"> 자유 게시판</a> </li>
                    <li class="nav-item">
                        <a class="nav-link nav-right" href="#" id="sowon-link" target="_self"> 소원 수리함</a> </li>
                    <li class="nav-item">
                      <a class="nav-link nav-right" href="../Chat/User_chat.jsp" target="_self"> 채          팅</a> </li>
                </ul>
                <button type="button" class="button is-open rightBtn">
                    <img src="../images/navigation-button.gif" alt="메뉴 열기">
                </button>
            </header>
            
            
              <!-- ****** 글 작성 ****** -->
              <div class="writeFreeBoard-main">
                 <div class="writeBoard">
                    <form method="post" id="authForm" action="insertFreeBoard.jsp">
                  
                       <!-- ****** 제목, 이름  입력 ****** -->
                       <div class="fieldset_one">
                     <div class="box_FreeWrite">
                        <div class="inp_Title">
                           <span class = "boderTitle">
                              <label for="writeTitle" >제 목 </label>
                           </span>
                              <input type="text" id="writeTitle" name="writeTitle" placeholder="Title">
                        </div>
                     </div>
                  </div>
                  
                  <!-- ****** 내용 입력  ****** -->
                  <div class="fieldset_two">
                     <div class="box_FreeWrite">
                        <label >내 용 : </label>
                        <div class="inp_Content">
                           <textarea id="writeContent" name="writeContent" placeholder="Content" cols="10" rows="8"></textarea>
                        </div>
                     </div>
                  </div>
                  
                  <!-- ****** 글 작성 버튼  ****** -->
                  <div class="fieldset_three">
                     <button type="submit" class="btn_Write">글 작성</button>
                     <input type="button" class="btn_Back" onClick="javascript:history.go(-1); return false ;" value="돌아 가기"/>
                  </div>
                    </form>
                 </div>   
              </div>
            
      </div>
      
      <!-- ****** 하단부 디자인  ****** -->
      <div class="boxColor">
         <p>""</p>
      
      </div>
      
      <!-- ****** 우측 메뉴 디자인 ****** -->
      <div class="right-menubar">
      <ul class="logout-list">

           <li class="logout-item"><a href="../Login/LoginForm.jsp" class="logout-link">로그아웃</a></li>
        </ul>
        </div>
        <div class="hidden"></div>
        
        <script>
        
        var right_menuBtn = document.querySelector(".rightBtn");
        var right_menuBar = document.querySelector(".right-menubar");
        var i = 1;
        
        right_menuBtn.addEventListener('click', function() {
           
           if(i==0)
            {
               right_menuBar.style.right = "-11rem";
               i=1;
            }
            else{
               right_menuBar.style.right = "0rem";
               i=0;
            }
            console.log(right_menuBar.style.right);


        // if(right_menuBar.style.display!="none"){
        //   right_menuBar.style.display = "none";
        // }
        // else {
        //   right_menuBar.style.display = "block";
        // }
      });
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
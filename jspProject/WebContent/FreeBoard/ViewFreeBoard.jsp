<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "Moble.*" %>


<%
   String Student_name = null;
   if(session.getAttribute("Student_name") != null ){
      Student_name = (String) session.getAttribute("Student_name");
   }
   out.print("Student_name");

      
   String send_ID = request.getParameter("send_ID");
   System.out.printf("==========\n" + send_ID); 
   Long getFree_ID = Long.parseLong(send_ID);   

   
   FreeBoardVO vo = new DAOImpl().get_FreeBoard(getFree_ID);
   
   Long free_ID = vo.getFree_ID();
   Long user_ID = vo.getUser_ID();
   String user_Name = vo.getUser_name();
   String free_Date = vo.getFree_Date();
   String free_Title = vo.getFree_Title();
   String free_content = vo.getFree_Content();
   
   
   System.out.printf("\n%d\n",user_ID);
   
   Long userid = (Long)(application.getAttribute("userid"));
   

%>



<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>모블 자유게시판</title>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link href="../CSS/ViewFreeBoard.css" rel="stylesheet" type="text/css"/>
      <link href="../CSS/right-menu.css" rel="stylesheet" type="text/css"/>
   </head>

    <body>
        <!-- ****** 네비게이션 바 메뉴 ****** -->
        <div class="wrap">
            <header class="app-header"> <!-- div태그를 써서 작성하여도 되지만 헤더를 이용하여 좀더 세세히 나눔 -->
                <h1 class="brand">
                <a href="../Main/First-web.jsp" target="_self"> 
                    <span class="logo-name">모블</span>
                        <!-- <SPAN>태그 인태그를 사용해서 위드나 헤이드 태그를 사용 DIV와의 차이 /
                        CSS로 모블 글씨의 변화를 주고자 함-->
                </a>
                </h1>
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="../StudyBoard/StudyBoard.jsp" target="_self"> 학습 게시판</a></li>
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
            
      <!-- ************ 게시판 내용  ************ -->
      
      <main class="board-main">
         <!-- ******   타이틀 부분  ****** -->
           <div class="boardtitle">
              <p class="boardfont">모블 자유 게시판</p>
         </div>
            
         <div class="container_board">   
            <!-- ****** 게시판 컬럼 ****** -->
            <form method="post" name="moveChoice" >
               <table class="table_board"> 
                  <thead>
                     <tr>
                        <th class="tableCulrom1" style="border:1px solid #dddddd">글 번호</th>
                        <th class="tableContent1" style="border:1px solid #dddddd"><%=free_ID%></th>
                        <th class="tableCulrom1" style="border:1px solid #dddddd"> 조회수 </th>
                        <th class="tableContent1" style="border:1px solid #dddddd">1</th>
                     </tr>
                     
                     <tr>
                        <th class="tableCulrom1" style="border:1px solid #dddddd">작성자</th>
                        <th class="tableContent1" style="border:1px solid #dddddd"><%=user_Name%></th>
                        <th class="tableCulrom1" style="border:1px solid #dddddd">작성시간 </th>
                        <th class="tableContent1" style="border:1px solid #dddddd"><%=free_Date%></th>
                     </tr>
                     
                     <tr>
                        <th class="tableCulrom1" style="border:1px solid #dddddd">제 목</th>
                        <th colspan="3"class="tableContent1" style="border:1px solid #dddddd"><%=free_Title%></th>
                     </tr>
                     
                  </thead>
                  
                  <tbody>
                     <tr>
                        <td class="tableContent1"></td>
                        <td class="tableContent2"></td>
                        <td class="tableContent4"></td>
                        <td class="tableContent5"></td>
                     </tr>

                     <tr>
                        <th colspan="4" class="tableCulrom1" style="border:1px solid #dddddd">내 용</th>
                     </tr>   
                              
                     <tr>
                        <td colspan="4" class="tableContent1"></td>
                     </tr>
                     
                     <tr>
                        <td colspan="4" class="tableContent1" 
                        style="width:400px; height:300px; word-break: break-all; overflow-y:scroll;"><%=free_content%></td>
                     </tr>   
                     
                     
                  </tbody>
               </table>
               
               <!-- ****** 글 작성 버튼 ****** -->
               <input type="hidden" name="free_ID" id="free_ID">
               
               <div class="post_button">
                  <input type="button" onClick="MoveSubmit(1, <%=free_ID%>, <%=userid%>, <%=user_ID%>)" class="btn-back" value="목록 보기" />
                  <input type="button" onClick="MoveSubmit(2, <%=free_ID%>, <%=userid%>, <%=user_ID%>)" class="btn-delete" value="글  삭제" />
                  <input type="button" onClick="MoveSubmit(3, <%=free_ID%>, <%=userid%>, <%=user_ID%>)" class="btn-write" value="글  쓰기" />
               </div>   

               <!-- ****** 원하는 submit 페이지로 이동 ****** -->
               <script>
                  function MoveSubmit(index, free_ID, userid, user_ID){
                     var flag = false;
                     
                     // 어떤 버튼이 눌렸는지 확인
                     if(index == 1){
                        document.moveChoice.action='FreeBoard.jsp';
                     }
                     if(index == 2){
                        if(userid != user_ID){
                        	alert("본인만 삭제가 가능합니다.");
                        	document.moveChoice.action="FreeBoard.jsp";
                        	
                        }
                        else{
                        	document.getElementById('free_ID').value = free_ID;
                       		document.moveChoice.action="DeleteFreeBoard.jsp";
                        }
                     }
                     if(index == 3){
                        document.moveChoice.action='WriteFreeBoard.jsp';
                     }

                     document.moveChoice.submit();
                  }
               </script>            
            </form>   
   
         </div>
      </main>   
      
      <!-- ****** 하단 부 디자인 ****** -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<title>회원가입 폼</title>
<style>
.find {
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
   text-align: center;
   width: 500px;
   margin-top: 30px;
}
 /* Modal Content/Box */
        .find-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
}
</style>
</head>
<body>
 <div id="myModal" class="modal">
   <div class="find-content">
      <form method="post" action="ActionFindPW.jsp">
      
      
         <h1>회원계정 찾기</h1>
         <p>
            <a href="LoginForm.jsp">홈으로</a>
         </p>
         <fieldset>
            <legend>비밀번호 찾기</legend>
            <table>
               <tr>
                  <td>이름</td>
                  <td><input type="text" size="35" name="username" placeholder="이름"></td>
               </tr>
               <tr>
                  <td>학번</td>
                  <td><input type="number" size="35" name="userid"
                     placeholder="학번"></td>
               </tr>
               <tr>
                  <td>핸드폰 번호</td>
                  <td><input type="number" size="35" name="phonenumber"
                     placeholder="핸드폰번호"></td>
               </tr>
            </table>
            <input type="submit" value="비밀번호 찾기" onClick="location.href='Modal.html''" />
         </fieldset>
      </form>
   </div>
</div>
</body>
</html>
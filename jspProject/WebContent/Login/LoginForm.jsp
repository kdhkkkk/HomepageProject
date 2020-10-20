<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.16.1/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.3.0/vue.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.4.1/css/bulma.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title>MOBLE Login</title>
<body>

</body>
</html>
<style>
html, body {
   height: 100%;
   padding: 0;
   margin: 0;
   overflow: hidden;
}

#app {
   height: 100%;
   margin: 0;
   padding: 0;
   background-color: #E6E6E6;
}

#app .column {
   margin-top: 10%;
}

#app .column>p {
   text-align: center;
}

#sign-up-button {
   float: right;
}
</style>

<body>
   <!--main container-->
   <div class="columns is-mobile" id="app">
      <!--centered column-->
      <div class="column is-half is-offset-one-quarter">

         <p class="title is-2 is-spaced">MOBLE</p>

         <!--login form-->
         <div class="box">
            <form action='Logincheck.jsp' method='post'>
               <div class="field">
                  <p class="control has-icons-left">
                     <input class="input" type="title" name="StudentNumber"
                        id="StudentNumber" placeholder="학번"> <span
                        class="icon is-small is-left"> <i class="fa fa-envelope"></i>
                     </span>
                  </p>
               </div>
               <div class="field">
                  <p class="control has-icons-left">
                     <input class="input" type="password" name="password"
                        id="password" placeholder="비밀번호"> <span
                        class="icon is-small is-left"> <i class="fa fa-lock"></i>
                     </span>
                  </p>
               </div>
               <div class="field">
                  <p class="control">
                     <input type="submit" class="button is-success" id="log-in-button"
                        value="로그인" style="background-color:dodgerblue;">
            </form>
            <form action='Signup.jsp' method='get'>
               <button class="button is-info" id="sign-up-button"
                  onClick="location.href='Signup.jsp'" style="background-color:dodgerblue;">회원가입</button>
               </p>
         </div>
         <div class="login_append">
            <div class="inp_chk">
               <!-- ì²´í ¬ì   checked ì¶ ê°  -->
               <input type="checkbox" id="keepLogin" class="inp_radio"
                  name="keepLogin"> <label for="keepLogin" class="lab_g">
                  <span class="img_top ico_check"></span> <span class="txt_lab">로그인
                     유지</span>
               </label>
            </div>
            <span class="txt_find"> <a href='FindID.jsp'
               class="link_find" style='font-weight:bold;' onClick="location.href='FindId.jsp">학번찾기 </a> / <a
               href='FindPW.jsp' class="link_find"
               onClick="location.href='FindPW.jsp'" style='font-weight:bold;'>비밀번호찾기</a>
            </span>
         </div>
         </form>
      </div>
      <!--end of form-->

   </div>
   <!--end of column-->
   </div>
   <!--end of container-->


</body>
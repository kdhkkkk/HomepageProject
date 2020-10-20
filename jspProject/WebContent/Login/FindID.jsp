<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<title>회원가입 폼</title>
<style>
* {
   margin: 0 auto;
}

a {
   color: #333;
   text-decoration: none;
}

.find {
   text-align: center;
   width: 500px;
   margin-top: 30px;
}
</style>
</head>
<body>
	<div class="find">
		<h1>회원계정 찾기</h1>
		<div class="find">
		<form method="post" action="ActionFindID.jsp">
			<legend>아이디 찾기</legend>
			<table>
				<tr>
					<td>이 름</td>
					<td><input type="text" size="35" name="userName" placeholder="이 름"></td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td><input type="number" size="35" name="phonenumber" placeholder="핸드폰번호"></td>
				</tr>
			</table>
			<input type="submit" value="학번 찾기"/>
		</form>
		</div>
	</div>
</body>
</html>
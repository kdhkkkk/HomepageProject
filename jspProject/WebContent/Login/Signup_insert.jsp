<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Moble.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%

	request.setCharacterEncoding("utf-8");	

	String username = request.getParameter("username");
	String userpassword = request.getParameter("userpassword");
	String userphone = request.getParameter("userphone");
	
	
	DAO dao = new DAOImpl();
	VO_USER vo_user = new VO_USER(null, null, username, userpassword, userphone);
	
	boolean success = dao.insert_user(vo_user);
	
	if(success) {
	   System.out.printf("%s 님 회원 가입 완료 !!. %n" , vo_user);
	} else {
	   System.out.printf("%s 님 회원 가입 실패 !!. %n", vo_user);
	}
	
	
	
	response.sendRedirect("LoginForm.jsp");
%>
</body>
</html>
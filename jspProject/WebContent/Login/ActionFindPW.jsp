<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "Moble.*" %>

<%

	RequestDispatcher dispat = request.getRequestDispatcher("FindPW.jsp");
	request.setCharacterEncoding("utf-8");
	String username = request.getParameter("username");
	String user_pwstr = request.getParameter("userid");
	String userphone = request.getParameter("phonenumber");
	Long user_pw = Long.parseLong(user_pwstr);
	
	DAO dao = new DAOImpl();
	String user_password = dao.password_find(username, user_pw, userphone);
	System.out.println("비밀 번호 : "+user_password);
	
	if(user_password == ""){
		dispat.forward(request, response);
    }

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= username %>님의  비밀 번호는 <%= user_password%> 입니다.
                                   
                          
<a href="LoginForm.jsp">돌아가기</a>
</body>
</html>
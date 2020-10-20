<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "Moble.*" %>
    
<%

	Long user_id = Long.parseLong(request.getParameter("StudentNumber"));
	String user_password = request.getParameter("password");
	//application 추가 함
	application.setAttribute("userid", user_id);
	
	System.out.println(application.getAttribute("userid"));
	RequestDispatcher dispat = request.getRequestDispatcher("LoginForm.jsp");
	DAO dao = new DAOImpl();
	VO_LOGIN vologin = dao.login(user_id, user_password);

	if(vologin == null){
		dispat.forward(request, response);
	}else{
		response.sendRedirect("../Main/First-web.jsp");
	}	
	
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
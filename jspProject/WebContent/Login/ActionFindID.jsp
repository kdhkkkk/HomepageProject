<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "Moble.*" %>
    
<%
	RequestDispatcher dispat = request.getRequestDispatcher("FindID.jsp");
	request.setCharacterEncoding("utf-8");
	String userName = request.getParameter("userName");
	String phonenumber = request.getParameter("phonenumber");
	
	DAO dao = new DAOImpl();
	
    String user_id = dao.id_find(userName, phonenumber); 
    
    if(user_id == ""){
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
<%= userName %>님의  학번은 <%=user_id%> 입니다.
                                       
                                    
<a href="LoginForm.jsp">돌아가기</a>
</body>
</html>
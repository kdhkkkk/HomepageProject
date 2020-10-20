<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "Moble.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소원 수리 게시판 삭제</title>
</head>
<body>
   <%
      request.setCharacterEncoding("utf-8");   
      DAOImpl dao = new DAOImpl();
      
      // 삭제하는 CheckBtn의 vo.getWish_ID()를 가져옴
      String getFree_ID = request.getParameter("free_ID");
      Long free_ID = Long.parseLong(getFree_ID);
      
      dao.delete_FreeBoard(free_ID);         

      response.sendRedirect("FreeBoard.jsp");
      
   %>

</body>
</html>
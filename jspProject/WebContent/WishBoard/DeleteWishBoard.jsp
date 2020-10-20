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
		String[] DeleteCheck = request.getParameterValues("DeleteCheck");
		// wish_ID의 공간을 Long형으로 DeleteCheck의 크기만큼 생성
		Long[] wish_ID = new Long[DeleteCheck.length];
		
		// wish_ID에 DeleteCheck의 index를 형변환 후 delete_WishBoard 넣어줌.
		for(int i=0; i<DeleteCheck.length; i++){			
			wish_ID[i] = Long.parseLong(DeleteCheck[i]);			
			dao.delete_WishBoard(wish_ID[i]);			
		}

		response.sendRedirect("WishBoard.jsp");
		
	%>

</body>
</html>
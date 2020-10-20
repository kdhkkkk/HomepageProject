<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "Moble.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목, 이름, 날짜 찾기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");	
		DAOImpl dao = new DAOImpl();
		
		String wish_choice = request.getParameter("wish_choice");
		String wish_search = request.getParameter("wish_search");
		System.out.println(wish_choice);
		System.out.println(wish_search);
		
		
	    // 넘어오는 값이 Null일 경우  NullPointException 발생 
		if( wish_search == null || wish_search.equals("")  || wish_search .equals("null")){

			out.println("<script> alert('검색하실 내용을 보내주세요.'); history.back();</script>");		      
		}

		else{
	    	// 검색 내용이 있다면 넘겨준다.
	    	pageContext.forward("WishBoard.jsp");
		}
	%>
</body>
</html>
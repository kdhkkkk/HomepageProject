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
		
		String free_Choice = request.getParameter("free_Choice");
		String free_Search = request.getParameter("free_Search");
		System.out.println(free_Choice);
		System.out.println(free_Search);
		
		
	    // 넘어오는 값이 Null일 경우  NullPointException 발생 
		if( free_Search == null || free_Search.equals("")  || free_Search .equals("null")){

			out.println("<script> alert('검색하실 내용을 작성해주세요.'); history.back();</script>");		      
		}

		else{
	    	// 검색 내용이 있다면 넘겨준다.
	    	pageContext.forward("FreeBoard.jsp");
		}
	%>
</body>
</html>
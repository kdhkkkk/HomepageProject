<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "Moble.*" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소원수리게시판 입력</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");		
		
		String wish_Title = request.getParameter("wish_Title")==null?"" : request.getParameter("wish_Title");
	    String wish_Content = request.getParameter("wish_Content");
	    Long userid = (Long)(application.getAttribute("userid")); 
	    //String Student_name = request.getParameter("Student_name");
	   
	    
	    // 넘어오는 값이 Null일 경우 입력하도록 alert창 생성
		if( wish_Title == null || wish_Title.equals("")  || wish_Title .equals("null")){

			out.println("<script> alert('제목을 입력해주세요.'); history.back();</script>");		      

		}
		else if( wish_Content == null || wish_Content.equals("")  || wish_Content .equals("null")){

			out.println("<script> alert('내용을 입력해주세요.'); history.back();</script>");		      

		}
	    
		else{
	    	// 생성자 : wish_ID, user_ID, wish_Title, wish_Content, wish_Date 순서
	    	WishBoardVO vo_wishtable = new WishBoardVO(null, userid, wish_Title, wish_Content, null );
	    	DAOImpl dao = new DAOImpl();
	    	dao.insert_WishBoard(vo_wishtable);
	    	
	    	out.println("<script> alert('소원 수리함에 글 등록이 완료되었습니다.'); history.back();</script>");
		}
	
	%>
</body>
</html>
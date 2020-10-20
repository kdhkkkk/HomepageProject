<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "Moble.*" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 입력</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");		
		
		String writeTitle = request.getParameter("writeTitle")==null?"" : request.getParameter("writeTitle");
	    String writeContent = request.getParameter("writeContent");
	    
	    //Long Student_number = Long.parseLong(request.getParameter("Student_number"));
	    //String Student_name = request.getParameter("Student_name");
	   
	    
	    // 넘어오는 값이 Null일 경우 입력하도록 alert창 생성
		if( writeTitle == null || writeTitle.equals("")  || writeTitle .equals("null")){

			out.println("<script> alert('제목을 입력해주세요.'); history.back();</script>");		      

		}
		else if( writeContent == null || writeContent.equals("")  || writeContent .equals("null")){

			out.println("<script> alert('내용을 입력해주세요.'); history.back();</script>");		      

		}
		else{
	    	// 생성자 : free_ID, user_ID, free_Title, free_Content, user_name, free_Date
	    	Long userid = (Long)(application.getAttribute("userid"));
	    	FreeBoardVO vo_FreeTable = new FreeBoardVO(null, userid, writeTitle, writeContent, null, null );
	    	DAOImpl dao = new DAOImpl();
	    	dao.insert_FreeBoard(vo_FreeTable);
	    	
	    	out.println("<script> alert('자유 게시판에 글 등록이 완료되었습니다.'); location.replace('FreeBoard.jsp')</script>");
		}

	%>
</body>
</html>
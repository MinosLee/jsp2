<%@page import="board.vo.Comment"%>
<%@page import="board.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//댓글 추가와 삭제는 dao메소드를 실행하는 Action클래스
//ㄴ댓글 삭제할 때는 del파라미터를 전달
	request.setCharacterEncoding("UTF-8");
	CommentDao dao=CommentDao.getInstance();
	String del=request.getParameter("del");
	
	if(del !=null && del.equals("y")){	//del이 null일때는 첫번째 조건이 false이므로 두번째 조건 equals 메소드 실행안함.
	int cmtidx= Integer.parseInt(request.getParameter("cmtidx"));	
	int idx= Integer.parseInt(request.getParameter("idx"));	
	dao.delete(cmtidx);
	response.sendRedirect("detailAction.jsp?idx="+idx+"&page="+request.getParameter("page"));
	
	}else{
	//댓글을 등록하기 위한 mref 컬럼값 꼭 필요.
	int mref=Integer.parseInt(request.getParameter("mref"));
	String writer= request.getParameter("writer");
	String content= request.getParameter("content");
	String ip= request.getRemoteAddr();
	
	Comment vo= new Comment(0,mref,writer,content,null,ip,0);
	dao.insert(vo);
	//댓글 등록 확인하기 위해 글 상세보기 페이지로 
	response.sendRedirect("detailAction.jsp?idx="+mref+"&page="+request.getParameter("page"));
	}

%>
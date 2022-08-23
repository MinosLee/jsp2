<%@page import="board.dao.FreeboardDao"%>
<%@page import="board.vo.FreeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String ip = request.getRemoteAddr();
	
	FreeBoard vo = new FreeBoard(0,writer,password,subject,content,0,null,ip,0);
	FreeboardDao dao = FreeboardDao.getInstance();
	dao.insert(vo);
	response.sendRedirect("listAction.jsp");
%>
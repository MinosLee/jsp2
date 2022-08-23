<%@page import="board.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.CommentDao"%>
<%@page import="board.dao.FreeboardDao"%>
<%@page import="board.vo.FreeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   //글 상세보기를 클릭한 페이지의 번호를 파라미터로 가져오는 이유 : 글 상세보기가 다시 목록으로 돌아갈 때를 위해서
   //               ㄴ 보고 있던 글 목록 페이지로 돌아가기
   int idx = Integer.parseInt(request.getParameter("idx"));
   int pageNo = Integer.parseInt(request.getParameter("page"));
   request.setAttribute("page", pageNo);
   

   //메인글 idx의 댓글 목록 attribute로 저장 (선처리: 댓글 개수 update)
   CommentDao cmtdao =CommentDao.getInstance();
   cmtdao.updateCmtCount(idx);      //idx값이 comment 테이블에서는 mref가 됨
   List<Comment> cmtlist = cmtdao.getComments(idx);
   request.setAttribute("cmtlist", cmtlist);
   
   FreeboardDao dao = FreeboardDao.getInstance();
   dao.readcountUp(idx);
   FreeBoard bean = dao.getDetail(idx);
   
   request.setAttribute("bean", bean);
   
   
   pageContext.forward("detailView.jsp");
%>
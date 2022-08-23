<%@page import="vo.BookMember"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.BookMemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid= request.getParameter("userid");
	String password= request.getParameter("password");
	
	BookMemberDao dao= BookMemberDao.getInstance();
	Map<String,String> map= new HashMap<>();
	map.put("email",userid);
	map.put("password",password);
	//userid= "admin@gmail.com" 이고 비밀번호가 12345라고 가정해서.
			out.print("<script>");
	BookMember vo= dao.login(map);
	String idx; String pageNo;
	idx=request.getParameter("idx");
	pageNo=request.getParameter("page");
	if(vo != null){
		//인증성공	->session객체에 사용자 정보로 필요한 데이터를 애트리뷰트에 저장
		session.setAttribute("user", vo);
		session.setAttribute("sessionId",session.getId());
		out.print("alert('로그인 했습니다');");
//		out.print("location.href='../index.jsp';");
		if(request.getParameter("back") != null && request.getParameter("back").equals("detail")) {
			
			out.print("location.href='../board/detailAction.jsp?idx="+idx + "&page="+pageNo +"';");
		}else	
			out.print("location.href='../index.jsp';");
	


	}else{
		//인증실패-
		
		out.print("alert('로그인 계정정보가 틀립니다.');");
		//out.print("location.href='loginForm.jsp';");
		out.print("location.href='loginForm.jsp?back="
		+request.getParameter("back")+ "&mref=" + idx + "&page=" + pageNo +"';");
	}
		out.print("</script>");




%>
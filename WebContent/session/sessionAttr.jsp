<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user= (String)session.getAttribute("session_user");
out.print("session id:");
out.print(session.getId());
out.print("<br>");
out.print("session 애트리뷰트 "+ user);	//세션 타임아웃 3분 지나기 전엔 김땡땡 출력, 타임아웃 3분이 지나면 null

%>
<br><a href="session.jsp">세션테스트 메인</a>
</body>
</html>
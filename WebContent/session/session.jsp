<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 테스트</title>
</head>
<body>
	<div>
		http 프로토콜은 statelss(상태정보유지안됨) ,비연결지향 <br> (참고로 카카오톡은 연결지향.) 
		-> 웹서버와 브라우저 사이의 연결정보를 저장하는 방법을 사용합니다.<br> 
		-> request 를 통해서 브라우저의 세션ID가 부여되고 그 값으로 구별.<br> 
		-> 로그인 기능 구현에 활용합니다.<br> 
		-> 톰캣은 이름 JSESSIONID 값을 만듭니다.<br> 
		-> 세션 유효 시간은 서버에서 설정합니다. web.xml 확인(모든프로젝트에 적용) <br>
		-> 또는 session.setMaxInactiveInterval(300); 로 함.
	</div>
	
	<!--     
	<session-config>
        <session-timeout>30</session-timeout>
    </session-config>
	 -->
<h3>session정보 확인</h3>
<%
	String id= session.getId();
out.print("session ID" + id);
out.print("<br>");

long create= session.getCreationTime();
out.print("session생성시간: "+ create);
out.print("<br>");
DateFormat df= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
out.print("session생성시간: "+ df.format(create));
out.print("<br>");

long last= session.getLastAccessedTime();
out.print("session생성시간: "+ last);
out.print("<br>");
out.print("session생성시간: "+ df.format(last));
out.print("<br>");

//메소드로 timeout변경
session.setMaxInactiveInterval(300);	//300초
session.setAttribute("session_user", "김땡땡");
%>
<br><a href="sessionAttr.jsp">세션애트리뷰트 확인</a>
</body>
</html>
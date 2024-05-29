<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 페이지 - Servlet 용도</title>
</head>
<body>
	<b> 아이디</b>
	<%= request.getParameter("user_id") %><br>
	<b> 이름</b>
	<%= request.getParameter("name")%><br>
	<b> 나이</b>
	<%= request.getParameter("age")%><br>
	
	<!-- 퀴즈02; anchor 태그에 부트스트랩의 btn 속성으로 만들어야;
	클라이언트 jsp 1개, server쪽 jsp 1개 이렇게 총 2개만 만들기. -->
</body>
</html>
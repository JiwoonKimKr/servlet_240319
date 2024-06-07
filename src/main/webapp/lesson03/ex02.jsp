<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
</head>
<body>
	<h1>회원 가입</h1>
	<!-- 
	흐름(flow)
	1. 회원가입 : 현 ex02.jsp(가입 화면) -> ex02_insert 서블릿(Insert 쿼리 실행) -> ex02_1.jsp(사용자 목록 화면, select 쿼리)
	
	 -->
	
	<form method="post" action="/lesson03/ex02_insert">
		<p>
			<b>이름</b>
			<input type="text" name="name">
		</p>
		<p>
			<b>생년월일</b>
			<input type="text" name="yyyymmdd">
		</p>
		<p>
			<b>이메일</b>
			<input type="text" name="email">
		</p>
		<p>
			<b>자기소개</b>
			<textarea name="introduce" rows="5" cols="50"></textarea>
		</p>
		<p>
			<input type="submit" value="회원가입">
		</p>
	</form>
</body>
</html>
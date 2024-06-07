<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>가입한 사용자 목록</title>
</head>
<body>
<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance(); //이 MysqlService도 별도로 import해와야 한다!
	ms.connect();
	
	// select query 수행
		// db에서 리스트로 받아올 것이다. 그런데 이미 데이터를 받아왔는데 db를 끊지 않는 걸까?
				//중간에 반복문이 완전히 끝나기 전에 DB가 끊기면 값이 제대로 호출되지 않는다!
	String querySelect = "select * from `new_user`" ;
	ResultSet res = ms.select(querySelect);
	
%>
	<h1>사용자 목록</h1>

	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>자기소개</th>
			</tr>
		</thead>
		<tbody>
<%
	while(res.next()){
%>
			<tr>
				<td><%= res.getInt("id") %> </td>
				<td><%= res.getString("name") %> </td>
				<td><%= res.getString("yyyymmdd") %> </td>
				<td><%= res.getString("email") %> </td>
				<td><%= res.getString("introduce") %> </td>
				<td><a href="/lesson03/ex02_delete?id=<%= res.getInt("id") %>"> 탈퇴하기</a></th>
			</tr>
<%		
	}
%>		
		</tbody>
	</table>

<%
	//DB 연결 해제 
	ms.disconnect();
%>
</body>
</html>
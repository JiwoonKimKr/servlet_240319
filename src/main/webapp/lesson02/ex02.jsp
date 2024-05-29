<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 페이지 - Get Method</title>
</head>
<body>
 <!-- 클라이언트와 서버 모두 JSP 파일로 구성할 예정; ex02와 ex02_1 두 페이지로 구성할 예정; JSP가 JSP를 부르는 모양새 ;
 	RequestParams로 아이디, 이름, 나이를 Get Method로 Server에 보내게 될 것이다.-->
 	
 	<a href="/lesson02/ex02_1.jsp?user_id=seoritae&name=서리태&age=4">아이디와 이름과 나이를 넘긴다.</a>

</body>
</html>
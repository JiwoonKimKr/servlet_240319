<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Quiz02_1</title>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<meta charset="UTF-8">
</head>
<body>
	<div class="container">
		<%
			// request params 꺼내기
			String type = request.getParameter("type");
			//out.print(request.getParameter("type"));

			// 시간 또는 날짜 둘 중 하나 출력
			//Date now = new Date();
			//String result = null;
			SimpleDateFormat sdf = null; //공통된 코드를 줄여보기 1)if문에서 생성할 예정이어서 일단 null로 선언
			
			if(type.equals("time")){
				sdf = new SimpleDateFormat("현재 시간은 H시 m분 ss초 입니다.");
				//result = sdf.format(now); 중복 줄여보기
			} else {
				sdf = new SimpleDateFormat("오늘은 yyyy년 M월 d일 입니다.");
			}
			String result = sdf.format(new Date()); //중복된
		%>
		<div class="display-4"><%= result %></div>
	</div>
</body>
</html>
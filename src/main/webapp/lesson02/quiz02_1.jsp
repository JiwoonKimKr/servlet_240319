<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>현재 시간/날짜 확인</title>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<meta charset="UTF-8">
</head>
<body>
	<div class="container">
		<%
			SimpleDateFormat formatter1 = new SimpleDateFormat("H시 m분 ss초");
			SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy년 M월 d일");
			
			Date now = new Date();
			
			String strTimeCur = formatter1.format(now);
			String strTodayCur = formatter2.format(now);
			
			boolean isTime = request.getParameter("detailSelected").equals("time");
			
			String str = "";
			
			if(isTime){
				StringBuilder sb = new StringBuilder();
				sb.append("현재 시간은 ");
				sb.append(strTimeCur);
				sb.append("입니다.");
				str = sb.toString();
			} else {
				StringBuilder sb = new StringBuilder();
				sb.append("오늘은 ");
				sb.append(strTodayCur);
				sb.append("입니다.");
				str = sb.toString();
			}
			//out.print(str);
		%>
		
		<h2><%= str %></h2>
		
	</div>
</body>
</html>
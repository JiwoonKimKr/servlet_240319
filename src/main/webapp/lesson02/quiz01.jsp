<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
	<!-- 1)합계 -->
<%! private int num = 10;
	public int getSum(int n){ 
		int sum = n * (n + 1) / 2;
		return sum;}
%> 

	숫자 <%=num %>까지 합계는 <b><%=getSum(num) %></b>입니다.
	<br>
	
	<!-- 2)평균 -->
<% int[] scores = {81, 90, 100, 95, 80};
	int sum = 0;
	for(int score : scores){
		sum += score;
	}
	sum = sum / scores.length;
%>
	평균값은 <%= sum %>입니다.
	<br>
	
	<!-- 3)채점 결과 -->
<%	
	java.util.List<String> scoreList = java.util.Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});

	int count = 0;
	for(String correct : scoreList){
		count += (correct.equals("O")) ? 1 : 0;
	}
	int score = (int)((double) count / scoreList.size() * 100);
%>
	채점 결과, <b><%=score %></b>입니다.
	
	<!-- 4)나이 구하기 -->
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
	java.util.Date now = new java.util.Date();
	String today = formatter.format(now);
	
	String birthDay = "20010820";

	int gapYear = Integer.parseInt(today.substring(0, 4)) - Integer.parseInt(birthDay.substring(0, 4));
	int gapMonth = Integer.parseInt(today.substring(4, 6)) - Integer.parseInt(birthDay.substring(4, 6));
	
	gapYear += (gapMonth < 0) ? -1 : 0; 
%>

	<%=birthDay %>의 나이는 <b><%= gapYear%></b>입니다.
</body>
</html>
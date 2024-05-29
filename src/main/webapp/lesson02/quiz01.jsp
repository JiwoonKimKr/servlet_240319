<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
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
<%! private int num = 50;

	public int getSum(int n){ //input이 뭘로 들어가야 메소드를 만들 수 있을지 고민해야
		//메소드 작성하는 방식이 웹이랑 너무너무 흡사하다; 꼭 익숙해져야
		int sum = n * (n + 1) / 2;
		return sum;
	}
%> 

	<h4>숫자 <%= num %>까지 합계는 <%= getSum(num) %>입니다.</h4>
	
	<!-- 2)평균 -->
<% int[] scores = {81, 90, 100, 95, 80};
	int sum = 0; // scriptlet 다른 쪽에서 다시 sum이란 변수를 선언할 순 없다!
	for(int score : scores){
		sum += score;
	}
	double average = (double) sum / scores.length; // 나누기 연산이 있으니까 double로
%>
	<h4>평균값은 <%= average %>입니다.</h4>
	
	<!-- 3)채점 결과 -->
<%	
	//List를 쓰려면 에러 발생; Java와 마찬가지로 import가 필요하다.
	List<String> scoreList = Arrays.asList(new String[]
			{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});

	int count = 0;
	for(String correct : scoreList){
		//out.print(correct);
		count += (correct.equals("O")) ? 1 : 0;
	}
	//out.print(count);
	int score = (int)((double)count / scoreList.size() * 100);
%>
	<h4>채점 결과, <%= score %>입니다.</h4>
	
	<!-- 4)나이 구하기 -->
<%
	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
	Date now = new Date();
	String today = formatter.format(now);
	
	String birthDay = "20010820";
	//substring(idxStart, idxEnd_exclusive)
	int gapYear = Integer.parseInt(today.substring(0, 4)) - Integer.parseInt(birthDay.substring(0, 4));
	int gapMonth = Integer.parseInt(today.substring(4, 6)) - Integer.parseInt(birthDay.substring(4, 6));
	//out.print(gapYear);
	
	gapYear += (gapMonth < 0) ? -1 : 0; 
%>

	<h4><%= birthDay %>의 나이는 <%= gapYear %>세 입니다.</h4>
	
</body>
</html>
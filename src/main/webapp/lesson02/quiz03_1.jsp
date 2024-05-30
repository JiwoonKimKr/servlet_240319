<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BMI 계산</title>
    
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<meta charset="UTF-8">
</head>
<body>
	<div class="container">
	<%
		//request params 받아오기
		String strHeight = request.getParameter("height");
		String strWeight = request.getParameter("weight");
	    
	    if(strHeight == "" || strWeight == "" || strHeight.matches("[+-]?\\d*(\\.\\d+)?") == false || strWeight.matches("[+-]?\\d*(\\.\\d+)?") == false){
	    	response.sendRedirect("/lesson02/quiz03.jsp");
	    	return;
	    }
		
		int height = Integer.parseInt(strHeight);
		int weight = Integer.parseInt(strWeight);
		//out.print(height + "<br>" + weight);
		
		//bmi 계산
		double bmi = weight / ((height / 100.0) * (height / 100.0));
		//out.print(bmi);
		
		String result = null;
		
		//bmi 따른 판정 결과 도출하기;
		if (bmi <= 20){
			result = "저체중";
		} else if(bmi <= 25){ // 20.0~25
			//어짜피 20보다 큰 애들만 오니까 암묵적으로 앞쪽 값을 지운다
			result = "정상";
		} else if(bmi <= 30){ // 25.0~30
			result = "과체중";
		} else { // 30.0~
			result = "비만";
		}
		
	%>
		<h3>BMI 측정 결과</h3>
		<div class="display-4">당신은 <span class="text-info"><%= result %></span>입니다.</div>
		<p class="mt-3">
			BMI 수치: <%= bmi %>
		</p>
	</div>
	
</body>
</html>
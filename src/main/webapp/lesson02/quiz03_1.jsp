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
		String strHeight = request.getParameter("height");
		String strWeight = request.getParameter("weight");
	    
	    if(strHeight.matches("[+-]?\\d*(\\.\\d+)?") == false || strWeight.matches("[+-]?\\d*(\\.\\d+)?") == false){
	    	response.sendRedirect("/lesson02/quiz03.jsp");
	    	return;
	    }
		
		int height = Integer.parseInt(strHeight);
		int weight = Integer.parseInt(strWeight);
		
		double BMI = (double) weight / ((height / 100.0) * (height / 100.0));
		
		String result = "";
		
		if (BMI < 20){
			result = "저체중";
		} else if(BMI >= 20 && BMI <= 25){
			result = "정상";
		} else if(BMI >= 26 && BMI <= 30){
			result = "과체중";
		} else {
			result = "비만";
		}
		
	%>
	<h3>BMI 측정 결과</h3>
	<h2>당신은 <span class="text-info"><%= result %></span>입니다.</h2>
	<p class="mt-3">
		BMI 수치: <%= BMI %>
	</p>
	</div>
	
</body>
</html>
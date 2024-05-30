<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Quiz05_1</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
</head>
<body>
	<%
		String number1st = request.getParameter("number1st");
		String operator = request.getParameter("operator");
		String number2nd = request.getParameter("number2nd");
		if(number1st == "" || number2nd == "" || number1st.matches("[+-]?\\d*(\\.\\d+)?") == false || number2nd.matches("[+-]?\\d*(\\.\\d+)?") == false){
	    	response.sendRedirect("/lesson02/quiz05.jsp");
	    	return;
	    }
		
		String result = null;

		result = number1st + " " + operator + " " + number2nd;
		
		double answer = 0;
		if(operator.equals("+")){
			answer = Integer.parseInt(number1st) + Integer.parseInt(number2nd);
		}
		if(operator.equals("-")){
			answer = Integer.parseInt(number1st) - Integer.parseInt(number2nd);
		}
		if(operator.equals("x")){
			answer = Integer.parseInt(number1st) * Integer.parseInt(number2nd);
		}
		if(operator.equals("÷")){
			answer = Integer.parseInt(number1st) / Integer.parseInt(number2nd);
		}
	%>
	<div class="container">
		<h3>계산 결과</h3>
		<p class="display-4"><%= result + " = "%> <span class="text-primary"><%= answer %></span></p>
	</div>
</body>
</html>
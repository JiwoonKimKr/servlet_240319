<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>길이 변환 결과</title>
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h2>길이 변환 결과</h2>
		<%
			String strNum = request.getParameter("number");
			if(strNum.matches("[+-]?\\d*(\\.\\d+)?") == false){
				response.sendRedirect("/lesson02/quiz04.jsp");
		    	return;
			}
			
			int number = Integer.parseInt(strNum);
		%>
		<h4><%= number+ " cm" %></h4>
		<hr>
		
		<%
			//여러 값 Parameter 한 번에 받아오기; request.getParameterValues()함수 
			String[] arrStUnit = request.getParameterValues("standardUnit");

			//array가 null이 아닐 경우에만 처리한다는 예외 경우도 고려해야;
			if(arrStUnit == null){
				response.sendRedirect("/lesson02/quiz04.jsp");
		    	return;
			}
			
			for(String unit: arrStUnit){
				// 각 단위마다 독립적으로 생성하니까 각각 if문을 생성해야
				// 전 페이지에서 넘어온 Value값과 일치하는지 체크하는 구문
				if(unit.equals("inch")){
					double inch = number / 2.54;
					out.print("<h3>" + inch + " in" + "</h3>");
						//out함수는 jsp의 expression의 반대라고 볼 수 있다.
				}
				if(unit.equals("yard")){
					double yard = number / 0.9144 / 100;
					out.print("<h3>" + yard + " yd" + "</h3>");
				}
				if(unit.equals("feet")){
					double feet = number / 0.3048 / 100;
					out.print("<h3>" + feet + " ft" + "</h3>");
				}
				if(unit.equals("meter")){
					double meter = number / 100.0;
					out.print("<h3>" + meter + " m" + "</h3>");
				}
			}
		%>

	</div>
</body>
</html>
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
		//http://localhost/lesson02/quiz04.jsp?number=24&checkInch=on&checkYard=on&checkFeet=on&checkMeter=on
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
			boolean hasInchChecked = false;
			if(request.getParameter("checkInch") != null && request.getParameter("checkInch").equals("on")){
				hasInchChecked = true;		
			}
			boolean hasYardChecked = false;
			if(request.getParameter("checkYard") != null && request.getParameter("checkYard").equals("on")){
				hasYardChecked = true;		
			}
			boolean hasFeetChecked = false;
			if(request.getParameter("checkFeet") != null && request.getParameter("checkFeet").equals("on")){
				hasFeetChecked = true;		
			}
			boolean hasMeterChecked = false;
			if(request.getParameter("checkMeter") != null && request.getParameter("checkMeter").equals("on")){
				hasMeterChecked = true;		
			}
			
			double inch = (double) number / 2.54;
			double yard = (double) number / 0.9144 / 100;
			double feet = (double) number / 0.3048 / 100;
			double meter = (double) number / 100;
		%>
		
		<%
			if(hasInchChecked){
				%>
				<%= ("<h3>" + inch + " in" + "</h3>") %> <%
			}
		%> 
		<%
			if(hasYardChecked){
				%>
				<%= ("<h3>" + yard + " yd" + "</h3>") %> <%
			}
		%> 
		<%
			if(hasFeetChecked){
				%>
				<%= ("<h3>" + feet + " ft" + "</h3>") %> <%
			}
		%> 
		<%
			if(hasMeterChecked){
				%>
				<%= ("<h3>" + meter + " m" + "</h3>") %> <%
			}
		%> 
	</div>
</body>
</html>
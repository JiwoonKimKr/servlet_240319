<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장보기 목록</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>	
</head>
<body>
	<div class="container">
	<%
		List<String> goodsList = Arrays.asList(new String[]{ 
		    "저지방 우유", "요플레 4개", "딸기 1팩", "삼겹살 300g", "생수 6개", "주방 세제"
		});
	%>
	<p class="text-center display-4">장보기 목록</p>
	<table class="table text-center">
		<thead>
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">품목</th>
		    </tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < goodsList.size(); i ++){
					//개발자가 하는 일이 이렇게 서버 DB에서 값을 꺼내와서 for문으로 표현하는 일들!
					
					//중괄호의 사용법을 유의해야
					//칸 번호를 바꿔서 접근하지 말고, 인덱스에 하나를 더 하는 것으로 표현해야
						//하지만 i++로 기재하면 1을 더한 값을 저장까지 하기 때문에 X
			%>
				<tr>
					<td><%=(i + 1) %></td>	
					<td><%=goodsList.get(i)%></td>	
				</tr>
			<%
				}
			%>
		</tbody>
  		
	</table>
	</div>
</body>
</html>
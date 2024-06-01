<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교포문고</title>
	<%@ include file="/lesson02/quiz08_bookList.jsp"  %>
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>	
</head>
<body>
	<div class="container">
		<p class="display-4 text-center">책 목록</p>
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col" class="col-3">id</th>
					<th scope="col" class="col-3">표지</th>
					<th scope="col" class="col-6">제목</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Map<String, Object> book : list){
						String idBook = book.get("id").toString();
						String urlImage = book.get("image").toString();
						String title = book.get("title").toString();
				%>
				<tr>
					<td><%= idBook%></td>
					<td><a href="/lesson02/quiz08_1.jsp?id=<%=idBook%>"><img src="<%= urlImage%>" class="w-100" alt="image-of-a-book"></a></td>
					<td><a href="/lesson02/quiz08_1.jsp?id=<%=idBook%>"><%= title%></a></td>
				</tr>
				<% 
					}
				%>
			</tbody>
		</table>
		
	</div>

</body>
</html>
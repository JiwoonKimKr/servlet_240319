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
		<div class="contents d-flex">	
	<%
		int idBook = Integer.parseInt(request.getParameter("id"));
	
		for(Map<String, Object> book : list){
			int idCur = Integer.parseInt(book.get("id").toString());
			if(idCur == idBook){
				String urlImage = book.get("image").toString();
				String title = book.get("title").toString();
				String author = book.get("author").toString();
				String publisher = book.get("publisher").toString();
	%>
			<div class="col-4">
				<img src="<%= urlImage %>" class="w-100 img-thumbnail" alt="image-of-a-book">
			</div>
			<div class="col-8">
				<p class="h1 mb-0"><%= title %></p>
				<p class="text-info h2 mt-0 mb-0"><%=author %></p>
				<p class="text-secondary h3 mt-0"><%=publisher %></p>
			</div>
	<%				
			}
		}
	%>		
		</div>
	</div>

</body>
</html>
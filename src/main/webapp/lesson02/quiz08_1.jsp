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
		<div class="contents d-flex pt-2">	
	<%
		int idBook = Integer.parseInt(request.getParameter("id"));
		
		//보여줄 책 정보 뽑아내기
			//아예 Map을 뽑아서 변수로 저장한 후에 태그로 뿌리면, 조금 더 가독성이 좋아질 수 있다.
	
		Map<String, Object> target = null;
			
		for(Map<String, Object> book : list){
			if((int) book.get("id") == idBook){
				//int형이던 Integer class이던 "=="이란 문법으로 비교 가능하다!
						//그런데 현재는 Object type으로 Upcasting된 상황이다; 그래서 (int)붙여서 Downcasting을 해야
				target = book;
				break;
				//찾은 후 바로 for문을 나가면 훨씬 효율적이다.
					//id는 애초에 Primary Key인 탓에 겹치는 값이 아예 없다!
			}
		}
		//out.print(target) //Map의 값을 얻어냈다는 것 자체가 이제 View파일의 태그만 구성하면 끝이라는 뜻!

	%>
			<div class="col-6 pr-1">
				<img src="<%= target.get("image")%>" class="w-100 img-thumbnail" alt="cover-image-of-a-book">
			</div>
			<div class="col-6 pl-1">
				<div class="display-1 py-1 text-weight-bold"><%= target.get("title")%></div>
				<div class="display-3 text-info mb-1"><%= target.get("author")%></div>
				<div class="display-4 text-secondary"><%= target.get("publisher")%></div>
			</div>
	<%				

	%>		
		</div>
	</div>
</body>
</html>
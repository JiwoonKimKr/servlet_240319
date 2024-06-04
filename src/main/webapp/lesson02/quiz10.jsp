<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Melong</title>
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>	

	<link rel="stylesheet" type="text/css" href="/lesson02/quiz10_style.css">
</head>
<body>
	<%@ include file="/lesson02/quiz10_data.jsp" %>
	<div id="wrap" class="container">
		<header>
			<div class="d-flex align-items-center justify-content-start ">
				<div class="my-3" >
					<span class="h1 text-center text-success">Melong</span>
				</div>
				<form method="get" action="/lesson02/quiz10_info.jsp">
					<div class="input-group align-middle pl-3">
						<input type="text" name="keyword" class="form-control" placeholder="노래 검색하기">
						<div class="input-group-append">
							<button type="Submit" class="btn btn-info" id="button-addon2">검색</button>
						</div>
					</div>
				</form>
			</div>
		</header>
		<nav id="listMenu" class ="pl-3">
			<ul class="nav text-decoration-none">
				<li class="nav-item"><a class="nav-link" href="#">멜롱챠트</a></li>
				<li class="nav-item"><a class="nav-link" href="#">최신음악</a></li>
				<li class="nav-item"><a class="nav-link" href="#">장르음악</a></li>
				<li class="nav-item"><a class="nav-link" href="#">멜롱DJ</a></li>
				<li class="nav-item"><a class="nav-link" href="#">뮤직어워드</a></li>
			</ul>
		</nav>
		<section class="contents">
			<article id="article-Upside" class="border border-success rounded">
				<div class="d-flex w-100 p-2">
					<img id=imgThumbnail class="p-2 my-auto" src=<%= artistInfo.get("photo").toString() %> alt= "image-of-artist">
					<div class="h-100 p-3">
						<p class="h2 py-2 font-weight-bolder"><%= artistInfo.get("name").toString() %></p>
						<p class="h6"><%= artistInfo.get("agency").toString() %></p>
						<p class="h6"><%= artistInfo.get("debute").toString() + " 데뷔" %></p>
					</div>
				</div>
			</article>
			<article id="article-Downside" class="pt-4">
				<p class="h4 text-weight-bold">곡 목록</p>
				<table class="table table-sm table-hover text-center text-middle">
					<thead>
						<th scope="col" class="col-2">no</th>
						<th scope="col" class="col-5">제목</th>
						<th scope="col" class="col-5">앨범</th>
					</thead>
					<tbody>
						<%
							for(int i = 0; i < musicList.size(); i ++){
								Map<String, Object> song = musicList.get(i);
						%>
						<tr>
						<td><%= i + 1 %></td>
						<td><a href="/lesson02/quiz10_info.jsp?id=<%=song.get("id")%>"><%= song.get("title") %></a></td>
						<td><%= song.get("album") %></td>
						</tr>
						<% 
							}
						%>
					</tbody>
				</table>
			</article>
		</section>
		<footer>
			<address>
				<small class="text-secondary">Copyright 2024. melong All Rights Reserved.</small>
			</address>
		</footer>
	</div>
</body>
</html>
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
<%
	Map<String, Object> songCur = null;
	String keywordTyped = null;
	
	//여러 곡이 나올 경우도 존재하지만 이번 풀이에서는 생략
	
	if (request.getParameter("id") != null ){
		// 1. id(a 태그)
		int idSong = Integer.parseInt(request.getParameter("id")); //역시 다운케스팅 필요
		for(Map<String, Object> song: musicList){
			if((int) song.get("id") == idSong){
				songCur = song;
				keywordTyped = song.get("title").toString();
				break;
			}
		}
	} 
	
	if (request.getParameter("keyword") != null && request.getParameter("keyword").trim().isEmpty() == false){
		//2. form태그 input-text로 검색한 경우; "keyword"
		keywordTyped = request.getParameter("keyword");
		String keyword = keywordTyped.trim();
		for(Map<String, Object> song: musicList){
			if(song.get("title").toString().contains(keyword)){
				// <string>.equals(<object>)이더라도 object의 원래 타입이 string이면 잘 찾아준다.
				songCur = song;
				break;
			}
		}
		
	}
	
	%>
	<div id="wrap" class="container">
		<header>
			<div class="d-flex align-items-center justify-content-start ">
				<div class="my-3" >
					<span class="h1 text-center text-success">Melong</span>
				</div>
				<form method="get" action="/lesson02/quiz10_info.jsp">
					<div class="input-group align-middle pl-3">
						<input type="text" name="keyword" class="form-control" placeholder="노래 검색하기" value="<%= keywordTyped != null ? keywordTyped : "" %>">
						<div class="input-group-append">
							<button type="Submit" class="btn btn-success" id="button-addon2">검색</button>
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
	<%
	if(songCur != null){
		%>
		<section class="contents">
			<article id="article-Upside" class="border border-success rounded">
				<div class="d-flex w-100 align-items-center">
					<img id=imgThumbnail class="p-2" src=<%= songCur.get("thumbnail").toString() %> alt= "image-of-single">
					<div class="h-100 p-2 flex-column justify-content-center">
						<p class="display-4 mb-0 text-secondary"><%= songCur.get("title").toString() %></p>
						<p class="h5 text-success m-0 pb-2 font-weight-bolder"><%= songCur.get("singer").toString() %></p>
						<div class="d-flex text-secondary">
							<div>
								<div class="detailSong">앨범</div>
								<div class="detailSong">재생시간</div>
								<div class="detailSong">작곡가</div>
								<div class="detailSong">작사가</div>
							</div>
							<div class="ml-4">
								<div class="detailSong"><%= songCur.get("album").toString() %></div>
								<div class="detailSong"><%= (int) songCur.get("time") / 60 + ":" + (int) songCur.get("time") % 60 %></div>
								<div class="detailSong"><%= songCur.get("composer").toString() %></div>
								<div class="detailSong"><%= songCur.get("lyricist").toString() %></div>
							</div>
						</div>					
					</div>
				</div>
			</article>
			<article id="article-Downside" class="pt-4">
				<p class="h4 text-weight-bold">가사</p>
				<hr>
				<p>가사 정보 없음</p>
			</article>
		</section>
	<%
	} else {
	%>
	
	<p> 해당 검색어와 비슷한 결과를 찾지 못하였습니다.</p>
	
	<%
	}
	%>		
		<footer>
			<address>
				<small class="text-secondary">Copyright 2024. melong All Rights Reserved.</small>
			</address>
		</footer>
	</div>
</body>
</html>
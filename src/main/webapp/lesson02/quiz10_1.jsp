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
				<form method="get" action="/lesson02/quiz10.jsp">
					<div class="input-group align-middle pl-3">
						<input type="text" name="search" class="form-control" placeholder="노래 검색하기">
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
		<section class="contents">
			<article id="article-Upside" class="border border-success rounded">
				<div class="d-none d-flex w-100 align-items-center">
					<%
						String titleSong = null; 
						if(request.getParameter("title") != null){
							titleSong = request.getParameter("title").trim();
						}
						
						Integer idSong = null;
						if(request.getParameter("id") != null){
							idSong = Integer.parseInt(request.getParameter("id"));
						}
						
						if(titleSong == null && idSong == null){
							response.sendRedirect("/lesson02/quiz10.jsp");
						}
						
						Map<String, Object> songCur = null;
					
						for(Map<String, Object> song: musicList){
							if(song.get("title").equals(titleSong) || song.get("id") == idSong){
								songCur = song;
								break;
							}
						}
							
						String urlImg = songCur.get("thumbnail").toString();
					
						if(titleSong == null){
							titleSong = songCur.get("title").toString();
						}
						String singer = songCur.get("singer").toString();
						String album = songCur.get("album").toString();
						int playingTime = Integer.parseInt(songCur.get("time").toString());
						int minute = playingTime / 60;
						int seconds = playingTime % 60;
						
						String composer = songCur.get("composer").toString();
						String lyricist = songCur.get("lyricist").toString();
					%>
					<img id=imgThumbnail class="p-2" src=<%= urlImg %> alt= "image-of-single">

					<div class="h-100 p-2 flex-column justify-content-center">
						<p class="h3 text-secondary"><%= titleSong %></p>
						<p class="h5 text-success m-0 pb-2 font-weight-bolder"><%= singer %></p>					
						<table class="p-0 tableSong">
							<tbody class="text-secondary">
								<tr>
									<td >앨범</td>
									<td class="pl-4"><%= album %></td>
								</tr>
								<tr>
									<td>재생시간</td>
									<td class="pl-4"><%= minute + ":" + seconds %></td>
								</tr>
								<tr>
									<td>작곡가</td>
									<td class="pl-4"><%= composer %></td>
								</tr>
								<tr>
									<td>작사가</td>
									<td class="pl-4"><%= lyricist %></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</article>
			<article id="article-Downside" class="pt-4">
				<p class="h4 text-weight-bold">가사</p>
				<hr>
				<P>가사 정보 없음</p>
				
			</article>
		</section>
		<footer>
			<address>
				<small>Copyright 2024. melong All Rights Reserved.</small>
			</address>
		</footer>
	</div>
</body>
</html>
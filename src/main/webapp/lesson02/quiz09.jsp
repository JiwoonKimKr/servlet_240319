<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>채널 안내</title>
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>	

</head>
<body>
	<%
	    List<Map<String, String>> list = new ArrayList<>();
	    Map<String, String> map = new HashMap<String, String>() {{ put("ch", "5"); put("name", "SBS"); put("category", "지상파"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "7"); put("name", "KBS2"); put("category", "지상파"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "9"); put("name", "KBS1"); put("category", "지상파"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "11"); put("name", "MBC"); put("category", "지상파"); } };
	    list.add(map);
	
	    map = new HashMap<String, String>() {{ put("ch", "54"); put("name", "OCN"); put("category", "영화"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "56"); put("name", "Screen"); put("category", "영화"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "57"); put("name", "Mplex"); put("category", "영화"); } };
	    list.add(map);
	
	    map = new HashMap<String, String>() {{ put("ch", "30"); put("name", "KBS 드라마"); put("category", "드라마"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "32"); put("name", "MBC 드라마"); put("category", "드라마"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "34"); put("name", "Olive"); put("category", "드라마"); } };
	    list.add(map);
	
	    map = new HashMap<String, String>() {{ put("ch", "3"); put("name", "tvN"); put("category", "예능"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "28"); put("name", "MBC Every1"); put("category", "예능"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "48"); put("name", "JTBC2"); put("category", "예능"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "49"); put("name", "E채널"); put("category", "예능"); } };
	    list.add(map);
	
	    map = new HashMap<String, String>() {{ put("ch", "120"); put("name", "SPOTV"); put("category", "스포츠"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "121"); put("name", "KBSN 스포츠"); put("category", "스포츠"); } };
	    list.add(map);
	%>
	<div class="container">
		<header>
			<a href="/lesson02/quiz09.jsp" class="text-decoration-none">
				<p class="h2 font-weight-bolder text-danger text-center">SK Broadband IPTV</p>
			</a>
		</header>
		<nav class="category">
			<ul class="nav bg-danger text-center justify-content-around">
				<li class="nav-item">
					<a class="nav-link text-light" href="/lesson02/quiz09.jsp?category=전체">전체</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-light" href="/lesson02/quiz09.jsp?category=지상파">지상파</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-light" href="/lesson02/quiz09.jsp?category=드라마">드라마</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-light" href="/lesson02/quiz09.jsp?category=예능">예능</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-light" href="/lesson02/quiz09.jsp?category=영화">영화</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-light" href="/lesson02/quiz09.jsp?category=스포츠">스포츠</a>
				</li>
			</ul>
		</nav>
		<div class="contents">
			<table class="table table-hover text-center">
				<thead>
					<tr class="">
						<th scope="col" class="col-2">채널</th>
						<th scope="col" class="col-5">채널명</th>
						<th scope="col" class="col-5">카테고리</th>
					</tr>
				</thead>
				<tbody>
				<%
					//request param
					String category = null;
					boolean hasFilter = false;
					if(request.getParameter("category") != null){

						category = request.getParameter("category");
						if(category.equals("전체") == false){
							hasFilter = true;
						}
					}
				
					String idxCh = null;
					String nameCh = null;
					String catCh = null;
					for (Map<String, String> channel : list){
						if(hasFilter && channel.get("category").equals(category) == false){
							continue;
						}
				%>
				<%
						idxCh = channel.get("ch");
						nameCh = channel.get("name");
						catCh = channel.get("category");
				%>
					<tr>
						<th scope="row"><%= idxCh %></th>
						<td><%= nameCh %></td>
						<td><%= catCh %></td>
					</tr>
				<%	
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
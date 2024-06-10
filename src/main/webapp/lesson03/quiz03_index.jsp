<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HONG당무마켓</title>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="/lesson03/quiz03_style.css">
</head>
<body>
	<div id="wrap" class="mx-auto">
		<header>
			<jsp:include page="/lesson03/quiz03_header.jsp"></jsp:include>
		</header>
		<section class="contents">
			<section class="pageForSell mt-4 d-flex flex-wrap mx-auto">
<%
		//db connect
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		//select query
		String querySelect ="SELECT a.id, a.title, a.price, b.nickname, a.pictureUrl from used_goods as a join seller as b on a.sellerId = b.id;";
		ResultSet res = ms.select(querySelect);
		while(res.next()){
%>
				<article class="articleForSell rounded-lg">
					<div class="m-1 row-8 w-100">
<%
			if(res.getString("pictureUrl") != null){
%>
						<img src="<%=res.getString("pictureUrl") %>" width="212" height="120">
<%
			} else{
%>						<div class="nullImg d-flex align-items-center justify-content-center">
							<p class="h4 text-center">이미지 없음</p>
						</div>
<%
			}
%>					
					</div>
					<div class="row-4 w-100 mt-2 ml-3 d-flex flex-column justify-content-around">
						<p class="h6 font-weight-bolder mb-sm-1 w-100"><%= res.getString("title") %></p>
						<p class="text-secondary mb-sm-1 w-100"><%= res.getString("price") +" 원" %></p>
						<p class="coralText font-weight-bold mb-sm-1 w-100"><%= res.getString("nickname") %></p>
					</div>
				</article>
<%				
		}
%>			
			</section>
		</section>
	</div>
<%
	//db disconnet
	ms.disconnect();
%>
</body>
</html>
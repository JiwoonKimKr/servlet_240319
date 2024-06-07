<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HONG당무마켓</title>
	<!-- jQuery Uncompressed -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="/lesson03/quiz03_style.css">
</head>
<body>
	<div id="wrap" class="mx-auto">
		<header>
			<jsp:include page="/lesson03/quiz03_header.jsp"></jsp:include>
		</header>
		<section class="contents">
			<article>
				<div>
					<p class="display-4 my-3">물건 올리기</p>
				</div>
				<div>
					<form method="post" action="/lesson03/quiz03_insert">
						<div class="d-flex justify-content-around">
							<div class="input-group col-3 p-0">
							  	<select class="custom-select bg-secondary text-white" id="sellerId" name="sellerId">
								    <option selected>-아이디 선택</option>
<%
	//db conn
	MysqlService ms = MysqlService.getInstance();
	ms.connect();

	String selectQuery = "select id, nickname from `seller`";
	ResultSet res = ms.select(selectQuery);
	
	while(res.next()){
%>
								    <option value="<%= res.getInt("id") %>"> <%= res.getString("nickname") %> </option>
<%		
	}
	ms.disconnect();
%>								    
							  	</select>
							</div>
							<div class="col-4 p-0">
								<input type="text" id="title" name="title" class="form-control" placeholder="제목">
							</div>
							<div class="input-group col-3 p-0">
								<input type="text" class="form-control" placeholder="가격" id="price" name="price">
								<div class="input-group-append">
									<span class="input-group-text" id="basic-addon2">원</span>
								</div>
							</div>
						</div>						
						<textarea class="form-control my-3" rows="5" id="description" name="description" placeholder="제품 설명"></textarea>
						<div class="input-group">
						  <div class="input-group-prepend">
						    <span class="input-group-text">이미지URL</span>
						  </div>
						  <input type="text" id="pictureUrl" name="pictureUrl" class="form-control">
						</div>						
						<button id="submitForm" type="submit" class="btn btn-light w-100 mt-3">저장</button>
					</form>
				</div>
			</article>
		</section>		
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#submitForm").on('click', function(){
			
			let regEx = /^[0-9]*$/;
			
			if($('#sellerId').val() == "-아이디 선택" || regEx.test($('#sellerId').val()) == false ){
				alert("작성자를 선택하여 주십시오.");
				return false;
			}
			
			if($('#title').val() == ""){
				alert("제목을 입력하여 주십시오.");
				return false;
			}
			let title = $('#title').val().trim();
			$('#title').val(title);
			
			if($('#price').val() == "" || regEx.test($('#price').val().trim()) == false ){
				alert("숫자로만 입력한, 올바른 가격을 입력하여 주십시오");
				return false;
			}
			
			let price = $('#price').val().trim();
			$('#price').val(price);
			
			if($('#description').val() == ""){
				alert("제품에 대한 설명을 기입하여 주십시오.");
				return false;
			}
			let description = $('#description').val().trim();
			$('#description').val(description);
			
			let RegExpURL = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
			if($('#pictureUrl').val().trim() != "" && RegExpURL.test($('#pictureUrl').val().trim()) == false){
				alert("올바른 이미지 url을 입력하여 주십시오");
				return false;
			}
			
			let pictureUrl = $('pictureUrl').val().trim();
			$('#pictureUrl').val(pictureUrl);
			
			return true;
		})
	});	
</script>	
</body>
</html>
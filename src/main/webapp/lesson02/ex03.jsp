<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POST FORM태그_ex03</title>
</head>
<body>
	<form method="post" action="/lesson02/ex03_1.jsp">
		1. 별명은 무엇입니까?
		<input type="text" name="nickname"><br><br>
		
		2. 취미은 무엇입니까?
		<input type="text" name="hobby"><br><br>
		
		3. 강아지 or 고양이?
		<label>강아지 <input type="radio" name="animal" value="dog"></label>
			<!-- 라디오 태그의 name이 이번에도 jsp에서 그룹명으로 쓰인다;
				 하지만 개별적으로는 value값이 달라야-->
		<label>강아지 <input type="radio" name="animal" value="cat"></label> <br><br>
		
		4. 다음 중 선호하는 것을 모두 고르세요.<br>
		<label>민트 초코<input type="checkbox" name="food" value="민초"> </label> 
		<!-- checkbox 타입도 그룹명을 name으로 설정하고, value는 한글이어도 된다. -->
		<label>하와이안 피자<input type="checkbox" name="food" value="하와이안 피자"> </label> 
		<label>번데기<input type="checkbox" name="food" value="번데기"> </label> <br><br>
		
		5. 좋아하는 과일을 선택하세요. <br>
		<select name="fruit">
			<option>딸기</option>
			<option>토마도</option>
			<option>바나나</option>
			<option>망고</option>
			<option>블루베리</option>
		</select> <br><br>
		
		<button type="submit">서버 전송</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POST FORM태그_서버페이지_ex03_1</title>
</head>
<body>
	<%
		String nickname = request.getParameter("nickname");
		String hobby = request.getParameter("hobby");
		String animal = request.getParameter("animal");
		//4번째는 하나의 값이 아니라 여러 개일 수 있으니까, 배열로 받아와야한다. 
		//getParameterValues()라는 함수를 써야
			//해당 항목의 여러 값을 받아야 하는 경우에 적용;
		String[] arrFood = request.getParameterValues("food");
		String fruit = request.getParameter("fruit");
	%>
	
	<table border="1">
		<tr>
			<th>별명</th>
			<td><%= nickname %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td><%= hobby %></td>
		</tr>
		<tr>
			<th>선호하는 동물</th>
			<td><%= animal.equals("dog") ? "강아지" : "고양이"%></td>
		</tr>
		<tr>
			<th>선호하는 음식</th>
			<td>
				<% 
					if(arrFood != null){
						
						String result = "";
						//혹여나 선택된 값이 없으면 null로 넘어가는 탓에, 조심해야 한다!
						for(String food : arrFood){
						result += food + ",";
						}
						// 맨 뒤에 붙은 ","(콤마) 제거하기!
							// 만약 abc에서 마지막 c만 추출하기; substring()함수
								//abc의 길이에서 하나를 뺀 길이를 기재
						result = result.substring(0, result.length() - 1 );
						out.print(result);
					}
					//out.print(String.join(",",arrFood));
				%>
			</td>
		</tr>
		<tr>
			<th>선호하는 과일</th>
			<td><%= fruit %></td>
		</tr>

	</table>

</body>
</html>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배탈의 민족</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>	
</head>
<body>
	<%
		//이 Map 하나 하나가 DB에서 꺼내오는 Record와 똑같은 형태이다.
		
		//필터링 조건은 나중에 넣어보는 접근으로 단계별로 구현해보기
		//에러 발생할 경우 에러메시지 타입 잘 체크해보기
		
		//반대로 데이터 형태를 보고 어떤 자료구조로 데이터를 넣을 수 있을까 반대 방향도 고민해보기
		List<Map<String, Object>> list = new ArrayList<>();
	    Map<String, Object> map = new HashMap<String, Object>() {{ put("name", "버거킹"); put("menu", "햄버거"); put("point", 4.3); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BBQ"); put("menu", "치킨"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "교촌치킨"); put("menu", "치킨"); put("point", 4.1); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "도미노피자"); put("menu", "피자"); put("point", 4.5); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "맥도날드"); put("menu", "햄버거"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BHC"); put("menu", "치킨"); put("point", 4.2); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "반올림피자"); put("menu", "피자"); put("point", 4.3); } };
	    list.add(map);
	%>
	<%
		String menu = request.getParameter("keyword");
		if(menu == ""){
	    	response.sendRedirect("/lesson02/quiz07.jsp");
	    	return;
		}
		menu = menu.trim();
		
		//4.0이상 체크박스 Flag ; 기본값이 false여서 체크 되면 필터링해서 4.0이하 값 출력 안 함
			//checkbox의 parameter는 체크가 되어 있으면, "true"라는 <String>으로 넘어옴
				//하지만 체크가 안 되어 있으면, 그냥 null 값으로 기재되어 있다.
		boolean excludeUnder4 = request.getParameter("excludeUnder4") != null;
			//그냥 변수 설정 안하고, excludeUnder4라는 <String>이 null값이 아닌지 추후 체크하는 것도 괜찮다;

	%>
	<div class="container">
		<p class="text-center display-3">검색 결과</p>
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">메뉴</th>
					<th scope="col">상호</th>
					<th scope="col">별점</th>
				</tr>
			</thead>
			<tbody>
				<%
				//Map의 value가 Object인 이유는 <string>말고도 소수점의 숫자값 등도 넣기 위해서;
				for(Map<String, Object> dish : list){
					//필터링 조건들 기재
						//태그들 안에 else if문을 덕지덕지 붙이면 너무 지저분하다!
						//필터링 조건들을 continue문을 활용해서 skip하는 방식으로
					if(dish.get("menu").equals(menu) == false){
						continue;
					}
					if(excludeUnder4 && (double)dish.get("point") <= 4.0){
						//dish.get("point")가 object 타입으로 저장되어 있는 탓에 오류가 발생한다!
							//그래서 double형으로 캐스팅이 필요하다!
							//이번에는 String값을 double로 바꾸는 게 아니라서, parsing이 아니다!
					
						//JAVA는 데이터가 입력될 때 Object 클래스로 Upcasting이 되기 전, 기존 데이터 형태를 알고 있다!
							//원래 double형이라는 걸 알고 있다!
							
						continue; //안 뿌리고 skip!
					}
				%>
				<tr>
					<td><%= menu %></td>
					<td><%= dish.get("name") %></td>
					<td><%= dish.get("point") %></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
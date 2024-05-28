package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex03")
public class GetMethodEx03 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//테스트용 주석 추가 (28 05 2024)
		
		//Get 형식으로 받아오는 Request를 처리하겠다는 뜻
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		//request parameter 꺼내기
		String userId = request.getParameter("user_id"); //반드시 html에 지정한 알파벳과 일치해야
		String name = request.getParameter("name");
		Integer age = Integer.parseInt(request.getParameter("age")); //string으로 넘어온 age 값을 integer로 파싱
			// parseInt 구문은 null 값이 들어온 탓에 500번 error가 발생한다. 그래서 맨 아래쪽 링크만 실행되고 있다.
				//그래서 parseInt 안쪽 parameter에 적혀 있는 곳에서 null인지 아닌지를 체크해야.
		
		PrintWriter out = response.getWriter();
//		out.println("서블릿 수행"); 
//		//lesson01/ex03을 직접 주소창에 치는 것도 똑같은 Get 요청이다.
//		out.println("userId: " + userId);
//		out.println("name: " + name); //머리 속으로 html과 servlet(서버) 그림을 직접 그려봐야
//		out.println("age: " + age);
		
		
		//이제는 응답을 plain이나 html이 아니라 JSON 형식으로
		// {"user_id":"pup_seoritae", "name":"서리태", "age":5} 
		// 어떤 클래스에서는 map 형식으로 key value쌍이 주어지면 바로 JSON파일을 만들어주는 메소드가 존재한다.
		// 직접 JSON을 작성하면서 눈에 익어야
		
		out.println("{\"user_id\":\"" + userId
				+ "\",\"name\":\"" + name + "\", \"age\":" + age + "}"); 
			//JSON의 기본 규칙은 큰 따옴표를 써야; 그런데 자바의 큰 따옴표와 헷갈리니까 역슬레시 \를 함께 써줘야
	}

}

package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz10")
public class PostMethodQuiz10 extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//Response Header 작성; 이제 인코딩은 생략
		response.setContentType("text/html");
		
		//Request Parameters 
		String idVerify = request.getParameter("idVerify");
		String passwordVerify = request.getParameter("passwordVerify");
		
		idVerify = idVerify.trim();
		passwordVerify = passwordVerify.trim();
		
		// 아이디/비밀번호 일치 확인 -> 출력도 동시에
		PrintWriter out = response.getWriter();
		
		out.print("<html><head></head><body>");
		
		//Map 자료구조는 무조건 Key로 접근하는 시도가 최적의 방식!
		if(userMap.get("id").equals(idVerify) == false) { //String 비교는 무조건 equals()! 
			out.print("id가 일치하지 않습니다.");
		} else if(userMap.get("password").equals(passwordVerify) == false){
			out.print("password가 일치하지 않습니다.");
		} else {
			String nameUser = userMap.get("name");
			out.print(nameUser + "님 환영합니다!");			
		}
		out.print("</body></html>");
	}
	
	//임의로 딱 한 명의 id와 비밀번호를 담고 있는 map구조이다. 원래라면 list<map> 구조였을 것이다.
	//DB 대용의 Collection
	private final Map<String, String> userMap =  new HashMap<String, String>() {
	    {
	        put("id", "marobiana");
	        put("password", "qwerty1234");
	        put("name", "신보람");
	    }
	};
}
//Spring으로 넘어가면 너무 복잡해지면서 이해하기 힘들 수도;
//웹 부분에서는 계속 그림(다이어그램)으로 request와 response로 어떤 것이 오고 가는지 표현할 수 있어야

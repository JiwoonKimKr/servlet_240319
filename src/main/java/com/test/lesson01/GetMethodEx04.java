package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex04") // html에 기재했던 해당 주소를 그대로 복사해오는 게 좋다.
public class GetMethodEx04 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		//Request Parameters
		String userId = request.getParameter("userId"); //id말고 name이 중요하다! 복사해오는 게 안전하다!
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
//parameter가 여러 개가 들어오니까 이제는 Debugging으로 체크해야
		
		PrintWriter out = response.getWriter();
		
		out.println("<html><head><title>회원정보</title></head><body>");
		out.println("<table border=1>");
		out.println("<tr><th>아이디</th>" + "<td>"+ userId+ "</td>"+ "</tr>");
		out.println("<tr><th>이름</th>" + "<td>"+ name+ "</td>"+ "</tr>");
		out.println("<tr><th>생년월일</th>" + "<td>"+ birth+ "</td>"+ "</tr>");
		out.println("<tr><th>이메일</th>" + "<td>"+ email+ "</td>"+ "</tr>");
		out.println("</table>");
		out.println("</body></html>");
		// 자동으로 tbody를 브라우저가 생성해줬다.
		// parameter 값이 자동으로 넘겨진 것을 확인 가능
			//http://localhost/lesson01/ex04?userId=seoritae&name=%EC%84%9C%EB%A6%AC%ED%83%9C&birth=20201020&email=seoritae%40google.com
		//7번 문제 숙제
	}
	
	

}

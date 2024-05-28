package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex05")
public class PostMethodEx05 extends HttpServlet {

	@Override
	//이제 doGet이 아니라 doPost로 작성해야!
		//아예 다른 method를 쓴다는 뜻이다!; doGet과 parameter은 같다
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//response header
//		response.setCharacterEncoding("utf-8"); //이제 필터링 덕에 생략 가능!
		response.setContentType("text/html");
		
		//request params
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		
		//테이블 출력 ; ex04에서 그대로 복사해옴
		PrintWriter out = response.getWriter();
		
		out.println("<html><head><title>회원정보</title></head><body>");
		out.println("<table border=1>");
		out.println("<tr><th>아이디</th>" + "<td>"+ userId+ "</td>"+ "</tr>");
		out.println("<tr><th>이름</th>" + "<td>"+ name+ "</td>"+ "</tr>");
		out.println("<tr><th>생년월일</th>" + "<td>"+ birth+ "</td>"+ "</tr>");
		out.println("<tr><th>이메일</th>" + "<td>"+ email+ "</td>"+ "</tr>");
		out.println("</table>");
		out.println("</body></html>");
		
	}
}

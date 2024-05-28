package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz09")
public class PostMethodQuiz09 extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//response header
			//필러링으로 인코딩 타입 이미 설정한 덕분에 이제는 기재 안 해도 된다.
		response.setContentType("text/html");
		
		//request params
		String nameApplicant = request.getParameter("nameApplicant");
		String introApplicant = request.getParameter("introApplicant");
		
		//출력
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>입사지원서</title></head><body>");
		out.print("<b>" + nameApplicant+ "</b>님 지원이 완료되었습니다.");
		out.print("<br>");
		out.print("<h3>지원 내용</h3>");
		out.print("<p>" + introApplicant + "</p>");
		out.print("</body></html>");
	}
	//오늘 과제: 문제 8번 - '맛집' 진하게 표시
	//내일 Github 세팅할 예정 : github.com 회원가입 해와야
}

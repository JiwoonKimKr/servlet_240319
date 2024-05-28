package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz05")
public class GetMethodQuiz05 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		//먼저 request parameters를 표시하기; 줄여서ㅕ param이라고 지칭 
		String numStr = request.getParameter("number");
		Integer num = Integer.parseInt(numStr != null ? numStr : "0" );
			//산술 연산 해야하니까 Interger로 파싱해야
			//Integer.valueOf()도 null값 들어가면 에러 발생한다!
		
		//For문 돌리기 전에 PrintWriter 만들어두기 
		PrintWriter out = response.getWriter();
		
		out.println("<html><head><title>"+ num + "단" + "</title><head><body>");
		out.println("<ul>");
		for(int i = 1; i < 10; i ++) { //내가 뭘 반복해야 하는지 Scope를 잘 파악해야
			out.println("<li>"+ num + " X " + i +" = "+ (num * i) + "</li>");
		}
		out.println("</ul>");
		out.println("<body></html>");
	}

}

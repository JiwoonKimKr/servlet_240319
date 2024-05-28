package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex02") //이제 xml 할 필요 없어진다.
public class UrlMappingEx02 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//한글 깨짐 방지
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		//이제 html로 이해하기 시작
		//서블릿: 자바 코드가 있는 곳에서 HTML이 함께 들어가는 형식;
			//Server code + View code가 짬뽕된 형태여서 매우 지저분한 형태
		
		// 1+2+....+10 합계
		
		int sum = 0;
		
		for (int i = 1; i <= 10; i ++) {
			sum += i;
		}
		
		PrintWriter out = response.getWriter();
		out.println("<html> <head><title>합계</title></head> <body>");
		//println을 html에서 아무리 쓴다 한들 다음 줄로 안 내려간다. \br로 써야
		out.print("합계: <b> "+ sum + "</b>"); // <string>사이에 변수를 넣는 방식
		
		out.println("</body> </html>");
		
	}

}

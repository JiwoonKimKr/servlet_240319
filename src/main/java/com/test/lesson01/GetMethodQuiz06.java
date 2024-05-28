package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz06")
public class GetMethodQuiz06 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		Integer num1 = Integer.parseInt(request.getParameter("num1"));
		Integer num2 = Integer.parseInt(request.getParameter("num2"));
		
		PrintWriter out = response.getWriter();
		
//		{
//		    "addition": 1570,
//		    "subtraction": 1430,
//		    "multiplication": 105000,
//		    "division": 21
//		}

		//JSON String으로 만들기
		out.println("{\"addition\": " + (num1 + num2)
				+ ", \"subtraction\": " + (num1 - num2)
				+ ", \"multiplication\": " + (num1 * num2)
				+ ", \"division\": " + (num1 / num2)
				+ "}");
		
		//나중에 스프링으로 넘어가면 이런 걸 다 알아서 해준다.
	}
	

}

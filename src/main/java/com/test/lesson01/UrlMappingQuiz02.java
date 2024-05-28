package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingQuiz02 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		//항상 상단에 위치시켜야 - response header에 위치시키는 행위
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		Date now = new Date();

		out.print("현재 시간은 ");
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH시 mm분 ss초 입니다.");
		out.print(sdf.format(now));
	}
}

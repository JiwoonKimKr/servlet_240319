package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingQuiz01 extends HttpServlet{
	
	@Override 
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//한글 깨짐 방지 ; 매번 넣을 예정
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		
		//요청에 반응하는 PrintWriter 불러오기
		PrintWriter out = response.getWriter();
		
		//날짜 불러올 함수 
		Date now = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("오늘의 날짜는 yyyy년 M월 d일"); //05월 01일이 아니라 5월 1일로 나오도록!
		out.println(sdf.format(now));
				
	}
	
}

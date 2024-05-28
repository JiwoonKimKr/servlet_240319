package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingEx01 extends HttpServlet{
	
	@Override // paramater들 적을 때도 부모클래스처럼 순서도 맞춰줘야 
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 아래 코드는 반드시 메소드의 가장 위쪽에 위치해야 한다!!!
	    response.setCharacterEncoding("utf-8");
	    response.setContentType("text/plain"); //순수한 글자라는 뜻
	    
	    
		//응답에 글을 써서 보내준다는 의미
		PrintWriter out = response.getWriter();
		out.println("안녕하세요.");
		//브라우저에서 요청이 들어오면,(주소를 치고 들어가면)
		//이제 톰캣이 서블릿 후보를 찾아서 매핑을 하여 여기 기재된 반응으로 문자열 "안녕하세요"가 내려간다.
		//그리고 반응으로 내려간 문자열이 브라우저에 뿌려진다.
		
		// 날짜 
		Date now = new Date(); //반드시 JAVA의 util date를 쓴다
		out.println(now);
		
		//formatter
		//2024-05-23 오후 16:50:30 이런 형식으로 표현할 예정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
		out.println(sdf.format(now));	
	}
}

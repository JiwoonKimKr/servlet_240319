package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz03")
public class UrlMappingQuiz03 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		out.println("<html><head><title>마론달 뉴스</title></head>");
		out.println("<body>");
		out.println("<h1>[단독] 고양이가 야옹해</h1>");
		out.println("<p>기사 입력 시간: " + sdf.format(now) + "</p>");
		out.println("<hr>");
		out.println("<p>끝</p>");
		out.println("</body>");
		out.println("</html>");
	
		//모습이 잘 나오더라도 태그가 어긋난 상태일 수 있으니까,
		//개발자도구에서 elements로 체크해봐야
		
		//요즘 네트워크에서 오류가 나서 크롬에서 조회가 안 되곤 한다.
	}

}

package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz10")
public class PostMethodQuiz10 extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		
		String idVerify = request.getParameter("idVerify");
		String passwordVerify = request.getParameter("passwordVerify");
		
		idVerify = idVerify.trim();
		passwordVerify = passwordVerify.trim();
		
		PrintWriter out = response.getWriter();
		
		out.print("<html><head></head><body>");
		
		if(userMap.get("id").equals(idVerify) == false) {
			out.print("id가 일치하지 않습니다.");
			out.print("</body></html>");
			return;
		}
		
		if(userMap.get("password").equals(passwordVerify) == false) {
			out.print("password가 일치하지 않습니다.");
			out.print("</body></html>");
			return;
		}
	
		String nameUser = userMap.get("name");
		
		out.print(nameUser + "님 환영합니다!");
		out.print("</body></html>");
		
	}
	
	private final Map<String, String> userMap =  new HashMap<String, String>() {
	    {
	        put("id", "marobiana");
	        put("password", "qwerty1234");
	        put("name", "신보람");
	    }
	};
}

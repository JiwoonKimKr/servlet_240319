package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz07") //태그에 적혀있던 주소 그대로 긁어서 복붙하기
public class GetMethodQuiz07 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
//먼저 주석으로 흐름으로 기재해야
		//Response Header Setting 맨 첫 번째; 내가 응답으로 내릴 내용 타입과 문자 인코딩 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		//request params들
		String addressCall = request.getParameter("addressCall").trim();
		String idCardCall = request.getParameter("idCardCall").trim();
		String strCostCall = request.getParameter("costCall").trim();
		Integer costCall = Integer.parseInt(strCostCall.trim()); 
		
		
		//response 출력(분기)
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>주문결과</title></head><body>");
		
		//Front-End에서 하던 Validation와는 달리 따로 따로 구별해서 출력할 예정
		if(addressCall.contains("서울시") == false) { //가독성 때문에 !로 표현한 부정문보다는 false인지 명확히 구술
			out.print("배달 불가 지역입니다.");
		} else if(idCardCall.contains("신한카드")) {
			out.print("결제 불가 카드입니다.");
		} else { 
			out.print(addressCall + "<b> 배달 준비 중</b>");	
			out.print("<br>");
			out.print("결제금액: "+ costCall +"원");			
		}
		
		out.print("</body></html>");
	}
}

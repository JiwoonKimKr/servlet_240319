package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz08")
public class GetMethodQuiz08 extends HttpServlet {


	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		//1st) Response header Set
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		
		//2nd) Request Params
		StringBuilder sb = new StringBuilder();
		
		String typedSearch = request.getParameter("typedSearch");

		typedSearch = typedSearch.trim();
		sb.append("<b>");
		sb.append(typedSearch);
		sb.append("</b>");
		
		String bold = sb.toString();
//		String bold = "<b>".concat(typedSearch).concat("</b>");
//		String bold = ("<b>" + typedSearch + "</b>");
		
		//3rd) list 정의
		List<String> list = new ArrayList<>(Arrays.asList(
		        "강남역 최고 맛집 소개 합니다.", 
		        "오늘 기분 좋은 일이 있었네요.", 
		        "역시 맛집 데이트가 제일 좋네요.", 
		        "집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
		        "자축 저 오늘 생일 이에요."));
		
		//4th) 탐색 출력
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>검색 결과</title></head><body>");
		
//		for (String line : list) {
//			if(line.contains(typedSearch)) {
//				out.print(line.replace(typedSearch, bold) + "<br>");
//			}
//		}
		
		Iterator<String> iter = list.iterator();
		while(iter.hasNext()) {
			String line = iter.next();
			if(line.contains(typedSearch)) {
				out.print(line.replace(typedSearch, bold) + "<br>");
				//진한 글자로 나오는 건 내일 풀이해주실 예정; 과제!
			}
		}
		
		out.print("</body></html>");
	}

}
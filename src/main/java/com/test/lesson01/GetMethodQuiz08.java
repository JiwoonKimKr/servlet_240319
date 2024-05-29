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
				//1) 첫 번째 방식; 해당 단어를 찾았으면 앞 뒤로 <b> </b> 태그를 붙여줘서 바꾼다; Replace라는 함수 사용;
					// replace라는 함수로 모든 단어를 찾는 족족 다 바꿔준다.
					//replace는 string으로 반환할 뿐 저장을 하진 않는다!
					//제일 간단하고 좋은 방식
//				out.print(line.replace(typedSearch, bold) + "<br>");
				
				//2) 두 번째 방식; split() 함수로 댕강댕강 자르고 단어를 탐색한 후 찾아보는 방식?;
					//애초에 정규식에 해당하는 문자를 "맛집" 자체로 설청해서 split() 함수를 쓰는 방식
					//맛집이란 단어가 하나밖에 없다고 가정하는 경우!
//				String[] words = line.split(typedSearch); // 무조건 idx가 0이면 무조건 맛집 앞 단어들, 1이면 뒤쪽 단어;
//				out.print(words[0] + "<b>" + typedSearch + "</b>" + words[1] + "<br>");
				
				//3) 실무개발자들이 쓰는 방식들
				//line.indexOf(typedSearch)로 맛집이 발견된 인덱스를 찾고
				// <b>라는 문자열을 앞에 더한 후, 인덱스를 3개 더 해준다.
				// 뒤에 </b>를 추가하는 가정
				
				//4) 만약 단어 여러 개를 발견해야 하는 경우, split() 함수를 이용해서 맛집을 찾는 방식을 더 발전시키는 것도 좋은 연습!
			}
		}
		
		out.print("</body></html>");
	}

}
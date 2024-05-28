package com.test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")  //모든 주소에 대해 필터링을 시행하겠다는 뜻에서 * stellar문자를 넣는다!
public class CharacterEncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 필터가 여러개가 발생하라 수 있어서 일련의 chain이라는 설정도 필요.
		
		//필터를 통과할 때 인코딩을 설정하겠다!
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
			//setContentType의 경우 매번 각양각색일 수 있어서 필터링에는 추가할 수 없음
		
		//이제 web.xml에 설정하는 방법도 있다
		//하지만 이제는 Annotation으로 설정할 수 있다!!!
		
		//나중에 Spring으로 넘어가면 이런 문법에 접근할 필요조차 없어진다.
	}

}

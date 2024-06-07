package com.test.lesson03;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/ex02_insert")
public class InsertEx02 extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//이번에는 response header를 아예 넘기는 탓에 생략한다!
		
		//Request Params
		String name = request.getParameter("name");
		String yyyymmdd = request.getParameter("yyyymmdd");
		String email = request.getParameter("email");
		String introduce = request.getParameter("introduce");
			//일단 단계별로 검증해야
		
		
		//DB 연결
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		//DB에 Insert 요청; Insert Query 수행
		String insertQuery = "insert into `new_user` "
				+ "(`name`,`yyyymmdd`,`email`,`introduce`) "
				+ "value ('"+ name + "', '"+ yyyymmdd + "', '"+ email +"', '"+ introduce +"')";
			//이 String은 오류가 생기기 쉬워서 여기까지 디버깅을 해보는 것이 좋다.
		
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//DB 연결 해제
		ms.disconnect();
		
		//목록 화면으로 이동시킨다; Redirect라는 기법
			//이미 존재하는 페이지에 요청을 날리는 것과 흡사
			//현 Servlet -> ex02_1로 request를 보냄
		response.sendRedirect("/lesson03/ex02_1.jsp");
		
	}
}

package com.test.lesson03;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/ex02_delete")
public class DeleteEx02 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//마찬가지로 response header 생략
		
		//resquest param
		int id = Integer.parseInt(request.getParameter("id")); // DB에서는 string 형태로 id를 보내도 알아서 int 형태로 인식한다.
		
		//DB연결
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		// Delete Query 수행
			//mySql Workbench에서 미리 쿼리문을 실행하기
		String queryDelete = "DELETE FROM `new_user` WHERE (`id` = '"+ id +"')" ;
		
		try {
			ms.update(queryDelete);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//DB 연결 해제
		ms.disconnect();
		
		//목록페이지 이동; 다시 원래 페이지로 Redirect; 302 redirect;
		response.sendRedirect("/lesson03/ex02_1.jsp");
	}

}

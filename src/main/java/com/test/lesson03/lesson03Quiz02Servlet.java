package com.test.lesson03;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/update")
public class lesson03Quiz02Servlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		String namePortal = null;
		if(request.getParameter("name") != null) {;
			namePortal = request.getParameter("name").trim();
		}
		
		String urlPortal = null;
		if(request.getParameter("url") != null) {
			urlPortal = request.getParameter("url").trim();
		}
		
		if(namePortal == null || urlPortal == null) {
			response.sendRedirect("/lesson03/quiz02_index.jsp");
			return;
		}
		
		
		//DB 연결
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		//
		String insertQuery = "insert into `portal_favorite` (`name`, `url`) value ('"+ namePortal +"', '"+ urlPortal +"')" ; 
		//System.out.println(insertQuery);
		
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//DB 연결 해제
		ms.disconnect();
		
		response.sendRedirect("/lesson03/quiz02_index.jsp");
		return;
	}
}

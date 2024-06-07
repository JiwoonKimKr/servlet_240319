package com.test.lesson03;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/quiz02_delete")

public class DeleteQuiz02 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//response header Not needed
		//request params
		int idPortal = Integer.parseInt(request.getParameter("id"));
		
		//DB connect
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		//Delete Query
		String queryDelete = "DELETE FROM `bookmark` WHERE (`id` = '"+ idPortal +"')";
		
		try {
			ms.update(queryDelete);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//DB disconn
		ms.disconnect();
		
		//redirect to previouse
		response.sendRedirect("/lesson03/quiz02_index.jsp");
	}

}

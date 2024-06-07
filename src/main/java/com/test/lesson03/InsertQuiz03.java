package com.test.lesson03;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.cj.protocol.Resultset;
import com.test.common.MysqlService;

@WebServlet("/lesson03/quiz03_insert")
public class InsertQuiz03 extends HttpServlet{

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//request param
		String title = request.getParameter("title");
		int sellerId = Integer.parseInt(request.getParameter("sellerId")); 
		int price = Integer.parseInt(request.getParameter("price")); 
		String nickname = request.getParameter("nickname"); 
		String pictureUrl = request.getParameter("pictureUrl");
		String description = request.getParameter("description");
		
		//db conn
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		//insert query
		String queryInsert1 = "";
		String queryInsert2 = "INSERT INTO `used_goods` (`sellerId`, `title`, `description`, `price`) VALUES ("+ sellerId + ", '" + title +"', '"+ description + "', "+ price +");";
		
		//db disconn
		ms.disconnect();
		
		//redirect
		response.sendRedirect("/lesson03/quiz03_index.jsp");
	}
}

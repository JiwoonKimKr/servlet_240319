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
		int sellerId = Integer.parseInt(request.getParameter("sellerId")); 
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price")); 
		String description = request.getParameter("description");
		String pictureUrl = "null"; 
		if(request.getParameter("pictureUrl") != "" && request.getParameter("pictureUrl") != pictureUrl) {
			pictureUrl = "'" + request.getParameter("pictureUrl") + "'";
		};
		
		//db conn
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		//insert query
		String queryInsert1 = "INSERT INTO `used_goods` (`sellerId`, `title`, `description`, `price`, `pictureUrl`) VALUES ("+ sellerId + ", '" + title +"', '"+ description + "', "+ price +", "+ pictureUrl +")";

		try {
			ms.update(queryInsert1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//db disconn
		ms.disconnect();
		
		//redirect
		response.sendRedirect("/lesson03/quiz03_index.jsp");
	}
}

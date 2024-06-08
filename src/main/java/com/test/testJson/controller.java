package com.test.testJson;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mysql.cj.xdevapi.JsonArray;
import com.test.common.MysqlService;

@WebServlet("/testJson/index")
public class controller extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
		
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		String selectQuery = "SELECT sellerId, title, `description`, price, pictureUrl FROM used_goods";
		JSONArray jsonArray = new JSONArray();
		
		try {
			ResultSet res = ms.select(selectQuery);
			while(res.next()) {
				DtoUsedGoods dto = new DtoUsedGoods(res.getInt("sellerId"), res.getString("title"),
						res.getString("description"), res.getInt("price"), res.getString("pictureUrl"));
				
				jsonArray.add(dto.jsonObjectFromDto());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("jsonArrUsedGoods", jsonArray);
		RequestDispatcher rd = request.getRequestDispatcher("/testJson/index.jsp");
		rd.forward(request, response);
		
		ms.disconnect();
		
	}
}

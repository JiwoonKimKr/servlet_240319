package com.test.lesson03;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/quiz01")
public class Lesson03Quiz01Servlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//response header
		response.setContentType("text/plain");
		
		//db 연결
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		//insert
		String insertQuery = "insert into `real_estate`"
				+ "(`realtorId`,`address`,`area`,`type`,`price`)"
				+ "value"
				+ "(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000)";
		//만약 쿼리문에서 select*from 같이 띄어쓰기가 잘못 되었을 수도 있으니까 꼭 디버깅으로 체크해야
		
		try {
			ms.update(insertQuery);
			//try을 널찍하게 설정해서 select까지 넣는 방법도 존재
				//그런데 update나 select 한 쪽에 문제가 생기면 둘 다 처리 못하는 문제가 발생
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//select => 출력
		String selectQuery = "SELECT * FROM `real_estate` order by `id` desc limit 10";
		
		selectQuery = "SELECT address, area, `type` FROM real_estate "
				+ "order by `id` desc "
				+ "limit 10" ;
		
		PrintWriter out = response.getWriter();
		try {
			ResultSet res = ms.select(selectQuery);
			
			while(res.next()) {
				out.println("매물 주소: " + res.getString("address")
				+ ", 면적: " + res.getInt("area")
				+ ", 타입: " + res.getString("type"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//db 연결 해제
		ms.disconnect();
		
	}
}

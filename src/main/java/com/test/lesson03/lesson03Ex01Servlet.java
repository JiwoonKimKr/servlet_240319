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

@WebServlet("/lesson03/ex01")
public class lesson03Ex01Servlet extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//일단 흐름을 정리
		
	//response header 세팅
		response.setContentType("text/plain"); //바로 sql에 text/plain 형식으로 query문을 보낼 예정
		//response.setCharacterEncoding("utf-8"); 필터를 이미 설정한 덕분에 생략 가능
		
	// DB 연결
		MysqlService ms = MysqlService.getInstance(); // static인 덕분에 메모리에 올라와있는 덕분에, 바로 호출 가능;
			//아직 객체를 들고 온 상황이고, 직접 연결까지 해야 한다!
		ms.connect(); // ★★★★★ 실질적인 DB 연결 메소드!
		
	//추가 예제) select 하기 전 insert를 실행
	//insert query - db
		String insertQuery = "insert into `used_goods`"
				+ "(`sellerId`,`title`,`description`,`price`)"
				+ "value"
				+ "(1,'고양이 간식 팝니다.','입맛이 까다로워서 잘 안 먹어요ㅠ', 2000)";
		//뭔가 쿼리가 안 되는 상황이면, workbench에서 query문을 다시 실행해봐야;
		
		try {
			//역시 select문이랑 마찬가지로 
			ms.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
			//에러가 발생하더라도 catch인 덕분에 아예 멈추지는 않는다. console에 에러메시지가 찍혀있을 뿐.
		}
		
	//쿼리문 수행; select query - db => 출력도 동시에
		String selectQuery = "select * from `used_goods`;" ;
			// 워크밴치에서 직접 수행하고 검증된 쿼리문을 직접 복사하는 방식이 좋다!
		
		PrintWriter out = response.getWriter();
		
		//resultSet을 일련의 Iterator로 볼 수 있다.
		try {
			ResultSet res = ms.select(selectQuery); //while문으로 res가 가리키는 record 여러 개를 둘러볼 예정
			while(res.next()) {// 결과행이 존재하면 수행한다는 뜻
				//각 record(행)마다 접근가능; 그런데 res가 접근하려면 해당 column 명칭과 해당 데이터의 타입까지 일치해야
					//select문으로 가져온 결과에 부합하는 column만 접근 가능
				out.println(res.getInt("id"));
				out.println(res.getString("title"));
				out.println(res.getInt("price"));
				out.println(res.getString("description"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	// DB 연결 해제;
		//연결하는 코드 작성할 때 바로 작성하는 게 좋다.
		ms.disconnect();
	}
}
//스프링에선 이런 제어 자체를 신경쓰지 않는다

//이렇게 길어진 코드는 문제가 생길 확률이 높다.
	//디버깅으로

package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
    private static MysqlService mysqlService = null;

    //static 같은 값들은 대문자로 선언하는 것이 약속
    private static final String URL = "jdbc:mysql://localhost:3306/test_240319"; 
    	//"jdbc:mysql:"이 구문이 앞에 붙어야
    	// DB 명칭까지 적어줘야!
    		//도메인 뒤에 접속할 데이터베이스 명칭까지 기재해야!
    private static final String ID = "root";
    private static final String PASSWORD = "root";

    //query문을 날리려면 객체 몇 개들이 필요하다!
    private Connection conn = null; //jdbc 라이브러리 덕에 사용 가능
    private Statement statement; //java.sql 를 import해야
    private ResultSet res;

    //이 해당 class에 대한 생성자
    	// 그런데 이번에는 객체 생성 메소드 형식으로
    
    // Singleton 패턴: MysqlService라는 객체가 단 하나만 생성되도록 하는 디자인 패턴(DB 연결을 여러 객체에서 하지 않도록)
    public static MysqlService getInstance() {
    	// static이라는 특성이 붙은 탓에 이미 메모리에 올라와있는 상태; 
    		// 그래서 바로 메모리에서 확인 가능!
    	
    	// 초기 생성을 한 번만 하겠다!
    		//생성된 것이 없으면(null 상태이면) 그제야 new로 하나를 만들겠다!
        if (mysqlService == null) {
            mysqlService =  new MysqlService();
        }
        return mysqlService;
    }

    
    //DB에 접속; JDBC로 실제 진입하는 
    public void connect() {
        try {
            // 1) 드라이버를 메모리에 로딩
        		// java와 DB를 연결시켜주는 JDBC를 드라이버라고 지칭
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());

            // 2) DB connection
            conn = DriverManager.getConnection(URL, ID, PASSWORD);

            // 3) statement: DB와 쿼리를 실행하기 위한 준비
            	//statement가 query문; 
            	//statement에 저장해야
            statement = conn.createStatement();
            
            //이렇게 driver이랑 connect는 꼭 필요하다!
        } catch (Exception e) {
        	// 만약 에러가 발생했을 경우 throws로 던져버리는 경우(윗 단계로 보내는 경우),
        	// DB쪽에서 문제가 생기는 경우인데 throw로 윗선에 문제를 떠넘기면 너무 무책임한 상황
        		//이렇게 누구한테 책임이 있는지 알아보고 판단해야 클라이언트면 throw, 서버 쪽이면 try-catch
        		// 이번에는 server쪽이라서
            e.printStackTrace();
        }
    }

    //DB 접속 연결을 직접 해제!;
    public void disconnect() {
        try {
        	// 연결 해지 하기
            // 연결했던 걸 거꾸로 행한다.
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            	//이번에도 클라이언트가 서버에 요청해서, 상대방 쪽 에서 문제가 발생하는 경우라서 try-catch문으로
        }
    }

    //CRUD 중에 R만 조금 다르다; R은 결과문을 읽어와야하는 경우라서 나뉜다.
    //C U D create, update, delete: insert, update, delete
    //R - read:select
    
    //R에 해당하는 경우
    //<String> 형태의 query문이 param이 된다.
    	//그리고 ResultSet를 반환한다.
    public ResultSet select(String query) throws SQLException {
        res = statement.executeQuery(query);
        return res;
    }
    	//보통은 서블릿에서 만든 쿼리문이 잘못 되어서 오류가 나는 경우가 워낙 많다.
    		//그래서 이번에는 잘못 되었을 경우, 요청을 한 윗선인 서블릿에 오류를 던진다
    		//throws로 오류를 넘긴다.
    			//try-catch나 throws라고 무조건 하는 것이 아니라 계속 생각해야
    			//생각하는 습관이 의식적으로 깔려있어야
    
    //CUD에 해당하는 경우
    //결과값 돌려줄 것이 없어서 void type이다
    public void update(String query) throws SQLException {
        statement.executeUpdate(query);
    }
    	//이번에도 쿼리문이 잘못되었을 거니까 위로 던짐
    
// 계념적으로 덩어리로 접근해야; 코드 외우는 접근 필요 없다!    
}
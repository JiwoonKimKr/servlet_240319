<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex01 - JSP</title>
</head>
<body>
    <!-- HTML 주석: 소스 보기에서 보인다. -->
    <%-- JSP 주석: 소스보기에서 안 보임 --%>
    
    <%
    	//자바 문법 시작
    	// scriptlet; Spring에서는 절대 쓸 일 없는 문법들
    	int sum = 0;
    	for ( int i = 1 ; i <= 10; i ++){
    		sum += i;
    	}
    %>
    
    
    <b>합계: <%= sum %> </b>
    <input type="text" value="<%= sum %>">
    <br>
    
    
    <%!
    	// 선언문; scriptlet은 main() 메소드와 비슷하지만, 
    		//이 느낌표가 붙어있는 선언문은 class같은 느낌(Person 클래스 같이)
    		//field와 method를 선언할 수 있다.

    	// 필드
    	int num = 100;
    	
    	// 메소드
    	public String getHelloWorld(){
    		return "Hello World";
    	}
    %>
    
    <%=getHelloWorld()%>
    <br>
    
    <%= num + 200 %> <!-- 표현식의 경우 간단한 산술 연산도 가능하다. -->
</body>
</html>
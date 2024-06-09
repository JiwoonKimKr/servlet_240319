<%@page import="java.util.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Json 구현하기 실험!</title>
</head>
<body>
<%
	JSONArray jsonArray = (JSONArray) request.getAttribute("jsonArrUsedGoods");
	for (int i = 0; i < jsonArray.size(); i++){
		JSONObject jsonObject = (JSONObject) jsonArray.get(i);
		
		out.print(jsonObject.get("sellerId"));
		out.print(jsonObject.get("title").toString());
		out.print(jsonObject.get("description").toString());
		out.print(jsonObject.get("price"));
		if(jsonObject.get("pictureUrl") != null){
			out.print(jsonObject.get("pictureUrl").toString());
		}
		out.println("<br>");
	}
%>

</body>
</html>
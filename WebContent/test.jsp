<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day 10 - test</title>
</head>
<body>
<%
	//자바 문자열 메소드 contains.
	String readIdx = "/61/62/234/233";		//읽은 글번호
	boolean result = readIdx.contains("/232/");
	out.print(result);
%>
</body>
</html>
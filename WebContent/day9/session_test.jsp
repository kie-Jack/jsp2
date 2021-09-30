<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day 9 - Session Test</title>
</head>
<body>
<div>
	http 프로토콜은 stateless(상태정보유지안됨.), 비연결		<br>
	웹서버와 브라우저 사이의 연결정보를 저장하는 방법을 사용합니다.	<br>
	->서버가 request를 통해서 브라우저의 세션ID가 부여되고 그 값으로 구별한다		<br>
	-> 로그인 기능 구현에 활용합니다.<br>
	-> 톰캣은 이름 JSESSIONID 값을 만듭니다.<br>
	-> 세션 유효 시간은 서버에서 설정합니다. web.xml 확인 (모든 프로젝트에 적용) <br>
	-> 프로젝트 web.xml 은 해당 프로젝트에만 적용 <br>
	-> 세션 유효시간 변경 방법. <br>
		: session-config 로 유효시간 변경 가능. (단위:분)<br>
		: 소스코드에서 메소드 실행해서 변경 가능. (단위:초)<br>
</div>
<%
	String id = session.getId();		//JSESSIONID
	out.print(id);			//
	out.print("<br>");
	long start = session.getCreationTime();		//세션이 생성된 시간 - 청므 요청을 보낸시간
	out.print("세션 생성시간 long : "+ start);			//시간이 long 일때는 1970년 1월1일 기준 ms 단위
	
	out.print("<br>");
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	out.print("세션 생성시간 : "+ df.format(start));
	
	out.print("<br>");
	long exp = session.getMaxInactiveInterval();
	out.print("세션 유효 시간 : " + exp + "초," + (exp/60) + "분");
	
//	session.setMaxInactiveInterval(60);	// web.xml 변경하고 실행할 때는 주석처리 하세요.
//	마지막 session 접근시간
	
	out.print("<br>");
	long last = session.getLastAccessedTime();		// 같은 세션ID로 요청한 최근 시간.
	out.print("최근 접근시간 : " + df.format(last));
%>
</body>
</html>
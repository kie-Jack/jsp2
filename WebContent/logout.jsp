<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
//	out.print("<script>");
//	out.print("alert('로그아웃 되었습니다.');");
//	out.print("location.href='home.jsp';");		//home.jsp로 
//	out.print("</script>");
	
//	response.sendRedirect("home.jsp");
	
	request.setAttribute("msg", "로그아웃 되었습니다.");
	request.setAttribute("url", "home.jsp");
	pageContext.include("error/alert.jsp");
	
	session.invalidate();		//세션 무효화
//	session.invalidate() 전후에 session 값 변 변경 확인해보세요.
//	개발자도구 JSESSIONID 변경됩니다. -> request 객체도 새로 생성됩니다.

%>
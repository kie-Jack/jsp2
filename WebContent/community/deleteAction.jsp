<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	String password = request.getParameter("password");
	
	FreeboardDao dao = FreeboardDao.getInstance();
	Map<String,Object> map = new HashMap<>();
	map.put("idx", idx);
	map.put("password", password);
	
	int n = dao.delete(map);		//주요 실행 메소드
	
//	out.print(n);
	out.print("<script>");
	String msg = null;
	String href = null;
	if(n==1){   //정상 delete 실행
		msg = "글 삭제 완료";
		href = "listAction.jsp?page="+pageNo;
	}else { 	//n=0 : password가 틀릴 때
		msg = "글 비밀번호가 틀렸습니다";
		href = "detailAction.jsp?page="+pageNo+"&idx="+idx;
	}
	out.print("alert('"+msg+"');");
	out.print("location.href='"+href+"';")	;
	out.print("</script>");
	
//	String del = "n";
//	if (n==1) del="y";
//	response.sendRedirect("listAction.jsp?del="+del);
%>
<!--
메인글과 댓글의 참조관계 (외래키) 설정되어 있을 때

:외래키 On Delete 동작을 설정합니다.

1. 메인글 삭제 못하게한다. - Restrict
2. 메인글과 댓글 모두 삭제한다.		-Cascade (테스트는 이 방법으로 해보세요.)
3. 메인글의 subject를 [삭제된 글]로 하고 작성자, 내용은 "" 없게 update한다.
4. 메인글은 삭제하고 댓글의 mref 값은 null(또는 기본값)로 변경한다. - Set Null 또는 Set Default 
( 단, mref는 null 허용으로 한다.)

-->





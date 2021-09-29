<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int idx = Integer.parseInt(request.getParameter("idx"));
	String password = request.getParameter("password");
	
	FreeboardDao dao = FreeboardDao.getInstance();
	Map<String,Object> map = new HashMap<>();
	map.put("idx", idx);
	map.put("password", password);
	
	int n = dao.delete(map);
	
//	out.print(n);
	out.print("<script>");
	String msg = null;
	String href = null;
	if(n==1){   //정상 delete 실행
		msg = "글 삭제 완료";
		href = "listAction.jsp";
	}else { 	//n=0 : password가 틀릴 때
		msg = "글 비밀번호가 틀렸습니다";
		href = "detailAction.jsp?page=1&idx="+idx;
	}
	out.print("alert('"+msg+"');");
	out.print("location.href='"+href+"';")	;
	out.print("</script>");
	
//	String del = "n";
//	if (n==1) del="y";
//	response.sendRedirect("listAction.jsp?del="+del);








%>
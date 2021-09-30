<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잘못된 파라미터 접근</title>
</head>
<body>
<script type="text/javascript">
	alert('잘못된 파라미터 값입니다.');
	alert('이전 페이지로 이동합니다.');
	history.back();		//window.history.back() : window = 브라우저객체
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 강의 조회하기</title>
</head>
<body>

	<h3 style="color: hotpink;"><%=request.getParameter("inputId") %>님의 가입을 환영합니다.</h3>
	
	<ul>
		<li>id : <%=request.getParameter("inputId") %>
		<li>year : <%=request.getParameter("inputYear") %>
		<li>semester : <%=request.getParameter("inputSemester") %>
	</ul>
	

</body>
</html>
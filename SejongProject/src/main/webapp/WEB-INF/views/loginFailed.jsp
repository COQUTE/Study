<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인부터 하쇼</title>
</head>
<body>

	<c:if test="${sessionScope.login == false}">
		<script>
			alert("로그인부터 다시 시도해주세요.");
		</script>
	</c:if>

</body>
</html>
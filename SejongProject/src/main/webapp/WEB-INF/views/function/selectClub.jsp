<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리 조회</title>
</head>
<body>

	<c:choose>
	
		<c:when test="${ empty requestScope.clubList }">
			<h3>소속된 동아리가 없습니다.</h3>
		</c:when>
		
		<c:otherwise>
			<div>
				<span>소속된 동아리 수 : ${ fn:length(requestScope.clubList) }</span>
			</div>
			<hr>
			<table>
				<c:forEach var="club" items="${ requestScope.clubList }">
					<tr>
						<td>
							<span><b>${ club }</b></span>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<br>
			
			<c:if test="${ requestScope.isPresident }">
				<div>
					<span>동아리 회장 - 동아리 회원 조회</span>
				</div>
				<hr>
				<table>
					<c:forEach var="member" items="${ requestScope.clubMember }">
					<tr>
						<td>
							<span><b>${ member }</b></span>
						</td>
					</tr>
				</c:forEach>
				</table>
			</c:if>
		</c:otherwise>		
	</c:choose>

</body>
</html>
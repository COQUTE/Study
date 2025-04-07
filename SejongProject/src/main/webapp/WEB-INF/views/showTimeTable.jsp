<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
    <style>
        .tabletitle {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
	
	<h2>시간표</h2>
	<c:forEach var="timeTable" items="${timeTableList}" varStatus="vs">
		
		${timeTable.stdName } <br>
		${timeTable.lctName } <br>
		${timeTable.day } <br>
		${timeTable.hour } <br>
		
		
	
	</c:forEach>

</body>
</html>
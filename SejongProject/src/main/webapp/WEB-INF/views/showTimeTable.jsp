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
	<c:forEach var="name" items="${timeTableList}" varStatus="vs">
		
		
		${timeTableList[vs.index].getLctName()} <br>
		${timeTableList[vs.index].getDay()}<br>
		${timeTableList[vs.index].getHour()}<br>
		
		
	
	</c:forEach>

</body>
</html>
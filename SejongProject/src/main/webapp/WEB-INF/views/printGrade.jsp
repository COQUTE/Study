<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, com.study.model.dto.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 학점</title>
<style>
    * {
        box-sizing: border-box;
    }
    .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-items: center;
    }
    .title {
        color: black;
        font-size: 30px;
    }

    .print {
        border: 1px solid black;
        border-radius: 10px;
    }
    
    #comment1 {
    	color : green;
    }
    
    #comment1 {
    	color : yellowgreen;
    }
    
    #comment1 {
    	color : pink;
    }
    
    #comment4 {
    	color : red;
    }
    
    </style>
</head>
<body>
	<div class="container">
        <div class="title"><h1>성적 조회 결과</h1></div>
        
        <div>
        <table class="print">
            <tr>
                <th>과목명</th>
                <th>수강학기</th>
                <th>성적</th>
                <th>학점</th>
            </tr>
        
            <c:forEach var="s" items="${printGrade}">
                <tr>
                    <td>${s.lctName}</td>
                    <td>${s.lctSemester}</td>
                    <td>${s.grade}</td>
                    <td>${s.credit}</td>
                </tr>
            </c:forEach>
        </table>
        </div>
        
        <div><h3>총 이수 학점 : ${totalCredit}</h3></div>
        <div><h3>평균 학점(GPA) : ${gpa}</h3></div>
        <div class="comment">
        	<c:choose>
        		<c:when test="${gpa > 3}"><h4 id="comment1">축하드립니다! 좋은성적을 거두셨네요</h4></c:when>
        		<c:when test="${gpa > 2}"><h4 id="comment2">조금 더 분발하시면 좋은 성적을 거두실 수 있을겁니다. 화이팅하세요!</h4></c:when>
        		<c:when test="${gpa > 1}"><h4 id="comment3">미래를 위해 한발짝 딛여보는 것이 어떨까요?</h4></c:when>
        		<c:otherwise><h4 id="comment4">학사 경고 대상자 입니다</h4></c:otherwise>
        	</c:choose>
        </div>
    </div>

</body>
</html>
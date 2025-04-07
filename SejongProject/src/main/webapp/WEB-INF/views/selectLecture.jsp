<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 강의 조회하기</title>

<script src="https://kit.fontawesome.com/61232e6b3f.js"
	crossorigin="anonymous"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=42dot+Sans:wght@300..800&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');

* {
	background-color: white;
	font-family: "42dot Sans", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
}

.header {
	display: flex;
}

.head-left {
	padding: 30px;
	flex-basis: 20%;
}

.text-left {
	font-weight: bold;
	text-decoration: none;
	
      font-family: 'Poppins', sans-serif;
      font-size: 48px;
      color: #2C3E50;
      letter-spacing: 1px;
      position: relative;
      display: inline-block;
      transition: transform 0.3s ease;
}



    .text-left::after {
      content: "";
      position: absolute;
      width: 0;
      height: 4px;
      background-color: #182461;
      left: 0;
      bottom: -5px;
      transition: width 0.3s ease;
    }
    
       .text-left:hover {
      transform: scale(1.03);
    }

    .text-left:hover::after {
      width: 100%;
    }




.header-center {
	flex-basis: 60%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.header-right {
	flex-basis: 20%;
	display: flex;
}

.small-box {
	padding: 30px;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	font-size: 20px;
}

.mypage {
	border: 0;
	color: gray;
	flex-basis: 50%;
	padding: 10px;
}

.bar {
	border: 0;
	color: white;
	flex-basis: 50%;
	padding: 10px;
}

#myicon {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 50px;
	background-color: #182461;
	color : white;
	width: 80px;
	height: 80px;
	border-radius: 10px;
	cursor: pointer;
}

#baricon {
	display: flex;
	font-size: 50px;
	background-color: black;
	justify-content: center;
	align-items: center;
	width: 80px;
	height: 80px;
	border-radius: 10px;
	cursor: pointer;
}

.center {
	height: 500px;
	padding: 200px;
	padding-left: 350px;
	justify-content: space-between;
	align-items: center;
	position: relative;
}

.text-image {
display: flex;
}

.login-select {
	border: none;
	background-color: white;
	text-align: center;
	font-size: 20px;
}

.login-select > option {
	border: none;
	background-color: white;
	text-align: center;
	font-size: 20px;
}

.stdId-box {
	border-radius: 30px;
	padding: 2px;
	overflow: hidden;
	width: 1000px;
	height: 60px;
	background-color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	border : 2px solid #182461;
}

#query {
	padding: 10px;
	font-size: 20px;
	border: none;
	outline: none;
	/* outline : input 태그에 포커싱되었을 때
  이를 표현하기 위한 바깥선 
  */
	flex-basis: 92%;
	width: 480px;
	background-color: white;
	padding-left: 30px;
}

#search-btn {
	cursor: pointer;
	font-size: 25px;
	color: white;
	border: none;
	overflow: none;
	background-color: #182461;
	border-radius: 50%;
	width: 45px;
	height: 45px;
	padding: 10px;
	display: flex;
	justify-content: center;
	align-items: center;

	/* transparent : 배경색 투명 */
}

.center-text1 {
flex-basis : 60%;

}

.center-text2 {
flex-basis : 40%;

}

.text1 {
	display: flex;
	align-items: center;
	font-size: 50px;
	font-weight: bold;
}

.text2 {
	display: flex;
	align-items: center;
	font-size: 20px;
}

.center-text2>p {
	display: flex;
	align-items: center;
	font-size: 20px;
}
</style>
</head>
<body>

	<div class="header">
		<div class="head-left">
			<a href="http://localhost:8080/" class="text-left">SJUniversity</a>
		</div>

		<div class="header-center">
			<div class="small-box">대학소개</div>
			<div class="small-box">입학안내</div>
			<div class="small-box">일립대학</div>
			<div class="small-box">대학원</div>
			<div class="small-box">대학생활</div>
			<div class="small-box">기관안내</div>
		</div>

		<div class="header-right">
			<div class="mypage">
				<i id="myicon" class="fa-solid fa-circle-user"></i>
			</div>
			<div class="bar">
				<i id="baricon" class="fa-solid fa-bars"></i>
			</div>
		</div>
	</div>

	<h3 style="color: hotpink;">${sessionScope.stdId}님의
		<%=request.getParameter("inputYear") %>년도
		<%=request.getParameter("inputSemester") %>학기 강좌 목록
	</h3>

	<ul>
		<li>year : <%=request.getParameter("inputYear") %>
		<li>semester : <%=request.getParameter("inputSemester") %>
	</ul>


<c:choose>
    <c:when test="${not empty lectureList}">
        <c:forEach var="lec" items="${lectureList}">
            <p>${lec.num} - ${lec.lctId}</p> <!-- getter가 있어야 함 -->
            <p>${lec}</p> <!-- getter가 있어야 함 -->
        </c:forEach>
    </c:when>
    <c:otherwise>
        <p>해당하는 강좌가 없습니다.</p>
    </c:otherwise>
</c:choose>



</body>
</html>
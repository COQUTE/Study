<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기능 선택</title>
<script src="https://kit.fontawesome.com/61232e6b3f.js"
	crossorigin="anonymous"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=42dot+Sans:wght@300..800&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap');

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
	display: flex;
	height: 500px;
	padding: 200px;
	justify-content: center;
	align-items: center;
	position: relative;
}

.center button {
height : 400px;
width : 300px;
display : inline;
justify-content: center;
align-items: center;
text-align: center;
border-radius: 20px;

box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.15);

  color: #333;
  cursor: pointer;
  
  transition: transform 0.3s ease, background 0.3s ease;
  
 border : 0px;

}

.small {
font-size : 20px;
color : #63615d;
padding : 0px;
font-weight: bold;
}

.big{
font-size : 40px;
font-weight: bold;
padding : 0px;
color : #4A4A4A;
}



.center form {
padding : 30px;
}

#icon-bnt {
font-size : 80px;
}

.center button:hover {
  transform: scale(1.05);
}

.center button:active {
  box-shadow: inset 2px 2px 4px rgba(0, 0, 0, 0.3); /* 눌린 느낌 */
  transform: translateY(2px); /* 살짝 눌린 것처럼 보이게 */
}

.lec, .lec * {
background : #D8CFC4;
}

.club, .club *{
background : #F0E7DC;
}

.table, .table *{
background : #DDB8B2;
}

.grade, .grade *{
background : lightgray;
}


</style>
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

	<div class="center">
	

	<form action="/yearsem" method="post">
		<button class="lec"><i id="icon-bnt" class="fa-solid fa-comments"></i><br><p class="small">연도와 학기를 입력해보세요 !</p><p class="big">내 강좌 조회<br><br></p></button>
	</form>

	<form>
		<button class="club"><i id="icon-bnt" class="fa-solid fa-gamepad"></i><br><p class="small">회장이라면 원들 정보 조회 가능</p><p class="big">소속 동아리 정보 조회</p></button>
	</form>
	
	<form>
		<button class="table"><i id="icon-bnt" class="fa-solid fa-landmark"></i><br><p class="small">나의 수업 스케줄 알아보기</p><p class="big">강의 시간표 조회<br><br></p></button>
	</form>

	<form>
		<button class="grade"><i id="icon-bnt" class="fa-solid fa-print"></i><br><p class="small">성적은 어떻게 될까</p><p class="big">성적표 조회<br><br></p></button>
	</form>
	</div>

</body>
</html>
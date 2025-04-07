<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 수강 강좌 조회하기</title>

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
	padding : 0px;
	margin : 0px;
	color : #D8CFC4;
}

.text2 {
	display: flex;
	align-items: center;
	font-size: 30px;
	font-weight: bold;
}

.center-text2>p {
	display: flex;
	align-items: center;
	font-size: 20px;
}

.select-container {
  width: 300px;
  background: #e8e8e8;
  border-radius: 20px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.08);
  padding: 30px 20px;
  text-align: center;
  
}


.select-button {
  background-color: #D8CFC4;
  color: #4A4A4A;
  border: none;
  width: 100%;
  padding: 14px 0;
  border-radius: 12px;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  margin-bottom: 25px;
  transition: transform 0.2s;
}

.input-box {
  background-color: white;
  color: #4A4A4A;
  border: none;
  width: 100%;
  padding: 14px 0;
  border-radius: 12px;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  margin-bottom: 10px;
  transition: transform 0.2s;
}

.select-button:hover {
  transform: scale(1.03);
}

.select-input {
background-color: #e8e8e8;

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

	<div class="center">
		<div class="text-image">
			<div class="center-text1">
				<div>
					<p class="text1">
						${sessionScope.stdId}님의 시간표 조회하기</p>
				</div>
				<div>
					<p class="text2">
						조회하고 싶은 강좌의 년도와 학기를 입력하세요.</p>
				</div>
		</div>
		<div class="center-text2">
		
		<form action="/selectLecture" method="post">
		<div class="select-container">
  <div class="select-input">
    <input type="number" name="inputYear" class="input-box" placeholder="  년도" required> <br>
    <input type="number" name="inputSemester" class="input-box" placeholder="  학기" required> <br>
  </div>

  <button class="select-button">조회하기</button>
  </div>
  </form>
		</div>
		</div>
	</div>

</body>
</html>
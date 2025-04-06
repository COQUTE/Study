<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>기능 선택</title>
        <style>
            .head {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .body {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .body>div {
                margin: 30px;
            }
        </style>
    </head>

    <body>

        <div class="head">
            <div><h1>학사 관리 프로그램</h1></div>
        </div>
        
        <div class="body">
            <div class="clubSelect">
                <form action="#">
                    <button>소속 동아리 정보 조회</button>
                </form>
            </div>
            <div class="lectureSelect">
                <form action="#">
                    <button>수강과목 조회</button>
                </form>
            </div>
            <div class="timeTable">
                <form action="#">
                    <button>강의 시간표 조회</button>
                </form>
            </div>
            <div class="grade">
                <form action="/printGrade">
                    <button>성적 조회</button>
                </form>
            </div>
        </div>
        
    </body>
</html>
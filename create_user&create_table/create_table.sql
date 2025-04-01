CREATE TABLE TB_DBA (
	DBA_ID VARCHAR2(10 BYTE) PRIMARY KEY, -- 관리자 번호
	DBA_NAME VARCHAR2(15 BYTE) NOT NULL, -- 관리자 이름
	DBA_ADDRESS VARCHAR2(100 BYTE) NOT NULL, -- 관리자 주소
	DBA_PHONE VARCHAR2(25 BYTE) NOT NULL, -- 관리자 전화번호
	DBA_EMAIL VARCHAR2(25 BYTE) NOT NULL, -- 관리자 이메일
	CONSTRAINTS DBA_PH_CK CHECK(DBA_PHONE NOT LIKE '%-%')
);

-- 교수는 소속학과가 반드시 있어야 하고, 학생을 반드시 담당해야 하며, 강좌에 대한 강의를 반드시 해야 한다. 교수는 1개 이상의 복수 학과에 소속이 가능하다.
-- 모든 교수는 교수번호를 부여하여 식별하며 교수이름, 교수주소, 교수전화번호. 교수이메일, 소속 학과번호 정보를 가진다. 
CREATE TABLE TB_PROFESSOR (
	PROF_ID VARCHAR2(10 BYTE) PRIMARY KEY, -- 교수 번호
	PROF_NAME VARCHAR2(15 BYTE) NOT NULL, -- 교수 이름
	PROF_ADDRESS VARCHAR2(100 BYTE) NOT NULL, -- 교수 주소
	PROF_PHONE VARCHAR2(25 BYTE) NOT NULL, -- '-'를 제외한 교수 전화번호
	PROF_EMAIL VARCHAR2(25 BYTE) NOT NULL, -- 교수 이메일
	CONSTRAINTS PROF_PH_CK CHECK(PROF_PHONE NOT LIKE '%-%')
);

-- 학과는 학과번호를 부여하여 식별하며 학과명, 학과전화번호, 학과사무실 정보를 가진다.
-- 해당 학과에서 개설하는 강좌가 반드시 1개 이상 존재해야 하며, 동시에 학과장이 1명 있어야 한다.
CREATE TABLE TB_DEPARTMENT (
	DEPT_ID VARCHAR2(10 BYTE) PRIMARY KEY, -- '-'를 제외한 학과 번호
	DEPT_TITLE VARCHAR2(60 BYTE) NOT NULL UNIQUE, -- 학과명
	DEPT_TEL VARCHAR2(25 BYTE) NOT NULL, -- 학과 전화번호
	DEPT_OFFICE VARCHAR2(60 BYTE) NOT NULL, -- 학과 사무실
	HEAD_PROF VARCHAR2(10 BYTE), -- 학과장
	CONSTRAINTS DEPT_TEL_CK CHECK(DEPT_TEL NOT LIKE '%-%'),
	CONSTRAINTS DEPT_FK FOREIGN KEY(HEAD_PROF) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE SET NULL
);

-- 모든 학생은 학생번호를 부여하여 식별하며 학생이름, 학생주소. 학생전화번호. 학생이메일, 전공 학과, 지도교수 정보, 등록금 납부 계좌 정보를 가진다.
-- 학생은 부전공을 1개까지 신청할 수 있다. 학생은 한학기에 최대 10학점까지만 수강 할 수 있다.
CREATE TABLE TB_STUDENT (
	STD_ID VARCHAR2(10 BYTE) PRIMARY KEY, -- 학생 번호
	STD_NAME VARCHAR2(15 BYTE) NOT NULL, -- 학생 이름
	STD_ADDRESS VARCHAR2(100 BYTE) NOT NULL, -- 학생 주소
	STD_PHONE VARCHAR2(25 BYTE) NOT NULL, -- '-'를 제외한 학생 전화번호
	STD_EMAIL VARCHAR2(25 BYTE) NOT NULL, -- 학생 이메일
	MAJOR VARCHAR2(10 BYTE), -- 전공 학과
	MINOR VARCHAR2(10 BYTE) DEFAULT NULL, -- 부전공
	ACCOUNT_NUM VARCHAR2(25 BYTE), -- 등록금 납부 계좌
	CHECK(STD_PHONE NOT LIKE '%-%')
	CONSTRAINTS STD_MAJOR_FK FOREIGN KEY(MAJOR) REFERENCES TB_DEPARTMENT(DEPT_ID) ON DELETE SET NULL,
	CONSTRAINTS STD_MINOR_FK FOREIGN KEY(MINOR) REFERENCES TB_DEPARTMENT(DEPT_ID) ON DELETE SET NULL
);

-- 학과/교수 테이블(N:M)
CREATE TABLE TB_DEPT_PROF (
	DEPT_ID VARCHAR2(10 BYTE),
	PROF_ID VARCHAR2(10 BYTE),
	CONSTRAINTS DP_DEPT_FK FOREIGN KEY(DEPT_ID) REFERENCES TB_DEPARTMENT(DEPT_ID) ON DELETE CASCADE,
	CONSTRAINTS DP_PROF_FK FOREIGN KEY(PROF_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE CASCADE
);

-- 교수와 학생은 학생번호와 교수번호를 이용한 지도 관계를 가지며, 해당 관계에는 현재 학년/학기 정보를 포함한다.
CREATE TABLE TB_MANAGEMENT (
	STD_ID VARCHAR2(10 BYTE),
	PROF_ID VARCHAR2(10 BYTE),
	ACADEMIC_YEAR CHAR(1 BYTE) NOT NULL, -- 현재 학년
	SEMESTER CHAR(1 BYTE) NOT NULL, -- 현재 학기
	CONSTRAINTS MAN_STD_FK FOREIGN KEY(STD_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE CASCADE,
	CONSTRAINTS MAN_PROF_FK FOREIGN KEY(PROF_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE CASCADE,
	CONSTRAINTS MAN_SEM_CK CHECK(SEMESTER IN('1', '2'))
);

-- 강좌는 강좌번호, 분반번호, 강의하는 교수, 강좌이름, 강의요일, 강의교시, 취득학점 (1~4), 강좌시간 (1~6), 개설 학과, 강의실 정보가 필요하다.
CREATE TABLE TB_LECTURE (
	LCT_ID VARCHAR2(10 BYTE), -- 강좌 번호
	CLASS_ID VARCHAR2(3 BYTE), -- 분반 번호
	PROF_ID VARCHAR2(10 BYTE), -- 강의하는 교수
	LCT_YEAR NUMBER NOT NULL, -- 강좌 년도
	LCT_SEMESTER CHAR(1 BYTE) NOT NULL, -- 강좌 학기
	LCT_NAME VARCHAR2(60 BYTE) NOT NULL, -- 강좌 이름
	DAY CHAR(3 BYTE) NOT NULL, -- 강의 요일
	PERIOD NUMBER NOT NULL, -- 강의 교시
	CREDIT NUMBER NOT NULL, -- 취득학점
	HOUR NUMBER NOT NULL, -- 강좌시간
	DEPT_ID VARCHAR2(10 BYTE), -- 개설 학과
	CLASSROOM VARCHAR2(60 BYTE) NOT NULL, -- 강의실 정보
	CONSTRAINTS LCT_PK PRIMARY KEY(LCT_ID, CLASS_ID),
	CONSTRAINTS LCT_NAME_UQ UNIQUE(LCT_YEAR, LCT_SEMESTER, LCT_NAME),
	CONSTRAINTS LCT_CLASS_UQ UNIQUE(DAY, PERIOD, CLASSROOM),
	CONSTRAINTS LCT_CREDIT_CK CHECK(CREDIT BETWEEN 1 AND 4),
	CONSTRAINTS LCT_HOUR_CK CHECK(HOUR BETWEEN 1 AND 6),
	CONSTRAINTS LCT_SEM_CK CHECK(LCT_SEMESTER IN('1', '2')),
	CONSTRAINTS LCT_PROF_FK FOREIGN KEY(PROF_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE CASCADE,	
	CONSTRAINTS LCT_DEPT_FK FOREIGN KEY(DEPT_ID) REFERENCES TB_DEPARTMENT(DEPT_ID) ON DELETE CASCADE
);

-- 수강내역은 학생번호, 강좌번호/분반번호, 교수번호를 부여하여 식별하며 출석점수, 중간고사점수, 기말고사점수, 기타 점수, 총점 (0 ~ 100), 평점 (A ~ F) 정보를 가진다.
CREATE TABLE TB_COURSE_HISTORY (
	STD_ID VARCHAR2(10 BYTE), -- 학생 번호
	LCT_ID VARCHAR2(10 BYTE), -- 강좌 번호
	CLASS_ID VARCHAR2(10 BYTE), -- 분반 번호
	PROF_ID VARCHAR2(10 BYTE), -- 교수 번호
	ATTEND_SCR NUMBER DEFAULT NULL, -- 출석 점수
	MID_SCR NUMBER DEFAULT NULL, -- 중간고사
	FIN_SCR NUMBER DEFAULT NULL, -- 기말고사
	ETC_SCR NUMBER DEFAULT NULL, -- 기타 점수
	TOTAL_SCR NUMBER DEFAULT NULL, -- 총점
	GRADE CHAR(1 BYTE) NOT NULL, -- 평점
	CONSTRAINTS COURSE_PK PRIMARY KEY(STD_ID, LCT_ID, CLASS_ID, PROF_ID),
	CONSTRAINTS COURSE_TOTAL_CK CHECK(TOTAL_SCR BETWEEN 0 AND 100),
	CONSTRAINTS COURSE_GRADE_CK CHECK(GRADE BETWEEN 'A' AND 'F'),
	CONSTRAINTS COURSE_STD_FK FOREIGN KEY(STD_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE CASCADE,
	CONSTRAINTS COURSE_LCT_FK FOREIGN KEY(LCT_ID, CLASS_ID) REFERENCES TB_LECTURE(LCT_ID, CLASS_ID) ON DELETE CASCADE,
	CONSTRAINTS COURSE_PROF_FK FOREIGN KEY(PROF_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE SET NULL
);

-- 학생은 1개 이상의 동아리에 가입이 가능하다.
-- 동아리는 동아리 번호, 동아리 이름, 소속 학생 숫자, 회장 학생 정보, 동아리 지도 교수 정보, 동아리방 정보 등을 가져야 한다.
CREATE TABLE TB_CLUB (
	CLUB_ID VARCHAR2(10 BYTE) PRIMARY KEY, -- 동아리 번호
	CLUB_NAME VARCHAR2(60 BYTE) NOT NULL UNIQUE, -- 동아리 이름
	STD_AMOUNT NUMBER NOT NULL, -- 소속 학생 숫자
	PRESIDENT_ID VARCHAR2(10 BYTE), -- 회장 학생 정보
	CLUB_MANAGER_ID VARCHAR2(10 BYTE), -- 동아리 지도 교수 정보
	CLUBROOM VARCHAR2(60 BYTE) NOT NULL, -- 동아리방 정보
	CONSTRAINTS CLUB_PRE_FK FOREIGN KEY(PRESIDENT_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE SET NULL,
	CONSTRAINTS CLUB_MAN_FK FOREIGN KEY(CLUB_MANAGER_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE SET NULL
);

-- 학생-동아리 테이블(N:M)
CREATE TABLE TB_CLUB_MEMBER (
	STD_ID VARCHAR2(10 BYTE),
	CLUB_ID VARCHAR2(10 BYTE),
	CONSTRAINTS CM_STD_FK FOREIGN KEY(STD_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE CASCADE,
	CONSTRAINTS CM_CLUB_FK FOREIGN KEY(CLUB_ID) REFERENCES TB_CLUB(CLUB_ID) ON DELETE CASCADE
);

-- 학생별 등록금 납부 내역을 기록해야 한다. 학생 번호, 등록금 납부 연도, 등록금 납부 학기, 등록금 총액, 납부 총액, 마지막 납부 일자가 기록돼야 한다.
-- 납부 총액이 등록금 총액 보다 작을 경우에는 수강내역 "신규 삽입"에서 "등록금 미납"오류를 표시해야 한다.
CREATE TABLE TB_PAYMENT_HISTORY (
	STD_ID VARCHAR2(10 BYTE), -- 학생번호
	PAY_YEAR NUMBER, -- 등록금 납부 연도
	PAY_SEMESTER NUMBER, -- 등록금 납부 학기
	TUITION_TOTAL NUMBER, -- 등록금 총액
	PAY_TOTAL NUMBER, -- 납부 총액
	LAST_PAYDATE DATE DEFAULT CURRENT_DATE, -- 마지막 납부 일자
	CONSTRAINTS PAY_PK PRIMARY KEY(STD_ID, PAY_YEAR, PAY_SEMESTER),
	CONSTRAINTS PAY_STD_FK FOREIGN KEY(STD_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE CASCADE
);
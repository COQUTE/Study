CREATE TABLE TB_DBA (
	DBA_ID VARCHAR2(10 BYTE) PRIMARY KEY, -- 관리자 번호
	DBA_NAME VARCHAR2(15 BYTE) NOT NULL, -- 관리자 이름
	DBA_ADDRESS VARCHAR2(100 BYTE) NOT NULL, -- 관리자 주소
	DBA_PHONE VARCHAR2(25 BYTE) NOT NULL, -- 관리자 전화번호
	DBA_EMAIL VARCHAR2(25 BYTE) NOT NULL -- 관리자 이메일
);

INSERT INTO TB_DBA VALUES('M001', '홍길동', '서울특별시 강남구', '010-1111-2222', 'kdh@gmail.com');

-- 교수는 소속학과가 반드시 있어야 하고, 학생을 반드시 담당해야 하며, 강좌에 대한 강의를 반드시 해야 한다. 교수는 1개 이상의 복수 학과에 소속이 가능하다.
-- 모든 교수는 교수번호를 부여하여 식별하며 교수이름, 교수주소, 교수전화번호. 교수이메일, 소속 학과번호 정보를 가진다. 
CREATE TABLE TB_PROFESSOR (
	PROF_ID VARCHAR2(10 BYTE) PRIMARY KEY, -- 교수 번호
	PROF_NAME VARCHAR2(15 BYTE) NOT NULL, -- 교수 이름
	PROF_ADDRESS VARCHAR2(100 BYTE) NOT NULL, -- 교수 주소
	PROF_PHONE VARCHAR2(25 BYTE) NOT NULL, -- 교수 전화번호
	PROF_EMAIL VARCHAR2(25 BYTE) NOT NULL -- 교수 이메일
);

INSERT INTO TB_PROFESSOR VALUES('P001', '김철수', '서울시 강남구 테헤란로 123', '010-1234-5678', 'kimcs@example.com');
INSERT INTO TB_PROFESSOR VALUES('P002', '이영희', '부산시 해운대구 센텀로 45', '010-2345-6789', 'leeyh@example.com');
INSERT INTO TB_PROFESSOR VALUES('P003', '박민수', '대구시 중구 중앙대로 77', '010-3456-7890', 'parkms@example.com');
INSERT INTO TB_PROFESSOR VALUES('P004', '최지훈', '인천시 남동구 구월로 88', '010-4567-8901', 'choijh@example.com');
INSERT INTO TB_PROFESSOR VALUES('P005', '정예린', '광주시 서구 상무대로 55', '010-5678-9012', 'jungey@example.com');
INSERT INTO TB_PROFESSOR VALUES('P006', '한서연', '대전시 유성구 대학로 99', '010-6789-0123', 'hansy@example.com');
INSERT INTO TB_PROFESSOR VALUES('P007', '윤도훈', '울산시 남구 삼산로 101', '010-7890-1234', 'yoondh@example.com');
INSERT INTO TB_PROFESSOR VALUES('P008', '고미정', '경기도 성남시 분당구 정자일로 202', '010-8901-2345', 'komj@example.com');
INSERT INTO TB_PROFESSOR VALUES('P009', '서강준', '전주시 완산구 백제대로 303', '010-9012-3456', 'seokj@example.com');
INSERT INTO TB_PROFESSOR VALUES('P010', '문현우', '창원시 성산구 원이대로 404', '010-0123-4567', 'moonhw@example.com');
INSERT INTO TB_PROFESSOR VALUES('P011', '임수진', '수원시 팔달구 효원로 505', '010-1234-6789', 'imsj@example.com');
INSERT INTO TB_PROFESSOR VALUES('P012', '배기찬', '춘천시 중앙로 606', '010-2345-7890', 'baekc@example.com');
INSERT INTO TB_PROFESSOR VALUES('P013', '조은별', '청주시 서원구 사직대로 707', '010-3456-8901', 'joeb@example.com');
INSERT INTO TB_PROFESSOR VALUES('P014', '강석준', '안양시 동안구 평촌대로 808', '010-4567-9012', 'kangsj@example.com');
INSERT INTO TB_PROFESSOR VALUES('P015', '오하늘', '포항시 북구 학산로 909', '010-5678-0123', 'ohhn@example.com');
INSERT INTO TB_PROFESSOR VALUES('P016', '홍지수', '경주시 동천로 111', '010-6789-1234', 'hongjs@example.com');
INSERT INTO TB_PROFESSOR VALUES('P017', '유나리', '제주시 노형로 222', '010-7890-2345', 'yoonr@example.com');
INSERT INTO TB_PROFESSOR VALUES('P018', '신동엽', '세종시 나성로 333', '010-8901-3456', 'shind@example.com');
INSERT INTO TB_PROFESSOR VALUES('P019', '김하린', '강릉시 경강로 444', '010-9012-4567', 'kimhr@example.com');
INSERT INTO TB_PROFESSOR VALUES('P020', '정태우', '충주시 탄금대로 555', '010-0123-5678', 'jungtw@example.com');

-- 학과는 학과번호를 부여하여 식별하며 학과명, 학과전화번호, 학과사무실 정보를 가진다.
-- 해당 학과에서 개설하는 강좌가 반드시 1개 이상 존재해야 하며, 동시에 학과장이 1명 있어야 한다.
CREATE TABLE TB_DEPARTMENT (
	DEPT_ID VARCHAR2(10 BYTE) PRIMARY KEY, -- 학과 번호
	DEPT_TITLE VARCHAR2(60 BYTE) NOT NULL UNIQUE, -- 학과명
	DEPT_TEL VARCHAR2(25 BYTE) NOT NULL, -- 학과 전화번호
	DEPT_OFFICE VARCHAR2(60 BYTE) NOT NULL, -- 학과 사무실
	HEAD_PROF VARCHAR2(10 BYTE), -- 학과장
	FOREIGN KEY(HEAD_PROF) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE SET NULL
);

INSERT INTO TB_DEPARTMENT VALUES ('D001', '컴퓨터공학과', '02-1234-5678', '공학관 101호', 'P001');
INSERT INTO TB_DEPARTMENT VALUES ('D002', '전자공학과', '02-2345-6789', '공학관 102호', 'P002');
INSERT INTO TB_DEPARTMENT VALUES ('D003', '기계공학과', '02-3456-7890', '공학관 103호', 'P003');
INSERT INTO TB_DEPARTMENT VALUES ('D004', '건축학과', '02-4567-8901', '공학관 104호', 'P004');
INSERT INTO TB_DEPARTMENT VALUES ('D005', '화학공학과', '02-5678-9012', '공학관 105호', 'P005');
INSERT INTO TB_DEPARTMENT VALUES ('D006', '산업공학과', '02-6789-0123', '공학관 106호', 'P006');
INSERT INTO TB_DEPARTMENT VALUES ('D007', '신소재공학과', '02-7890-1234', '공학관 107호', 'P007');
INSERT INTO TB_DEPARTMENT VALUES ('D008', '환경공학과', '02-8901-2345', '공학관 108호', 'P008');
INSERT INTO TB_DEPARTMENT VALUES ('D009', '생명과학과', '02-9012-3456', '과학관 201호', 'P009');
INSERT INTO TB_DEPARTMENT VALUES ('D010', '수학과', '02-0123-4567', '과학관 202호', 'P010');
INSERT INTO TB_DEPARTMENT VALUES ('D011', '물리학과', '02-1234-6789', '과학관 203호', 'P011');
INSERT INTO TB_DEPARTMENT VALUES ('D012', '화학과', '02-2345-7890', '과학관 204호', 'P012');
INSERT INTO TB_DEPARTMENT VALUES ('D013', '지구과학과', '02-3456-8901', '과학관 205호', 'P013');
INSERT INTO TB_DEPARTMENT VALUES ('D014', '천문학과', '02-4567-9012', '과학관 206호', 'P014');
INSERT INTO TB_DEPARTMENT VALUES ('D015', '의학과', '02-5678-0123', '의학관 301호', 'P015');
INSERT INTO TB_DEPARTMENT VALUES ('D016', '치의학과', '02-6789-1234', '의학관 302호', 'P016');
INSERT INTO TB_DEPARTMENT VALUES ('D017', '약학과', '02-7890-2345', '의학관 303호', 'P017');
INSERT INTO TB_DEPARTMENT VALUES ('D018', '간호학과', '02-8901-3456', '의학관 304호', 'P018');
INSERT INTO TB_DEPARTMENT VALUES ('D019', '경영학과', '02-9012-4567', '경영관 401호', 'P019');
INSERT INTO TB_DEPARTMENT VALUES ('D020', '경제학과', '02-0123-5678', '경영관 402호', 'P020');

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
	FOREIGN KEY(MAJOR) REFERENCES TB_DEPARTMENT(DEPT_ID) ON DELETE SET NULL,
	FOREIGN KEY(MINOR) REFERENCES TB_DEPARTMENT(DEPT_ID) ON DELETE SET NULL
);

INSERT INTO TB_STUDENT VALUES('S001', '김민수', '서울시 강남구 테헤란로 123', '01012345678', 'kimms@example.com', 'D001', DEFAULT, '100-1234-5678');
INSERT INTO TB_STUDENT VALUES('S002', '이영희', '부산시 해운대구 센텀로 45', '01023456789', 'leeyh@example.com', 'D002', DEFAULT, '100-2345-6789');
INSERT INTO TB_STUDENT VALUES('S003', '박철호', '대구시 중구 중앙대로 77', '01034567890', 'parkch@example.com', 'D003', DEFAULT, '100-3456-7890');
INSERT INTO TB_STUDENT VALUES('S004', '최지훈', '인천시 남동구 구월로 88', '01045678901', 'choijh@example.com', 'D004', 'D008', '100-4567-8901');
INSERT INTO TB_STUDENT VALUES('S005', '정예린', '광주시 서구 상무대로 55', '01056789012', 'jungey@example.com', 'D005', DEFAULT, '100-5678-9012');
INSERT INTO TB_STUDENT VALUES('S006', '한서연', '대전시 유성구 대학로 99', '01067890123', 'hansy@example.com', 'D006', 'D018', '100-6789-0123');
INSERT INTO TB_STUDENT VALUES('S007', '윤도훈', '울산시 남구 삼산로 101', '01078901234', 'yoondh@example.com', 'D007', DEFAULT, '100-7890-1234');
INSERT INTO TB_STUDENT VALUES('S008', '고미정', '경기도 성남시 분당구 정자일로 202', '01089012345', 'komj@example.com', 'D008', DEFAULT, '100-8901-2345');
INSERT INTO TB_STUDENT VALUES('S009', '서강준', '전주시 완산구 백제대로 303', '01090123456', 'seokj@example.com', 'D009', DEFAULT, '100-9012-3456');
INSERT INTO TB_STUDENT VALUES('S010', '문현우', '창원시 성산구 원이대로 404', '01001234567', 'moonhw@example.com', 'D010', DEFAULT, '100-0123-4567');
INSERT INTO TB_STUDENT VALUES('S011', '임수진', '수원시 팔달구 효원로 505', '01012346789', 'imsj@example.com', 'D011', DEFAULT, '100-1234-6789');
INSERT INTO TB_STUDENT VALUES('S012', '배기찬', '춘천시 중앙로 606', '01023457890', 'baekc@example.com', 'D012', DEFAULT, '100-2345-7890');
INSERT INTO TB_STUDENT VALUES('S013', '조은별', '청주시 서원구 사직대로 707', '01034568901', 'joeb@example.com', 'D013', DEFAULT, '100-3456-8901');
INSERT INTO TB_STUDENT VALUES('S014', '강석준', '안양시 동안구 평촌대로 808', '01045679012', 'kangsj@example.com', 'D014', 'D001', '100-4567-9012');
INSERT INTO TB_STUDENT VALUES('S015', '오하늘', '포항시 북구 학산로 909', '01056780123', 'ohhn@example.com', 'D015', DEFAULT, '100-5678-0123');
INSERT INTO TB_STUDENT VALUES('S016', '홍지수', '경주시 동천로 111', '01067891234', 'hongjs@example.com', 'D016', DEFAULT, '100-6789-1234');
INSERT INTO TB_STUDENT VALUES('S017', '유나리', '제주시 노형로 222', '01078902345', 'yoonr@example.com', 'D017', DEFAULT, '100-7890-2345');
INSERT INTO TB_STUDENT VALUES('S018', '신동엽', '세종시 나성로 333', '01089013456', 'shind@example.com', 'D018', 'D010', '100-8901-3456');
INSERT INTO TB_STUDENT VALUES('S019', '김하린', '강릉시 경강로 444', '01090124567', 'kimhr@example.com', 'D019', DEFAULT, '100-9012-4567');
INSERT INTO TB_STUDENT VALUES('S020', '정태우', '충주시 탄금대로 555', '01001235678', 'jungtw@example.com', 'D020', DEFAULT, '100-0123-5678');

-- 학과-교수 테이블(N:M)
CREATE TABLE TB_DEPT_PROF (
	DEPT_ID VARCHAR2(10 BYTE),
	PROF_ID VARCHAR2(10 BYTE),
	FOREIGN KEY(DEPT_ID) REFERENCES TB_DEPARTMENT(DEPT_ID) ON DELETE CASCADE,
	FOREIGN KEY(PROF_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE CASCADE
);

INSERT INTO TB_DEPT_PROF VALUES('D001', 'P001');
INSERT INTO TB_DEPT_PROF VALUES('D001', 'P002');
INSERT INTO TB_DEPT_PROF VALUES('D002', 'P003');
INSERT INTO TB_DEPT_PROF VALUES('D002', 'P004');
INSERT INTO TB_DEPT_PROF VALUES('D003', 'P005');
INSERT INTO TB_DEPT_PROF VALUES('D003', 'P006');
INSERT INTO TB_DEPT_PROF VALUES('D004', 'P007');
INSERT INTO TB_DEPT_PROF VALUES('D004', 'P008');
INSERT INTO TB_DEPT_PROF VALUES('D005', 'P009');
INSERT INTO TB_DEPT_PROF VALUES('D005', 'P010');
INSERT INTO TB_DEPT_PROF VALUES('D006', 'P011');
INSERT INTO TB_DEPT_PROF VALUES('D006', 'P012');
INSERT INTO TB_DEPT_PROF VALUES('D007', 'P013');
INSERT INTO TB_DEPT_PROF VALUES('D007', 'P014');
INSERT INTO TB_DEPT_PROF VALUES('D008', 'P015');
INSERT INTO TB_DEPT_PROF VALUES('D008', 'P016');
INSERT INTO TB_DEPT_PROF VALUES('D009', 'P017');
INSERT INTO TB_DEPT_PROF VALUES('D009', 'P018');
INSERT INTO TB_DEPT_PROF VALUES('D010', 'P019');
INSERT INTO TB_DEPT_PROF VALUES('D010', 'P020');
INSERT INTO TB_DEPT_PROF VALUES('D020', 'P001');
INSERT INTO TB_DEPT_PROF VALUES('D019', 'P002');
INSERT INTO TB_DEPT_PROF VALUES('D018', 'P003');
INSERT INTO TB_DEPT_PROF VALUES('D017', 'P004');
INSERT INTO TB_DEPT_PROF VALUES('D016', 'P005');
INSERT INTO TB_DEPT_PROF VALUES('D015', 'P006');
INSERT INTO TB_DEPT_PROF VALUES('D014', 'P007');
INSERT INTO TB_DEPT_PROF VALUES('D013', 'P008');
INSERT INTO TB_DEPT_PROF VALUES('D012', 'P009');
INSERT INTO TB_DEPT_PROF VALUES('D011', 'P010');
INSERT INTO TB_DEPT_PROF VALUES('D010', 'P011');
INSERT INTO TB_DEPT_PROF VALUES('D009', 'P012');
INSERT INTO TB_DEPT_PROF VALUES('D008', 'P013');
INSERT INTO TB_DEPT_PROF VALUES('D007', 'P014');
INSERT INTO TB_DEPT_PROF VALUES('D006', 'P015');
INSERT INTO TB_DEPT_PROF VALUES('D005', 'P016');
INSERT INTO TB_DEPT_PROF VALUES('D004', 'P017');
INSERT INTO TB_DEPT_PROF VALUES('D003', 'P018');
INSERT INTO TB_DEPT_PROF VALUES('D002', 'P019');
INSERT INTO TB_DEPT_PROF VALUES('D001', 'P020');

-- 교수와 학생은 학생번호와 교수번호를 이용한 지도 관계를 가지며, 해당 관계에는 현재 학년/학기 정보를 포함한다.
CREATE TABLE TB_MANAGEMENT (
	STD_ID VARCHAR2(10 BYTE),
	PROF_ID VARCHAR2(10 BYTE),
	ACADEMIC_YEAR CHAR(1 BYTE) NOT NULL, -- 현재 학년
	SEMESTER CHAR(1 BYTE) NOT NULL, -- 현재 학기
	FOREIGN KEY(STD_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE CASCADE,
	FOREIGN KEY(PROF_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE CASCADE,
	CHECK(SEMESTER IN('1', '2'))
);

INSERT INTO TB_MANAGEMENT VALUES('S001', 'P020', '1', '1');
INSERT INTO TB_MANAGEMENT VALUES('S002', 'P019', '2', '2');
INSERT INTO TB_MANAGEMENT VALUES('S003', 'P018', '3', '1');
INSERT INTO TB_MANAGEMENT VALUES('S004', 'P017', '4', '2');
INSERT INTO TB_MANAGEMENT VALUES('S005', 'P016', '2', '1');
INSERT INTO TB_MANAGEMENT VALUES('S006', 'P015', '4', '2');
INSERT INTO TB_MANAGEMENT VALUES('S007', 'P014', '3', '1');
INSERT INTO TB_MANAGEMENT VALUES('S008', 'P013', '2', '2');
INSERT INTO TB_MANAGEMENT VALUES('S009', 'P012', '1', '1');
INSERT INTO TB_MANAGEMENT VALUES('S010', 'P011', '3', '2');
INSERT INTO TB_MANAGEMENT VALUES('S011', 'P010', '2', '1');
INSERT INTO TB_MANAGEMENT VALUES('S012', 'P009', '1', '2');
INSERT INTO TB_MANAGEMENT VALUES('S013', 'P008', '4', '1');
INSERT INTO TB_MANAGEMENT VALUES('S014', 'P007', '2', '2');
INSERT INTO TB_MANAGEMENT VALUES('S015', 'P006', '5', '1');
INSERT INTO TB_MANAGEMENT VALUES('S016', 'P005', '3', '2');
INSERT INTO TB_MANAGEMENT VALUES('S017', 'P004', '1', '1');
INSERT INTO TB_MANAGEMENT VALUES('S018', 'P003', '1', '2');
INSERT INTO TB_MANAGEMENT VALUES('S019', 'P002', '4', '1');
INSERT INTO TB_MANAGEMENT VALUES('S020', 'P001', '2', '2');

-- 강좌는 강좌번호, 분반번호, 강의하는 교수, 강좌이름, 강의요일, 강의교시, 취득학점 (1~4), 강좌시간 (1~6), 개설 학과, 강의실 정보가 필요하다.
CREATE TABLE TB_LECTURE (
	LCT_ID VARCHAR2(10 BYTE), -- 강좌 번호
	CLASS_ID VARCHAR2(10 BYTE), -- 분반 번호
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
	PRIMARY KEY(LCT_ID, CLASS_ID),
	UNIQUE(LCT_YEAR, LCT_SEMESTER, LCT_NAME),
	UNIQUE(DAY, PERIOD, CLASSROOM),
	CHECK(CREDIT BETWEEN 1 AND 4),
	CHECK(HOUR BETWEEN 1 AND 6),
	CHECK(LCT_SEMESTER IN('1', '2')),
	FOREIGN KEY(PROF_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE CASCADE,	
	FOREIGN KEY(DEPT_ID) REFERENCES TB_DEPARTMENT(DEPT_ID) ON DELETE CASCADE
);

INSERT INTO TB_LECTURE VALUES('L001', '001', 'P001', 2025, '1', '경영학 입문', '월', 1, 2, 3, 'D001', '101호');
INSERT INTO TB_LECTURE VALUES('L002', '001', 'P002', 2025, '2', '자료 구조', '화', 2, 4, 3, 'D002', '102호');
INSERT INTO TB_LECTURE VALUES('L003', '001', 'P003', 2025, '1', '디지털 마케팅', '수', 3, 2, 3, 'D003', '103호');
INSERT INTO TB_LECTURE VALUES('L004', '001', 'P004', 2025, '2', '비즈니스 전략', '목', 4, 2, 3, 'D004', '104호');
INSERT INTO TB_LECTURE VALUES('L005', '001', 'P005', 2025, '1', 'AI 입문', '금', 5, 4, 2, 'D005', '105호');
INSERT INTO TB_LECTURE VALUES('L006', '001', 'P006', 2025, '2', '데이터베이스 관리', '월', 1, 3, 3, 'D006', '106호');
INSERT INTO TB_LECTURE VALUES('L007', '001', 'P007', 2025, '1', '마케팅 기초', '화', 2, 3, 3, 'D007', '107호');
INSERT INTO TB_LECTURE VALUES('L008', '001', 'P008', 2025, '2', '고급 프로그래밍', '수', 3, 4, 3, 'D008', '108호');
INSERT INTO TB_LECTURE VALUES('L009', '001', 'P009', 2025, '1', '회계학', '목', 4, 3, 3, 'D009', '109호');
INSERT INTO TB_LECTURE VALUES('L010', '001', 'P010', 2025, '2', '창업학', '금', 5, 3, 3, 'D010', '110호');
INSERT INTO TB_LECTURE VALUES('L011', '001', 'P011', 2025, '1', '기계학습', '월', 1, 4, 3, 'D011', '111호');
INSERT INTO TB_LECTURE VALUES('L012', '001', 'P012', 2025, '2', '인사관리', '화', 2, 2, 3, 'D012', '112호');
INSERT INTO TB_LECTURE VALUES('L013', '001', 'P013', 2025, '1', '빅데이터 분석', '수', 3, 4, 3, 'D013', '113호');
INSERT INTO TB_LECTURE VALUES('L014', '001', 'P014', 2025, '2', '사이버 보안', '목', 4, 4, 3, 'D014', '114호');
INSERT INTO TB_LECTURE VALUES('L015', '001', 'P015', 2025, '1', '재무 관리', '금', 5, 2, 3, 'D015', '115호');
INSERT INTO TB_LECTURE VALUES('L016', '001', 'P016', 2025, '2', '윤리학', '월', 1, 1, 3, 'D016', '116호');
INSERT INTO TB_LECTURE VALUES('L017', '001', 'P017', 2025, '1', '소프트웨어 공학', '화', 2, 2, 3, 'D017', '117호');
INSERT INTO TB_LECTURE VALUES('L018', '001', 'P018', 2025, '2', '프로젝트 관리', '수', 3, 1, 3, 'D018', '118호');
INSERT INTO TB_LECTURE VALUES('L019', '001', 'P019', 2025, '1', '인공지능', '목', 4, 3, 3, 'D019', '119호');
INSERT INTO TB_LECTURE VALUES('L020', '001', 'P020', 2025, '2', '컴퓨터 네트워크', '금', 5, 4, 3, 'D020', '120호');
INSERT INTO TB_LECTURE VALUES('L021', '001', 'P001', 2025, '1', '데이터 과학', '월', 1, 2, 3, 'D001', '121호');
INSERT INTO TB_LECTURE VALUES('L022', '001', 'P002', 2025, '2', '마케팅 분석', '화', 2, 2, 3, 'D002', '122호');
INSERT INTO TB_LECTURE VALUES('L023', '001', 'P003', 2025, '1', '비즈니스 분석', '수', 3, 2, 3, 'D003', '123호');
INSERT INTO TB_LECTURE VALUES('L024', '001', 'P004', 2025, '2', '경제학', '목', 4, 3, 3, 'D004', '124호');
INSERT INTO TB_LECTURE VALUES('L025', '001', 'P005', 2025, '1', '클라우드 컴퓨팅', '금', 5, 3, 3, 'D005', '125호');
INSERT INTO TB_LECTURE VALUES('L026', '001', 'P006', 2025, '2', '전자상거래', '월', 1, 2, 3, 'D006', '126호');
INSERT INTO TB_LECTURE VALUES('L027', '001', 'P007', 2025, '1', '비즈니스 법', '화', 2, 3, 3, 'D007', '127호');
INSERT INTO TB_LECTURE VALUES('L028', '001', 'P008', 2025, '2', '비즈니스 인텔리전스', '수', 3, 4, 3, 'D008', '128호');
INSERT INTO TB_LECTURE VALUES('L029', '001', 'P009', 2025, '1', '기업 재무', '목', 4, 2, 3, 'D009', '129호');
INSERT INTO TB_LECTURE VALUES('L030', '001', 'P010', 2025, '2', '리더십', '금', 5, 1, 3, 'D010', '130호');
INSERT INTO TB_LECTURE VALUES('L031', '001', 'P011', 2025, '1', '인공지능 응용', '월', 1, 4, 3, 'D011', '131호');
INSERT INTO TB_LECTURE VALUES('L032', '001', 'P012', 2025, '2', '핀테크', '화', 2, 2, 3, 'D012', '132호');
INSERT INTO TB_LECTURE VALUES('L033', '001', 'P013', 2025, '1', '계량 경제학', '수', 3, 2, 3, 'D013', '133호');
INSERT INTO TB_LECTURE VALUES('L034', '001', 'P014', 2025, '2', '위험 관리', '목', 4, 2, 3, 'D014', '134호');
INSERT INTO TB_LECTURE VALUES('L035', '001', 'P015', 2025, '1', '공급망 관리', '금', 5, 3, 3, 'D015', '135호');
INSERT INTO TB_LECTURE VALUES('L036', '001', 'P016', 2025, '2', '국제 비즈니스', '월', 1, 3, 3, 'D016', '136호');
INSERT INTO TB_LECTURE VALUES('L037', '001', 'P017', 2025, '1', '디지털 혁신', '화', 2, 1, 3, 'D017', '137호');
INSERT INTO TB_LECTURE VALUES('L038', '001', 'P018', 2025, '2', '데이터 엔지니어링', '수', 3, 2, 3, 'D018', '138호');
INSERT INTO TB_LECTURE VALUES('L039', '001', 'P019', 2025, '1', '비즈니스 관리', '목', 4, 3, 3, 'D019', '139호');
INSERT INTO TB_LECTURE VALUES('L040', '001', 'P020', 2025, '2', '클라우드 인프라', '금', 5, 1, 3, 'D020', '140호');
INSERT INTO TB_LECTURE VALUES('L041', '001', 'P001', 2025, '1', '전략적 관리', '월', 1, 2, 3, 'D001', '141호');
INSERT INTO TB_LECTURE VALUES('L042', '001', 'P002', 2025, '2', '조직 행동', '화', 2, 4, 3, 'D002', '142호');
INSERT INTO TB_LECTURE VALUES('L043', '001', 'P003', 2025, '1', '혁신 관리', '수', 3, 4, 3, 'D003', '143호');
INSERT INTO TB_LECTURE VALUES('L044', '001', 'P004', 2025, '2', '관리 회계', '목', 4, 1, 3, 'D004', '144호');
INSERT INTO TB_LECTURE VALUES('L045', '001', 'P005', 2025, '1', '운영 관리', '금', 5, 4, 3, 'D005', '145호');
INSERT INTO TB_LECTURE VALUES('L046', '001', 'P006', 2025, '2', '시장 조사', '월', 1, 2, 3, 'D006', '146호');
INSERT INTO TB_LECTURE VALUES('L047', '001', 'P007', 2025, '1', '비즈니스 협상', '화', 2, 1, 3, 'D007', '147호');
INSERT INTO TB_LECTURE VALUES('L048', '001', 'P008', 2025, '2', '비즈니스 커뮤니케이션', '수', 3, 1, 3, 'D008', '148호');
INSERT INTO TB_LECTURE VALUES('L049', '001', 'P009', 2025, '1', '디지털 전략', '목', 4, 1, 3, 'D009', '149호');
INSERT INTO TB_LECTURE VALUES('L050', '001', 'P010', 2025, '2', '창의적 문제 해결', '금', 5, 1, 3, 'D010', '150호');

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
	PRIMARY KEY(STD_ID, LCT_ID, CLASS_ID, PROF_ID),
	CHECK(TOTAL_SCR BETWEEN 0 AND 100),
	CHECK(GRADE BETWEEN 'A' AND 'F'),
	FOREIGN KEY(STD_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE CASCADE,
	FOREIGN KEY(LCT_ID, CLASS_ID) REFERENCES TB_LECTURE(LCT_ID, CLASS_ID) ON DELETE CASCADE,
	FOREIGN KEY(PROF_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE SET NULL
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
	FOREIGN KEY(PRESIDENT_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE SET NULL,
	FOREIGN KEY(CLUB_MANAGER_ID) REFERENCES TB_PROFESSOR(PROF_ID) ON DELETE SET NULL
);

-- 학생-동아리 테이블(N:M)
CREATE TABLE TB_CLUB_MEMBER (
	STD_ID VARCHAR2(10 BYTE),
	CLUB_ID VARCHAR2(10 BYTE),
	FOREIGN KEY(STD_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE CASCADE,
	FOREIGN KEY(CLUB_ID) REFERENCES TB_CLUB(CLUB_ID) ON DELETE CASCADE
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
	PRIMARY KEY(STD_ID, PAY_YEAR, PAY_SEMESTER),
	FOREIGN KEY(STD_ID) REFERENCES TB_STUDENT(STD_ID) ON DELETE CASCADE
);
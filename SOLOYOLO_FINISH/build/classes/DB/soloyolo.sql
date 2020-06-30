/*
	생성일 : 2020.04.27
	내용 : SOLO 계정 생성 및 테이블 생성

	수정일 : 2020.05.06 ~ 07
	수정 내용 : COOK( CTYPE 컬럼 추가 )
			HTURL → HTAVI, HTPIC 컬럼으로 분할
			DELIVERY의 좌표값을 가진 DEL_X, DEL_Y 컬럼 추가
			MEMBER TB의 ADDR컬럼을 EMAIL로 변경
			3BOARDS TB 수정

	수정일 : 2020.05.08
	수정 내용 : BOARDS컬럼 변경( USERNO → NICKNAME )
			MEMBER TB컬럼 POSTCODE, ADDR, ADDR_X, ADDR_Y 추가
	
	수정일 : 2020.05.11
	수정 내용 : Culture와 Delivery Comment TB 생성 → CDCOMMENT TB
	
	수정일 : 2020.05.14
	수정 내용 : HISTORY 테이블과 시퀀스, FAVORITES 테이블과 시퀀스 생성
			SHOPMENU 테이블과 시퀀스 생성
*/


/*
					※ 주의 ※
	==========  SYSTEM 계정 접속  ==========
	CREATE USER SOLO IDENTIFIED BY YOLO;
	GRANT CONNECT, RESOURCE TO SOLO;
	해주어야 SOLO계정이 생성됨.
	====================================
	
	[ Eclipse와 DB와 연결 ]
	Window → Data Source Explorer 클릭
	Database Connections 우클릭해서 New
	Oracle 선택하고 Next
	New Driver Definition 클릭
	Name/Type탭에서 Oracle Thin Driver | Oracle | 11 선택
	JAR List에서 ojdbc14.jar를 선택한 뒤 Remove JAR/Zip
	Add JAR/Zip을 클릭하여 C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib 경로에 있는 ojdbc6.jar파일 선택한 뒤 OK 클릭
	
	Connection URL에서 jdbc:oracle:thin:@server:1521:db에서 db를 xe로 변경
	변경하려면 Database instance에서 Service Name을 db에서 xe로 변경
	Host에다가 localhost입력
	User name을 "SOLO", Password를 "YOLO"입력한 뒤
	Test Connection 클릭해서 "Ping succeeded!"가 뜨면 성공
	
	다시 Database Connections에서 New Oracle하고 xe가 생성되어있으면 성공
	
	이제 상단에 Type을 Oracle_11, Name을 New Oracle, Database를 xe로 선택하면 준비 완료!!
	
	ORACLE에서는 CTRL+ENTER였지만, ECLIPSE에서는 ALT+X로 실행한다.

 */



-- ================================== MEMBER TB ===================================
DROP TABLE MEMBER;
DROP SEQUENCE MEMBERSEQ;

-- MEMBER TB
CREATE TABLE MEMBER(
	USERNO NUMBER PRIMARY KEY, 
	USERID VARCHAR2( 1000 ) UNIQUE NOT NULL, 
	USERPW VARCHAR2( 1000 ) NOT NULL, 
	NAME VARCHAR2( 1000 ) NOT NULL, 
	NICKNAME VARCHAR2( 2000 ) NOT NULL, 
	EMAIL VARCHAR2( 2000 ) NOT NULL, 
	PHONE VARCHAR2( 2000 ) NOT NULL, 
	HEIGHT NUMBER NOT NULL, 
	WEIGHT NUMBER NOT NULL, 
	POSTCODE NUMBER NOT NULL, 
	ADDR VARCHAR2( 2000 ) NOT NULL, 
	ADDR_DETAIL VARCHAR2( 2000 ) NOT NULL, 
	ADDR_X NUMBER NOT NULL, 
	ADDR_Y NUMBER NOT NULL, 
	GRADE VARCHAR2( 20 ) CHECK( GRADE IN ( 'ADMIN', 'USER' ) ) NOT NULL, 
	FAVOGENRE VARCHAR2( 2000 ) NOT NULL, 
	FAVOHT VARCHAR2( 2000 ) NOT NULL,
--	FAVOGENRE1 VARCHAR2( 2000 ) NOT NULL, 
--	FAVOGENRE2 VARCHAR2( 2000 ) DEFAULT '', 
--	FAVOGENRE3 VARCHAR2( 2000 ) DEFAULT '', 
--	FAVOHT1 VARCHAR2( 2000 ) NOT NULL,
--	FAVOHT2 VARCHAR2( 2000 ) DEFAULT '', 
--	FAVOHT3 VARCHAR2( 2000 ) DEFAULT '', 
	SUBDATE DATE DEFAULT SYSDATE
);
-- MEMBER TB SEQ
CREATE SEQUENCE MEMBERSEQ
NOCACHE;

INSERT INTO MEMBER
VALUES( MEMBERSEQ.NEXTVAL, 'ADMIN', 'ADMIN', 'ADMIN', 'ADMIN', 'ADMIN@naver.com', '010-8765-4321', '178.5', '71.4', 12345, '관리시 관리구 관리동', '관리아파트 관리동 관리호', 37.500637, 127.036371, 'ADMIN', '액션', '복부', SYSDATE );
INSERT INTO MEMBER
VALUES( MEMBERSEQ.NEXTVAL, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST@naver.com', '010-8765-4321', '178.5', '71.4', 12345, '시험시 시험구 시험동', '시험아파트 시험동 시험호', 37.500637, 127.036371, 'USER', '액션', '상체', SYSDATE );

SELECT * FROM MEMBER;
-- ================================================================================



-- ================================== 3BOARDS TB ==================================
DROP TABLE BOARDS;
DROP SEQUENCE MBOARDSEQ;
DROP SEQUENCE HTBOARDSEQ;
DROP SEQUENCE CBOARDSEQ;
DROP SEQUENCE BOARDSSEQ;

-- 유저게시판( 커뮤니티게시판 : MOVIE, HT, COOK )
CREATE TABLE BOARDS(
	DIVNO NUMBER CHECK( DIVNO IN ( 1, 2, 3 ) ) NOT NULL, 
	BOARDNO NUMBER PRIMARY KEY, 
	BTITLE VARCHAR2( 2000 ) NOT NULL, 
--	USERNO VARCHAR2( 2000 ) NOT NULL, 
	NICKNAME VARCHAR2( 2000 ) NOT NULL, 
	BCONTENT VARCHAR2( 4000 ) NOT NULL, 
	REGDATE DATE DEFAULT SYSDATE, 
	VIEWNUM NUMBER DEFAULT 0 NOT NULL, 
	RECOMNUM NUMBER DEFAULT 0 NOT NULL
);
---------------------------
-- BOARDNO에 사용될 SEQ

-- MOVIE커뮤니티 SEQ
CREATE SEQUENCE MBOARDSEQ
NOCACHE;
-- HT커뮤니티 SEQ
CREATE SEQUENCE HTBOARDSEQ
NOCACHE;
-- COOK커뮤니티 SEQ
CREATE SEQUENCE CBOARDSEQ
NOCACHE;
---- 유저게시판 구분 SEQ
--CREATE SEQUENCE BOARDSSEQ
--NOCACHE;
---------------------------

-- DIVNO : 1( CULTURE ), 2( HOME TRAINNING ), 3( COOK ), 4( DELIVERY )
CREATE TABLE DIVTB(
	DIVNO NUMBER CHECK( DIVNO IN ( 1, 2, 3, 4 ) ) NOT NULL, 
	BNAME VARCHAR2( 20 )
);

INSERT INTO BOARDS
VALUES( 1, 'Culture' );
VALUES( 2, 'Home Trainning' );
VALUES( 3, 'Cook' );
VALUES( 4, 'Delivery' );
-- ================================================================================



-- ===================================== SNS TB ===================================
DROP TABLE SNSTB;
DROP SEQUENCE SNSTBSEQ;

-- 개인 일기장( SNS ) TB
CREATE TABLE SNSTB(
	SNSNO NUMBER PRIMARY KEY, 
	STITLE VARCHAR2( 1000 ) NOT NULL, 
	USERNO VARCHAR2( 1000 ) NOT NULL, 
	SCONTENT VARCHAR2( 4000 ) NOT NULL, 
	REGDATE DATE DEFAULT SYSDATE NOT NULL
);
-- 개인 일기장 SEQ
CREATE SEQUENCE SNSTBSEQ
NOCACHE;
-- ================================================================================



-- ================================== USERCAL TB ==================================
DROP TABLE USERCAL;
DROP SEQUENCE USERCALSEQ;

-- 유저 칼로리 TB
CREATE TABLE USERCAL(
	UCALNO NUMBER PRIMARY KEY, 
	USERNO NUMBER NOT NULL, 
	SUMCAL NUMBER, 
	SUBCAL NUMBER, 
	REGDATE DATE DEFAULT SYSDATE NOT NULL
);
-- 유저 칼로리 TB SEQ
CREATE SEQUENCE USERCALSEQ
NOCACHE;

-- UCAL INSERT
INSERT INTO USERCAL
VALUES( USERCALSEQ.NEXTVAL, 2, 1500, 1000, '20-05-01' );
INSERT INTO USERCAL
VALUES( USERCALSEQ.NEXTVAL, 2, 1650, 1120, '20-05-02' );
INSERT INTO USERCAL
VALUES( USERCALSEQ.NEXTVAL, 2, 1420, 980, '20-05-03' );

SELECT UCALNO, USERNO, SUMCAL, SUBCAL, REGDATE
FROM USERCAL JOIN MEMBER USING( USERNO )
WHERE USERNO = 2;
-- ================================================================================



-- ================================= COMMENTS TB ==================================
DROP TABLE COMMENTS;
DROP SEQUENCE COMMENTSEQ;

-- 커뮤니티 게시판의 댓글 TB
CREATE TABLE COMMENTS(
	COMNO NUMBER PRIMARY KEY, 
	BOARDNO NUMBER NOT NULL, 
	DIVNO NUMBER NOT NULL, 
	USERNO VARCHAR2( 1000 ), 
	BCONTENT VARCHAR2( 4000 ), 
	REGDATE DATE DEFAULT SYSDATE NOT NULL
);
-- 댓글 SEQ
CREATE SEQUENCE COMMENTSEQ
NOCACHE;
-- ================================================================================



/*
-- ================================= CDCOMMENT TB =================================
DROP TABLE CDCOMMENT;
DROP SEQUENCE CDCOMMENTSEQ;

-- CULTURE & DELIVERY의 댓글 TB
CREATE TABLE COMMENT(
	COMNO NUMBER PRIMARY KEY, 
	BOARDNO NUMBER NOT NULL, 
	DIVNO NUMBER CHECK( DIVNO IN ( 1, 4 ) ) NOT NULL,  
	NICKNAME VARCHAR2( 1000 ), 
	BCONTENT VARCHAR2( 4000 ), 
	REGDATE DATE DEFAULT SYSDATE NOT NULL
);
-- 댓글 SEQ
CREATE SEQUENCE COMMENTSEQ
NOCACHE;
-- ================================================================================
*/



-- =========================== DELIVERY → RESTAURANT => SHOP TB ============================
-- 형꺼에서 Shop이 Delivery
--DROP TABLE DELIVERY;
--DROP SEQUENCE DELIVERYSEQ;
DROP TABLE RESTAURANT;
DROP SEQUENCE RESTAURANTSEQ;

-- 배달 정보 TB
CREATE TABLE RESTAURANT(
	DELNO NUMBER PRIMARY KEY, 
	DELNAME VARCHAR2( 1000 ) NOT NULL, 
	DELINTRO VARCHAR2( 4000 ) NOT NULL, 
	DELADDR VARCHAR2( 1000 ) NOT NULL, 
	DEL_X NUMBER NOT NULL, 
	DEL_Y NUMBER NOT NULL
);
-- 배달 정보 TB SEQ
CREATE SEQUENCE RESTAURANTSEQ
NOCACHE;
-- ================================================================================



-- ============================ RESTAURANT → FOOD => DELIVERY TB ===============================
-- 형꺼에서 Delivery가 Food
DROP TABLE FOOD;
DROP SEQUENCE FOODSEQ;

-- 음식점 정보 TB
CREATE TABLE FOOD(
	FNO NUMBER PRIMARY KEY, 
	DELNO NUMBER NOT NULL, 
	FNAME VARCHAR2( 1000 ) NOT NULL, 
	FPRICE NUMBER DEFAULT 0 NOT NULL, 
	FSCORE NUMBER DEFAULT 0 NOT NULL, 
	FCAL NUMBER DEFAULT 0 NOT NULL
);
-- 음식점 TB SEQ
CREATE SEQUENCE FOODSEQ
NOCACHE;
-- ================================================================================



-- ================================= SHOPMENU TB ==================================
DROP TABLE SHOPMENU;
DROP SEQUENCE SHOPMENUSEQ;

-- SHOPMENU TB
CREATE TABLE SHOPMENU(
	MENUNO NUMBER PRIMARY KEY, 
	SHOPNO NUMBER, 
	MENUNAME VARCHAR( 2000 ), 
	PRICE NUMBER, 
	MENUCAL NUMBER
);

-- SHOPMENUSEQ TB SEQ
CREATE SEQUENCE SHOPMENUSEQ
NOCACHE;
-- ================================================================================



-- =================================== MOVIE TB ===================================
DROP TABLE MOVIE;
DROP SEQUENCE MOVIESEQ;

-- MOVIE정보 TB
CREATE TABLE MOVIE(
	MNO NUMBER PRIMARY KEY, 
	MNAME VARCHAR2( 1000 ) NOT NULL, 
	GENRE VARCHAR2( 1000 ) NOT NULL, 
	NATION VARCHAR2( 1000 ) NOT NULL, 
	RELEASE VARCHAR2( 1000 ) NOT NULL, 
	MGRADE VARCHAR2( 1000 ) NOT NULL, 
	MSCORE NUMBER NOT NULL, 
	MINTRO VARCHAR2( 4000 ) NOT NULL, 
	MTIME VARCHAR2( 1000 ) NOT NULL, 
	MURL VARCHAR2( 1000 ) NOT NULL, 
	DIRECTOR VARCHAR2( 1000 ) NOT NULL, 
	ACTOR VARCHAR2( 1000 ), 
	MID NUMBER NOT NULL
);
-- MOVIE정보 TB SEQ
CREATE SEQUENCE MOVIESEQ
NOCACHE;

SELECT * FROM MOVIE;
-- ================================================================================



-- =================================== REVIEW TB ==================================
DROP TABLE REVIEW;
DROP SEQUENCE REVIEWSEQ;

-- REVIEW TB( 배달, 영화 리뷰 )
CREATE TABLE REVIEW(
	DIVREVIEW NUMBER NOT NULL UNIQUE, 
	COMNO NUMBER PRIMARY KEY, 
	USERNO VARCHAR2( 1000 ) NOT NULL, 
	CONTENT VARCHAR2( 4000 ) NOT NULL, 
	REGDATE DATE DEFAULT SYSDATE NOT NULL
);
-- REVIEW TB SEQ
CREATE SEQUENCE REVIEWSEQ
NOCACHE;
-- ================================================================================



-- =============================== HOMETRAINING TB ================================
DROP TABLE TRAINING;
DROP SEQUENCE TRAININGSEQ;

-- HT TB
CREATE TABLE TRAINING(
	HTNO NUMBER PRIMARY KEY, 
	HTNAME VARCHAR2( 1000 ) NOT NULL, 
	HTINTRO VARCHAR2( 4000 ) NOT NULL, 
	HTTIME VARCHAR2( 1000 ) NOT NULL, 
	HTLEVEL VARCHAR2( 40 ) CHECK( HTLEVEL IN ( '고급', '중급', '초급' ) ) NOT NULL, 
	HTPART VARCHAR2( 1000 ) NOT NULL, 
	SUBCAL NUMBER NOT NULL, 
--	HTURL VARCHAR2( 1000 ) NOT NULL
	HTAVI VARCHAR2( 1000 ) NOT NULL, 
	HTPIC VARCHAR2( 1000 ) NOT NULL
);
-- HT TB SEQ
CREATE SEQUENCE TRAININGSEQ
NOCACHE;
-- ================================================================================



-- ==================================== COOK TB ===================================
DROP TABLE COOK;
DROP SEQUENCE COOKSEQ;

-- COOK TB
CREATE TABLE COOK(
	CNO NUMBER PRIMARY KEY, 
	CNAME VARCHAR2( 1000 ) NOT NULL, 
	CINTRO VARCHAR2( 4000 ) NOT NULL, 
	RECIPE VARCHAR2( 4000 ) NOT NULL, 
	CTYPE VARCHAR2( 1000 ) NOT NULL, 
	CCAL NUMBER NOT NULL, 
	CURL VARCHAR2( 1000 ) NOT NULL
);
-- COOK TB SEQ
CREATE SEQUENCE COOKSEQ
NOCACHE;
-- ================================================================================



-- ================================ FAVORITES TB ==================================
DROP TABLE FAVORITES;
DROP SEQUENCE FAVORITESSEQ;

-- FAVORITES TB
CREATE TABLE FAVORITES(
	FAVORITESNO NUMBER, 
	DIVNO NUMBER, 
	USERNO NUMBER, 
	TITLE VARCHAR( 1000 ), 
	IMG VARCHAR( 1000 ), 
	FAVOADDR VARCHAR( 2000 ), 
	REGDATE DATE DEFAULT SYSDATE
);

-- FAVORITES TB SEQ
CREATE SEQUENCE FAVORITESSEQ
NOCACHE;

SELECT * FROM FAVORITES;

-- DIVNO : 1( CULTURE ), 2( HOME TRAINNING ), 3( COOK ), 4( DELIVERY )
CREATE TABLE DIVTB(
	DIVNO NUMBER CHECK( DIVNO IN ( 1, 2, 3, 4 ) ) NOT NULL, 
	BNAME VARCHAR2( 20 )
);

SELECT * FROM DIVTB;
INSERT INTO DIVTB VALUES( 1, 'Culture' );
INSERT INTO DIVTB VALUES( 2, 'Home Trainning' );
INSERT INTO DIVTB VALUES( 3, 'Cook' );
INSERT INTO DIVTB VALUES( 4, 'Delivery' );

SELECT * FROM DIVTB WHERE DIVNO = 1;
-- ================================================================================




-- ================================= HISTORY TB ===================================
DROP TABLE HISTORY;
DROP SEQUENCE HISTORYSEQ;

-- HISTORY TB
CREATE TABLE HISTORY(
	HISNO NUMBER PRIMARY KEY, 
	DIVNO NUMBER, 
	USERNO NUMBER, 
	TITLE VARCHAR( 1000 ), 
	IMG VARCHAR( 1000 ), 
	HISADDR VARCHAR( 2000 ), 
	REGDATE DATE DEFAULT SYSDATE
);

-- HISTORY TB SEQ
CREATE SEQUENCE HISTORYSEQ
NOCACHE;

SELECT * FROM HISTORY;
-- ================================================================================



-- 2020.04.28 HT 추천수 컬럼 추가 및 HT, COOK 조회수 컬럼 추가 보류



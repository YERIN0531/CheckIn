-------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------- CUSTOMER TABLE--------------------------------------------
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
CREATE TABLE CUSTOMER(
    MID         VARCHAR2(50)  PRIMARY KEY,
    MPW         VARCHAR2(50)  NOT NULL,
    MNAME       VARCHAR2(50)  NOT NULL,
    MENAME      VARCHAR2(50),
    MPASSPORT   VARCHAR2(50),
    MTEL        VARCHAR2(50)  NOT NULL,
    MPOST       NUMBER(6)     NOT NULL,
    MADDRESS    VARCHAR2(300) NOT NULL,
    MDEADDRESS  VARCHAR2(200) NOT NULL,
    MGENDER     VARCHAR2(10)  NOT NULL,
    MBIRTH      DATE NOT NULL,
    MWITHD      NUMBER(10) DEFAULT 1 NOT NULL,
    MEMAIL      VARCHAR2(100) NOT NULL,
    MRDATE      DATE DEFAULT SYSDATE,
    MTOTAL      NUMBER(10) DEFAULT 0 NOT NULL,
    MMILEAGE    NUMBER(10) DEFAULT 0 NOT NULL
);
SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER VALUES ('aaa', '123', '서예린', 'SEOYERIN',NULL,'010-1111-1111','12345','서울 구로구','101동 101호','f','19950531',1,'tjqud531531@naver.com',SYSDATE,0,0);
INSERT INTO CUSTOMER VALUES ('bbb', '123', '윤정임', 'YOONJEONGIM',NULL,'010-2222-2222','12346','서울 용산구','102동 102호','f','19950822',1,'zeolim@naver.com',SYSDATE,0,0);
INSERT INTO CUSTOMER VALUES ('ccc', '123', '오동준', 'OHDONGJUN',NULL,'010-3333-3333','12347','서울 강남구','103동 103호','m','19951010',1,'dong@naver.com',SYSDATE,0,0);
INSERT INTO CUSTOMER VALUES ('ddd', '123', '최진영', 'CHOIJINYOUNG',NULL,'010-4444-4444','12348','서울 서초구','104동 104호','m','19991203',1,'jin@naver.com',SYSDATE,0,0);
INSERT INTO CUSTOMER VALUES ('eee', '123', '김빈', 'KIMBIN',NULL,'010-5555-6666','12349','서울 광진구','105동 105호','m','19960826',1,'bin@naver.com',SYSDATE,0,0);
--1. 회원가입
--joinMember
INSERT INTO CUSTOMER VALUES 
            ('fff', '123', '동구', 'DONG',NULL,'010-5555-6666','12349','서울 낙성대역','105동 105호','m','19960826',1,'dong@naver.com',SYSDATE,0,0);
--2. 아이디 중복체크
--idConfirm
SELECT COUNT(*) FROM CUSTOMER WHERE MID = 'aaa';
commit;

--2. 로그인
--loginMember
SELECT * FROM CUSTOMER WHERE MID='aaa' AND MPW='123';

--3.회원상세보기(MID)
--getDetailMember
SELECT * FROM CUSTOMER WHERE MID ='aaa';

--4.정보수정
-- 마일리지 (수정) 
UPDATE CUSTOMER SET MMILEAGE=100000 WHERE MID='aaa';
SELECT * FROM CUSTOMER WHERE MID='aaa';
COMMIT;
-- 106850
--modifyMember
UPDATE CUSTOMER SET MPW='111',
                    MNAME='서치코',
                    MPASSPORT='111-111-11',
                    MTEL='010-2312-1234',
                    MPOST=3456,
                    MADDRESS='독도',
                    MDEADDRESS='1011동',
                    MGENDER='m',
                    MBIRTH='19990808',
                    MWITHD=1,
                    MEMAIL='ABC@NAVER.COM',
                    MRDATE = SYSDATE,
                    MTOTAL=0,
                    MMILEAGE=0
            WHERE MID ='aaa';
                    
--5.회원탈퇴 탈퇴여부 UPDATE (1 , 0)
--withdrawMember
UPDATE CUSTOMER SET mwithd = 0 WHERE MID ='eee';
SELECT * FROM CUSTOMER WHERE MID='eee';

--6.아이디찾기 
--findldMember
SELECT MID FROM CUSTOMER WHERE MID ='ddd';

--7. 비밀번호찾기 (아이디 ,이메일 )
--findPwMember
SELECT MPW FROM CUSTOMER WHERE MID='aaa' AND MEMAIL='ABC@NAVER.COM';
-------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------- CUSTOMER TABLE--------------------------------------------



---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--------------------------CUSTOMER_GRADE-----------------------------------------

DROP TABLE CUSTOMER_GRADE;

CREATE TABLE CUSTOMER_GRADE(
    GRADE_NAME VARCHAR2(50) PRIMARY KEY,
    LOWTOTAL NUMBER(10) NOT NULL,
    HIGHTOTAL NUMBER(10) NOT NULL
);

SELECT * FROM CUSTOMER_GRADE;

INSERT INTO CUSTOMER_GRADE VALUES ('브론즈',0,1000000);
INSERT INTO CUSTOMER_GRADE VALUES ('실버',1000001, 5000000 );
INSERT INTO CUSTOMER_GRADE VALUES ('골드',5000001,20000000);
INSERT INTO CUSTOMER_GRADE VALUES ('플래티넘',20000001,50000000);
INSERT INTO CUSTOMER_GRADE VALUES ('VIP', 50000001,9999999999);


--------------------------CUSTOMER_GRADE-----------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


-------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--------------------------MANAGER------------------------------------------------
DROP TABLE MANAGER;

CREATE TABLE MANAGER(
    AID VARCHAR2(20) PRIMARY KEY,
    APW VARCHAR2(20) NOT NULL,
 
•••
   ANAME VARCHAR2(20) NOT NULL,
    AEMAIL VARCHAR2(50) NOT NULL,
    gradfe 
);

INSERT INTO MANAGER VALUES ('1','123','총관리자','chlwlsdud69@naver.com');
INSERT INTO MANAGER VALUES ('subadmin','123','서브관리자','kok3443@naver.com');
    --1.관리자 등록
    -- joinAdmin
    INSERT INTO MANAGER VALUES ('DELETE ','123','서브관리자','kok3443@naver.com');
    --2.관리자 로그인
    -- loginAdmin
    SELECT * FROM MANAGER WHERE AID='admin' AND APW='123';
    --3. 관리자 삭제 
    -- deleteAdmin
    SELECT * FROM MANAGER;
    DELETE FROM MANAGER WHERE AID='DELETE ';
    --4. 관리자탈퇴 
    -- withdrawAdmin
     DELETE FROM MANAGER WHERE AID='DELETE ';
    
    --5. 관리자 리스트 adminList
    SELECT * FROM MANAGER;
    --6. 관리자 메일 
    SELECT COUNT(*) FROM MANAGER WHERE AEMAIL ='kok3443@naver.com';
    --7. 관리자 상세보기
    SELECT * FROM MANAGER WHERE AID ='subadmin';
--------------------------MANAGER------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----------------------------QNA_BOARD-----------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

DROP TABLE QNA_BOARD;
DROP SEQUENCE QNA_SEQ;


    
CREATE TABLE QNA_BOARD(
  QNUM        NUMBER(6) PRIMARY KEY ,
  QID         VARCHAR2(20) NOT NULL,
  QTITLE      VARCHAR2(300) NOT NULL,
  QCONTENT    VARCHAR2(3000) NOT NULL,
  QFILE1      VARCHAR2(100) ,
  QFILE2      VARCHAR2(100),
  QHIT        NUMBER(10) DEFAULT 0 NOT NULL,
  QIP         VARCHAR2(50) NOT NULL,
  QRDATE      DATE    DEFAULT SYSDATE,
  QSECRET     NUMBER(10) NOT NULL,
  QPASSWORD   NUMBER(10) NOT NULL,
  QGROUP      NUMBER(10) NOT NULL,
  QSTEP       NUMBER(10) NOT NULL,
  QINDENT     NUMBER(10) NOT NULL
);
 CREATE SEQUENCE QNA_SEQ
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;  
SELECT * FROM QNA_BOARD;

-- 원글은QID 멤버 ID
-- 답글은 관리자 ID 
--사진첨부문의
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QFILE1,QFILE2,QIP,QSECRET,QPASSWORD,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'ccc','문의제목4','문의본문4','noimg.jpg4','noimg.jpg4','192.168.10.30',1,111,QNA_SEQ.NEXTVAL,0,0);
--사진 없이 문의 
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QIP,QSECRET,QPASSWORD,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'aaa','문의제목','문의본문','192.168.10.30',1,111,QNA_SEQ.NEXTVAL,0,0);
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QIP,QSECRET,QPASSWORD,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'bbb','문의제목2','문의본문2','192.168.10.30',1,222,QNA_SEQ.NEXTVAL,0,0);
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QIP,QSECRET,QPASSWORD,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'aaa','문의제목','문의본문','192.168.10.30',1,333,QNA_SEQ.NEXTVAL,0,0);
SELECT * FROM QNA_BOARD ORDER BY QGROUP DESC, QSTEP;

--1.글목록 listQna
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QNA_BOARD ORDER BY QGROUP DESC, QSTEP) A)
        WHERE RN BETWEEN 1 AND 10;
       
        
--2. 1번글에대한 답변(관리자만 답변가능 qid 관리자 아이디)
--replyQna
INSERT INTO QNA_BOARD (QNUM,QID,QSECRET,QPASSWORD, QTITLE, QCONTENT,QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNA_SEQ.NEXTVAL, 'admin',1,111,'관리자답변1','관리자답변본문1',1, 1, 1, '192.168.20.31');
-- 더미데이터 (위의 1번글에 대한 두번째 답변글)

-- 3. 답변글 추가전 STEP a 수행
-- replyPreStepQna
UPDATE QNA_BOARD SET QSTEP = QSTEP+1 
    WHERE QGROUP = 1 AND QSTEP>0;
--1번글에대한 답답변
INSERT INTO QNA_BOARD (QNUM,QID,QSECRET,QPASSWORD, QTITLE, QCONTENT,QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa',1,111,'답답글','답답본문',1, 3, 2, '192.168.20.31');

--4.(비밀글)QNUM,QPASSWORD,QSECRET(비밀글여부)로 본인글 상세보기(DTO)
-- detailQna
SELECT * FROM QNA_BOARD WHERE QNUM=1 AND QPASSWORD=111 AND QSECRET=1;
--5. 글 개수 
-- countQna
SELECT COUNT(*) FROM QNA_BOARD;
--6. 후기쓰기 원글
--insertQna
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QFILE1,QFILE2,QIP,QSECRET,QPASSWORD,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'ccc','문의제목4','문의본문4','noimg.jpg4','noimg.jpg4','192.168.10.30',1,111,QNA_SEQ.NEXTVAL,0,0);
--7. HITUP
--hitupQna
SELECT * FROM QNA_BOARD;
UPDATE QNA_BOARD SET QHIT = QHIT +1 WHERE QNUM=1;
--8.글 수정
--modifyQna
UPDATE QNA_BOARD SET QTITLE ='수정제목1',
                     QCONTENT = '수정본문1',
                     QIP    = '192',
                     QFILE1 = 'update.jpg',
                     QFILE2 = 'update.jpg',
                     QPASSWORD = '123'
                     WHERE QNUM = 1;
--9.글삭제
--deleteQna
--원글 지울때 답글 다지우기 
SELECT * FROM QNA_BOARD;
DELETE FROM QNA_BOARD WHERE QGROUP = 1 AND (QSTEP>=0 AND QSTEP<(select NVL(MIN(QSTEP),9999) FROM QNA_BOARD WHERE QGROUP=1 AND QSTEP>0 AND QINDENT<=0));
--qnum으로 글지우기 
DELETE FROM QNA_BOARD WHERE qnum =7;
----------------------------QNA_BOARD-----------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------



------------------------------REVIEW_BOARD---------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

DROP TABLE REVIEW_BOARD;
DROP SEQUENCE REVIEW_SEQ;
CREATE TABLE REVIEW_BOARD(
     RNUM       NUMBER(10) PRIMARY KEY,
     MID        VARCHAR2(50) REFERENCES CUSTOMER(MID),
     RTITLE     VARCHAR2(500) NOT NULL,
     RCONTENT   VARCHAR2(3000) NOT NULL,
     RIMAGE1    VARCHAR2(100),
     RIMAGE2    VARCHAR2(100),
     RIMAGE3    VARCHAR2(100),
     RIMAGE4    VARCHAR2(100),
     RIMAGE5    VARCHAR2(100),
     RHIT       NUMBER(10)  DEFAULT 0 NOT NULL ,
     RIP        VARCHAR2(50),
     RRDATE     DATE    DEFAULT SYSDATE NOT NULL,
     RGROUP     NUMBER(10) NOT NULL,
     RSTEP      NUMBER(10)  NOT NULL,
     RINDENT   NUMBER(10)   NOT NULL
);
SELECT * FROM REVIEW_BOARD;
CREATE SEQUENCE REVIEW_SEQ
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;
INSERT INTO REVIEW_BOARD(RNUM , MID ,RTITLE ,RCONTENT,RIP, RGROUP,RSTEP,RINDENT)
        VALUES (REVIEW_SEQ.NEXTVAL,'aaa','후기제목','후기본문', '192.168.10.30' ,REVIEW_SEQ.CURRVAL,0,0);
INSERT INTO REVIEW_BOARD(RNUM , MID ,RTITLE ,RCONTENT,RIP, RGROUP,RSTEP,RINDENT)
        VALUES (REVIEW_SEQ.NEXTVAL,'bbb','후기제목2','후기본문2', '192.100.10.30' ,REVIEW_SEQ.CURRVAL,0,0);
INSERT INTO REVIEW_BOARD(RNUM , MID ,RTITLE ,RCONTENT,RIP, RGROUP,RSTEP,RINDENT)
        VALUES (REVIEW_SEQ.NEXTVAL,'ccc','후기제목3','후기본문3', '192.555.10.30' ,REVIEW_SEQ.CURRVAL,0,0);
--1.글목록
-- listReview
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM REVIEW_BOARD ORDER BY RGROUP DESC, RSTEP) A)
        WHERE RN BETWEEN 1 AND 6;
        
        
--2. 1번글에대한 답변(관리자만 답변가능 qid 관리자 아이디)
-- replyReview
INSERT INTO REVIEW_BOARD (RNUM,MID,RTITLE,RCONTENT, RIP, RGROUP,RSTEP, RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL, 'bbb','1번글답변','1번글답변본문','192.222.333',1, 1, 1);
-- 더미데이터 (위의 1번글에 대한 두번째 답변글)
-- 3. 답변글 추가전 STEP a 수행
-- replyPreStepReview
UPDATE REVIEW_BOARD SET RSTEP = RSTEP+1 
    WHERE RGROUP = 1 AND RSTEP>0;
--1번글에대한 답답변
INSERT INTO REVIEW_BOARD (RNUM,MID,RTITLE,RCONTENT, RIP, RGROUP,RSTEP, RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL, 'aaa','1번글답답변','1번글답답변본문','192.111.111',1, 3, 2);
SELECT * FROM REVIEW_BOARD;
--4.RNUM 으로 상세보기(DTO)
--detailReview
SELECT * FROM REVIEW_BOARD WHERE RNUM=1 ;
--5. 글 개수 
-- countReview
SELECT COUNT(*) FROM REVIEW_BOARD;
--6. 후기쓰기 원글
--insertReview
INSERT INTO REVIEW_BOARD(RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIP, RGROUP,RSTEP,RINDENT)
        VALUES (REVIEW_SEQ.NEXTVAL,'aaa','원글작성','원글본문','NOIMG.JPG', '192.168.10.30' ,REVIEW_SEQ.CURRVAL,0,0);
--7. 조회수올리기
--hitupReview
SELECT * FROM REVIEW_BOARD;
UPDATE REVIEW_BOARD SET RHIT = RHIT +1 WHERE RNUM=1;
--8.글 수정
--modifyReview
UPDATE REVIEW_BOARD SET RTITLE ='수정제목1',
                     RCONTENT = '수정본문1',
                     RIMAGE1 = 'UPDATE.JPG',
                     RIP    = '192.111.1'
                     WHERE RNUM = 6;
--9.글삭제
--원글 지울때 답글 다지우기 (꼬일까봐 아직 실행 안해봄 실행 해보고 복붙 바람 )
--deleteReview
DELETE FROM REVIEW_BOARD WHERE RGROUP = 1 AND (RSTEP>=0 AND RSTEP<(select NVL(MIN(RSTEP),9999) FROM REVIEW_BOARD WHERE RGROUP=1 AND RSTEP>0 AND RINDENT<=0));
--qnum으로 글지우기 
--deleteReview
DELETE FROM REVIEW_BOARD WHERE RNUM =5;
------------------------------REVIEW_BOARD---------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


-------------------------------TRIPMATE_BOARD--------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
DROP TABLE TRIPMATE_BOARD;
DROP SEQUENCE TRIP_SEQ;
CREATE TABLE TRIPMATE_BOARD(
    TNUM        NUMBER(10)      PRIMARY KEY,
    MID         VARCHAR2(50)    REFERENCES CUSTOMER(MID),
    TTITLE      VARCHAR2(300)   NOT NULL,
    TCONTENT    VARCHAR2(3000)  NOT NULL,
    TIMAGE      VARCHAR2(100)   ,
    THIT        NUMBER(10)      DEFAULT 0 NOT NULL,
    TRDATE      DATE            DEFAULT SYSDATE NOT NULL,
    TIP         VARCHAR2(50)    NOT NULL
);
CREATE SEQUENCE TRIP_SEQ
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;
SELECT * FROM TRIPMATE_BOARD;
SELECT * FROM CUSTOMER;
--더미데이터 동행게시판 
INSERT INTO TRIPMATE_BOARD(TNUM , MID ,TTITLE ,TCONTENT,TIMAGE, TIP)
        VALUES (TRIP_SEQ.NEXTVAL,'aaa','치코펀치','얍','NOIMG.JPG', '192.168.10.30');
INSERT INTO TRIPMATE_BOARD(TNUM , MID ,TTITLE ,TCONTENT,TIMAGE, TIP)
        VALUES (TRIP_SEQ.NEXTVAL,'aaa','치코펀치2','얍2','NOIMG.JPG', '192.168.10.30');
INSERT INTO TRIPMATE_BOARD(TNUM , MID ,TTITLE ,TCONTENT,TIMAGE, TIP)
        VALUES (TRIP_SEQ.NEXTVAL,'aaa','치코펀치3','얍3','NOIMG.JPG', '192.168.10.30');
--1.글목록 (최신글 위로)
--listMate
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM TRIPMATE_BOARD ORDER BY TNUM DESC)A)
        WHERE RN BETWEEN 1 AND 6;

--2.TNUM 으로 상세보기(DTO)
-- detailMate
SELECT * FROM TRIPMATE_BOARD WHERE TNUM=1 ;
--3. 글 개수 
--countMate
SELECT COUNT(*) FROM TRIPMATE_BOARD;
--4. 후기쓰기 원글
--insertMate
INSERT INTO TRIPMATE_BOARD(TNUM , MID ,TTITLE,TCONTENT,TIMAGE, TIP)
        VALUES (TRIP_SEQ.NEXTVAL,'aaa','치코펀치3','얍3','NOIMG.JPG', '192.168.10.30');
--5. HITUP
-- hitupMate
SELECT * FROM TRIPMATE_BOARD;
UPDATE TRIPMATE_BOARD SET THIT = THIT +1 WHERE TNUM=1;
--6.글 수정
--modifyMate
UPDATE TRIPMATE_BOARD SET TTITLE ='수정제목3',
                     TCONTENT = '수정본문3',
                     TIMAGE = 'UPDATE.JPG',
                     TRDATE = SYSDATE,
                     TIP    = '192.111.1'
                     WHERE TNUM = 3;
--7.글삭제
--TNUM으로 글지우기 
--deleteMate
DELETE FROM TRIPMATE_BOARD WHERE TNUM =2;
-------------------------------TRIPMATE_BOARD--------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------




-------------------------------TRIP_REPLY--------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--TRIP_REPLY
DROP TABLE TRIP_REPLY;
DROP SEQUENCE TRREPLY_SEQ;
CREATE TABLE TRIP_REPLY(
    TRNUM   NUMBER(10) PRIMARY KEY,
    TNUM    NUMBER(10) REFERENCES TRIPMATE_BOARD(TNUM),
    MID     VARCHAR2(50) REFERENCES CUSTOMER(MID),
    TRMEMO  VARCHAR2(1000) NOT NULL,
    TRRDATE DATE DEFAULT SYSDATE NOT NULL,
    TRIP    VARCHAR2(50) NOT NULL
);
CREATE SEQUENCE TRREPLY_SEQ
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;
--더미데이터 댓글 ?????
INSERT INTO TRIP_REPLY(TRNUM , TNUM ,MID ,TRMEMO, TRIP)
        VALUES (TRREPLY_SEQ.NEXTVAL,1,'aaa','치코펀치에댓글', '192.168.10.30');
INSERT INTO TRIP_REPLY(TRNUM , TNUM ,MID ,TRMEMO, TRIP)
        VALUES (TRREPLY_SEQ.NEXTVAL,1,'aaa','치코펀치에댓글2', '192.168.10.30');
INSERT INTO TRIP_REPLY(TRNUM , TNUM ,MID ,TRMEMO, TRIP)
        VALUES (TRREPLY_SEQ.NEXTVAL,1,'aaa','치코펀치에댓글3', '192.168.10.30');

SELECT * FROM TRIP_REPLY;
--SELECT T.*,R.* FROM TRIPMATE_BOARD T,TRIP_REPLY R WHERE T.TNUM = R.TNUM;

--2. 댓글 목록 출력하기 -- 페이징 처리(startRow , endRow) // rownum 해주기
SELECT * FROM (SELECT ROWNUM RN, A.*
        FROM(SELECT * FROM TRIP_REPLY WHERE TNUM =1 ORDER BY TRNUM DESC) A) WHERE RN BETWEEN 1 AND 10;
--3. 댓글 갯수
SELECT COUNT(*) REPLYCNT FROM TRIP_REPLY;
--4. TRNUM 으로 DTO 가져오기
SELECT * FROM TRIP_REPLY WHERE TRNUM=1;


--5. 댓글수정하기
UPDATE TRIP_REPLY SET 
   TRMEMO = '내용바꿔바꿔'    
   WHERE TRNUM ='1';
   SELECT * FROM TRIP_REPLY;
-------------------------------TRIP_REPLY--------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


--------------------------------NOTICE_BOARD--------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


DROP TABLE NOTICE_BOARD;
DROP SEQUENCE NOTICE_SEQ;
CREATE TABLE NOTICE_BOARD(
    NNUM        NUMBER(5) PRIMARY KEY,
    AID         VARCHAR2(20) REFERENCES MANAGER (AID),
    NTITLE      VARCHAR2(100)   NOT NULL,
    NCONTENT    VARCHAR2(1000)  NOT NULL,
    NIMAGE      VARCHAR2(50),
    NHIT        NUMBER(10) DEFAULT 0 NOT NULL,
    NRDATE      DATE DEFAULT SYSDATE NOT NULL
);
SELECT * FROM MANAGER;
CREATE SEQUENCE NOTICE_SEQ
    MAXVALUE 999999  
    NOCACHE
    NOCYCLE;
--더미데이터 원글
SELECT * FROM NOTICE_BOARD;
INSERT INTO NOTICE_BOARD(NNUM , AID ,NTITLE ,NCONTENT,NIMAGE)
        VALUES (NOTICE_SEQ.NEXTVAL,'admin','옥시화이팅','화이팅','NOIMG.JPG');
INSERT INTO NOTICE_BOARD(NNUM , AID ,NTITLE ,NCONTENT,NIMAGE)
        VALUES (NOTICE_SEQ.NEXTVAL,'admin','옥시화이팅2','화이팅2','NOIMG.JPG2');
INSERT INTO NOTICE_BOARD(NNUM , AID ,NTITLE ,NCONTENT,NIMAGE)
        VALUES (NOTICE_SEQ.NEXTVAL,'admin','옥시화이팅3','화이팅3','NOIMG.JPG3');

--1.글목록 (최신글 위로)
-- listNotice
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM NOTICE_BOARD ORDER BY NNUM DESC)A)
        WHERE RN BETWEEN 1 AND 6;
        

--2.NNUM 으로 상세보기(DTO)
-- detailNotice
SELECT * FROM NOTICE_BOARD WHERE NNUM=1 ;
--3. 글 개수 
-- countNotice
SELECT COUNT(*) FROM NOTICE_BOARD;
--4. 후기쓰기 원글
-- insertNotice
INSERT INTO NOTICE_BOARD(NNUM , AID ,NTITLE ,NCONTENT,NIMAGE)
        VALUES (NOTICE_SEQ.NEXTVAL,'admin','옥시화이팅','화이팅','NOIMG.JPG');
-- 5. HITUP
-- hitupNotice 
SELECT * FROM NOTICE_BOARD;
UPDATE NOTICE_BOARD SET NHIT = NHIT +1 WHERE NNUM=1;
--6.글 수정
-- modifyNotice
UPDATE NOTICE_BOARD SET NTITLE ='옥시수정제목1',
                     NCONTENT = '옥시수정본문1',
                     NIMAGE = 'UPDATE.JPG',
                     NRDATE = SYSDATE
                     WHERE NNUM = 1;
--7.글삭제
-- deleteNotice
DELETE FROM NOTICE_BOARD WHERE NNUM =3;
--------------------------------NOTICE_BOARD--------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

SELECT * FROM TAB;
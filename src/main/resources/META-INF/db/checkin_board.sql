----------------------------QNA_BOARD-----------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

DROP TABLE QNA_BOARD;
DROP SEQUENCE QNA_SEQ;

select * from customer;
    
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
  QPASSWORD   NUMBER(10) ,
  QGROUP      NUMBER(10) NOT NULL,
  QSTEP       NUMBER(10) NOT NULL,
  QINDENT     NUMBER(10) NOT NULL
);

commit;
 CREATE SEQUENCE QNA_SEQ
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;  
SELECT * FROM QNA_BOARD;
SELECT * FROM manager;
-- 원글은QID 멤버 ID
-- 답글은 관리자 ID 

--qna 더미
-- 공개글
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QFILE1,QFILE2,QIP,QSECRET,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'ccc','관리자님!!','이벤트 언제해요 !!!','France5.jpeg','France5.jpeg','192.168.10.30',0,QNA_SEQ.NEXTVAL,0,0);
-- 비밀글
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QFILE1,QFILE2,QIP,QSECRET,QPASSWORD,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'aaa','이건아니죠!','영국 가는게 너무 비싸자나요 !! 서치코님!','France5.jpeg','France5.jpeg','192.168.10.30',1,111,QNA_SEQ.NEXTVAL,0,0);
-- 비밀글
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QFILE1,QFILE2,QIP,QSECRET,QPASSWORD,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'bbb','환불 할래요 !','사정이 생겨 환불 하려고 합니다 !!!','France5.jpeg','France5.jpeg','192.168.10.30',1,111,QNA_SEQ.NEXTVAL,0,0);
    commit;
--1.글목록 listQna
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QNA_BOARD ORDER BY QGROUP DESC, QSTEP) A)
        WHERE RN BETWEEN 1 AND 50;
       
      select * from qna_board; 
      commit;
--2. 1번글에대한 답변(관리자만 답변가능 qid 관리자 아이디)
--replyQna
INSERT INTO QNA_BOARD (QNUM,QID,QSECRET,QPASSWORD, QTITLE, QCONTENT,QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNA_SEQ.NEXTVAL, 'admin',1,111,'관리자답변','관리자답변본문',11, 1, 1, '192.168.20.31');
    commit;
-- 더미데이터 (위의 1번글에 대한 두번째 답변글)

---- 필요 없음 3. 답변글 추가전 STEP a 수행
---- replyPreStepQna
--UPDATE QNA_BOARD SET QSTEP = QSTEP+1 
--    WHERE QGROUP = 1 AND QSTEP>0;
----1번글에대한 답답변
--INSERT INTO QNA_BOARD (QNUM,QID,QSECRET,QPASSWORD, QTITLE, QCONTENT,QGROUP, QSTEP, QINDENT, QIP)
--    VALUES (QNA_SEQ.NEXTVAL, 'aaa',1,111,'답답글','답답본문',1, 3, 2, '192.168.20.31');

--4.(비밀글)QNUM,QPASSWORD,QSECRET(비밀글여부)로 본인글 상세보기(DTO)
-- detailQna
SELECT * FROM QNA_BOARD WHERE QNUM=1 AND QPASSWORD=111 AND QSECRET=1;
SELECT * FROM QNA_BOARD WHERE QNUM=1;
--5. 글 개수 
-- countQna
SELECT COUNT(*) FROM QNA_BOARD;
--6. 후기쓰기 원글
--insertQna(비밀글)
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QFILE1,QFILE2,QIP,QSECRET,QPASSWORD,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'ccc','문의제목4','문의본문4','noimg.jpg4','noimg.jpg4','192.168.10.30',1,111,QNA_SEQ.NEXTVAL,0,0);
    commit;

--insertQna(공개글 qsecret 0  , qpassword 없이)
INSERT INTO QNA_BOARD(QNUM,QID,QTITLE,QCONTENT,QFILE1,QFILE2,QIP,QSECRET,QGROUP,QSTEP,QINDENT)
    VALUES(QNA_SEQ.NEXTVAL,'ccc','공개글','공개글','noimg.jpg4','noimg.jpg4','192.168.10.30',0,QNA_SEQ.NEXTVAL,0,0);
commit;
--7. HITUP
--hitupQna
SELECT * FROM QNA_BOARD;
UPDATE QNA_BOARD SET QHIT = QHIT +1 WHERE QNUM=1;
--8.글 수정
--modifyQna
UPDATE QNA_BOARD SET QTITLE ='관리자답변',
                     QCONTENT = '수정본문1',
                     QIP    = '192',
                     QFILE1 = 'update.jpg',
                     QFILE2 = 'update.jpg'
                     WHERE QNUM = 22;
                    commit;
--9.글삭제
--deleteQna
--원글 지울때 답글 다지우기 
SELECT * FROM QNA_BOARD;
DELETE FROM QNA_BOARD WHERE QGROUP = 1 AND (QSTEP>=0 AND QSTEP<(select NVL(MIN(QSTEP),9999) FROM QNA_BOARD WHERE QGROUP=1 AND QSTEP>0 AND QINDENT<=0));
--qnum으로 글지우기 
DELETE FROM QNA_BOARD WHERE qnum =8;

--답변글 여부 adminreply
SELECT QGROUP,COUNT(*)as FROM QNA_BOARD GROUP BY QGROUP HAVING  as > 1;
SELECT QGROUP,COUNT(*) FROM QNA_BOARD  GROUP BY QGROUP HAVING COUNT(*) > 1;
SELECT * FROM QNA_BOARD;           
--SELECT * FROM QNA_BOARD WHERE QGROUP >
---- 연습
SELECT COUNT(*) FROM QNA_BOARD where qgroup=1  GROUP BY QGROUP HAVING COUNT(*) > 1;
--최종 답변글여부 뿌리기 
SELECT qb.*, nvl((SELECT COUNT(*) FROM QNA_BOARD where qgroup=qb.qgroup 
    GROUP BY QGROUP HAVING COUNT(*) > 1),0) replyCnt 
          FROM QNA_BOARD qb ORDER BY QGROUP DESC, QSTEP
;
--연습
SELECT *FROM(SELECT ROWNUM RN, qb.* FROM (SELECT QNUM, QID , QTITLE, QCONTENT,QRDATE,QSECRET,QIP,QHIT,QGROUP,QINDENT,QSTEP,
nvl((SELECT COUNT(*) FROM QNA_BOARD where qgroup=qb.qgroup  GROUP BY QGROUP HAVING COUNT(*) > 1),0) replyCnt FROM QNA_BOARD qb ORDER BY QGROUP DESC, QSTEP)qb)
WHERE RN BETWEEN 1 AND 10;

--연습

SELECT * FROM (SELECT ROWNUM RN, A.*  
            FROM (SELECT * FROM QNA_BOARD ORDER BY QGROUP DESC, QSTEP) A)
        WHERE RN BETWEEN 1 AND 10;
-- 연습
SELECT COUNT(*) FROM QNA_BOARD;
SELECT COUNT(*) FROM QNA_BOARD WHERE QGROUP =1;
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

--1.글목록
-- listReview
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM REVIEW_BOARD ORDER BY RGROUP DESC, RSTEP) A)
        WHERE RN BETWEEN 1 AND 6;
        
        

    commit;
-- 더미데이터 (위의 1번글에 대한 두번째 답변글)
-- 3. 답변글 추가전 STEP a 수행
-- replyPreStepReview
--UPDATE REVIEW_BOARD SET RSTEP = RSTEP+1 
--    WHERE RGROUP = 1 AND RSTEP>0;
--1번글에대한 답답변
--INSERT INTO REVIEW_BOARD (RNUM,MID,RTITLE,RCONTENT, RIP, RGROUP,RSTEP, RINDENT)
--    VALUES (REVIEW_SEQ.NEXTVAL, 'aaa','1번글답답변','1번글답답변본문','192.111.111',1, 3, 2);
SELECT * FROM REVIEW_BOARD;
--4.RNUM 으로 상세보기(DTO)
--detailReview
SELECT * FROM REVIEW_BOARD WHERE RNUM=1 ;
--5. 글 개수 
-- countReview
SELECT COUNT(*) FROM REVIEW_BOARD;
--6. 후기쓰기 원글 리뷰 더미
--insertReview

--1. 일본 오카사 후기 
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'ccc','일본 오사카 후기','오늘은 일전에 말씀드린 일본 오사카 여행기(여행준비)에 관한 포스팅을 하려해요~ 제가 여행하면서 준비한 소소한 것들이 일본여행을 이제 준비하는 분들에게 도움이 될까 싶어 시리즈로 올려보려합니다.','Osaka1.jpg','Glico.jpeg','Osaka2.jpeg','Osaka3.jpeg', '192.168.10.30',REVIEW_SEQ.CURRVAL,0,0);
--2. 1번글에대한 답변
-- replyReview
INSERT INTO REVIEW_BOARD (RNUM,MID,RTITLE,RCONTENT, RIP, RGROUP,RSTEP, RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL, 'bbb','오사카 저도 가볼게요 !!','야호 !!!','192.222.333',1, 1, 1);
    
--2. 일본 오사카 라멘
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'ccc','일본 오사카 이치란 라멘 후기 ','저는 개인적으로 금룡라멘이 더맛있더라구요 이치란은 너~~~무 기대하고가서 기대이하였던 느낌쓰 호불호가 많이 갈린다는데 저는 불인가봐요 ㅜㅜ 그래도 일본 처음 가신다면 경험상 사람들 다가니까 한번쯤 먹어볼만해요 !!','Ramen1.jpeg','Ramen2.jpeg','Ramen3.jpeg','Ramen4.jpeg', '192.168.10.30',REVIEW_SEQ.CURRVAL,0,0);
commit;

COMMIT;
--3. 베트남 다낭 미케비치
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIMAGE5,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'ccc','베트남 미케비치 ','오후 혹시나해서 베트남 다낭 유명관광지인 미케비치를 가보았습니다. 베트남 다낭은 아직 봉쇄된 구역이 많으며 제가 사는 동네는 약 3주간 확진자가 나오지않아 그린존이 되어 구역내에서는 눈치껏 다닐수가 있게되었습니다.약 2달만에 누리는 시간이라 살것 같다는 생각이 들며 이렇게 조금씩 풀리다보면 해외여행 재개도 되겠다는 희망이 생기기도 하네요.코로나가 소박함이 주는 행복을 알게해주었네요.','MyKheBeach1.jpeg','MyKheBeach2.jpeg','MyKheBeach3.png','MyKheBeach4.jpeg','MyKheBeach5.jpeg', '192.112.40.60',REVIEW_SEQ.CURRVAL,0,0);

--4. 태국 골프 여행
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'bbb','태국 골프 여행 ','지금까지 여러 동남아골프여행 그리고 태국골프여행을 경험 했지만 알파인CC는 3손가락 안에 들정도로 코스가 재미있었던 골프장중 한곳이였습니다. 만약에 제 지인이 방콕골프 일정을 진행한다면 꼭 한번 가보라고 말하고싶은 골프장이기도 하구요. 저역시 다음방콕일정에는 여기는 꼭 다시 재방문할예정입니다. 스코어는 그렇게 좋은편은 아니였지만 "재미있게 플레이했다" 라는 생각이 드는 몇안되는 골프장중 한곳이였습니다. ','Thailand1.jpg','Thailand2.jpg','Thailand3.jpg','Thailand4.jpg', '192.998.60.10',REVIEW_SEQ.CURRVAL,0,0);

        COMMIT;
--5. 보라카이 여행
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'aaa','보라카이 여행 ','친구와 즐겁게 놀다왔던 보라카이 여행 후기 공유드립니다 필리핀 첫 여행이었는데 걱정과 달리 보라카이는 관광지라 안전해서 밤에도 잘 돌아다니고 즐기고 왔어요! ','Boracay1.jpg','Boracay2.jpg','Boracay3.jpg','Boracay4.jpg', '192.222.20.20',REVIEW_SEQ.CURRVAL,0,0);
--6. 런던 여행
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIMAGE5,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'ddd','런던 여행 ','개인 여행으로 후반에는 일로 방문했던 영국 런던. 문화적으로나 역사적으로나 머물고 싶게 만드는 환경을 가진 런던이어서 택한 이유도 있다.','London1.jpeg','London2.jpeg','London3.jpeg','London4.jpeg','London5.jpeg', '192.222.20.20',REVIEW_SEQ.CURRVAL,0,0);
select * from customer;
--7. 프랑스 여행
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIMAGE5,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'ddd','프랑스 여행 ','오늘은 제가 코시국 이전에 다녀온 파리 여행 후기를 보여드리려고 해요~ 노옵션 노쇼핑이라 정말 마음 편하게 놀다 온 거 같아요!','France4.jpeg','France1.jpeg','France2.jpeg','France3.jpeg','France5.jpeg', '192.111.20.20',REVIEW_SEQ.CURRVAL,0,0);
--8. 독일 축구 직관 여행
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'ccc','독일 축구 직관 ','독일 축구 직관후기 드디어 들고왔습니다 !!! ','soccer1.jpeg','soccer2.jpeg','soccer3.jpeg','soccer4.jpeg', '192.555.40.10',REVIEW_SEQ.CURRVAL,0,0);

-- 9 .독일 베를린 맛집
--9. 독일 축구 직관 여행
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'aaa','베를린 여행 후기 ',' 독일 베를린에 다녀왔습니다.  정말 뜻 깊은 여행이였습니다.  ','Germany1.webp','Germany2.jpg','Germany3.jpg','Germany4.jpg', '192.003.10.10',REVIEW_SEQ.CURRVAL,0,0);
commit;
--10 . 오사카 유니버셜
INSERT INTO REVIEW_BOARD (RNUM , MID ,RTITLE ,RCONTENT,RIMAGE1,RIMAGE2,RIMAGE3,RIMAGE4,RIP, RGROUP,RSTEP,RINDENT)
    VALUES (REVIEW_SEQ.NEXTVAL,'bbb','일본 유니버셜 후기 ','일본 유니버셜 스튜디오 재팬에 가시는 분들은 몇 가지 준비하셔야 할 것이 있습니다. 가장 필요한 건 입장권 그다음으로 필요한 건 강철 체력이지요. 저도 한 체력 하는 1인이지만 유니버셜 스튜디오 재팬 갈 때만큼은 체력적으로 힘들었답니다 .. ','Universal1.jpg','Universal2.jpg','Universal3.jpg','Universal4.jpg', '192.222.11.11',REVIEW_SEQ.CURRVAL,0,0);
commit;

--7. 조회수올리기
--hitupReview
SELECT * FROM REVIEW_BOARD;
UPDATE REVIEW_BOARD SET RHIT = RHIT +1 WHERE RNUM=1;
--8.글 수정
--modifyReview
--UPDATE REVIEW_BOARD SET RTITLE ='수정제목1',
 --                    RCONTENT = '수정본문1',
 --                    RIMAGE1 = 'UPDATE.JPG',
  --                   RIP    = '192.111.1'
  --                   WHERE RNUM = 6;
--9.글삭제
--원글 지울때 답글 다지우기 (꼬일까봐 아직 실행 안해봄 실행 해보고 복붙 바람 )
--deleteReview
--DELETE FROM REVIEW_BOARD WHERE RGROUP = 1 AND (RSTEP>=0 AND RSTEP<(select NVL(MIN(RSTEP),9999) FROM REVIEW_BOARD WHERE RGROUP=1 AND RSTEP>0 AND RINDENT<=0));
----qnum으로 글지우기 
----deleteReview
--DELETE FROM REVIEW_BOARD WHERE RNUM =5;
------------------------------REVIEW_BOARD---------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


-------------------------------TRIPMATE_BOARD--------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
DROP TABLE TRIPMATE_BOARD;
DROP SEQUENCE TRIP_SEQ;
CREATE SEQUENCE TRIP_SEQ
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;
    select * from tab;
CREATE TABLE TRIPMATE_BOARD(
    TNUM        NUMBER(10)      PRIMARY KEY,   -- 시퀀스 글번호
    MID         VARCHAR2(50)    REFERENCES CUSTOMER(MID),  -- 작성자 아이디
    TTITLE      VARCHAR2(300)   NOT NULL,   -- 글 제목  
    TGENDER VARCHAR2(10) NOT NULL,  -- 동행 성별  ( ex : 동성, 혼성  M, F , MG(혼성) )
    TMAXMEMBERCOUNT NUMBER(2) NOT NULL,  -- 동행 최대 인원수
    TNOWMEMBERCOUNT NUMBER(2) DEFAULT 1 NOT NULL,  -- 현재 인원수
    TSTYLE VARCHAR2(50) NOT NULL, --  여행 스타일  tripStay, tripBusy
    THOTELSTYLE VARCHAR2(50) NOT NULL, -- 숙소 스타일 가성비: CHEAP, 호화  :  EXPENSIVE
    TPLAYSTYLE VARCHAR2(50) NOT NULL, -- 노는 스타일 : 휴양:QUIET, 액티비티 : ACTIVITY
    TCONTENT    VARCHAR2(3000)  NOT NULL,   -- 글 본문
    TEAMNAME VARCHAR2(100) NOT NULL, -- 팀 이름
    TIMAGE      VARCHAR2(100)   ,   -- 글 사진
    THIT        NUMBER(10)      DEFAULT 0 NOT NULL,   -- 글 조회수  
    TRDATE      DATE            DEFAULT SYSDATE NOT NULL,  -- 글 작성시점
    TIP         VARCHAR2(50)    NOT NULL   -- 작성 ip 
);

DROP SEQUENCE TT_SEQ;
CREATE SEQUENCE TT_SEQ
    MAXVALUE 9999999999
    NOCACHE
    NOCYCLE;
    select * from tab;
DROP TABLE TRIPTEAM;
CREATE TABLE TRIPTEAM(
    TEAMID NUMBER(10) PRIMARY KEY,   -- 의미없는 시퀀스?
    TNUM REFERENCES TRIPMATE_BOARD(TNUM) NOT NULL,   -- 팀 이름
    MID REFERENCES CUSTOMER(MID) NOT NULL, -- 회원 아이디
    TSTEP NUMBER(10) NOT NULL, -- 직급 0이면 팀장 1 이면 팀원
    TTRDATE DATE DEFAULT SYSDATE NOT NULL  -- 가입 시점
);
DROP SEQUENCE TR_SEQ;
CREATE SEQUENCE TR_SEQ
    MAXVALUE 9999999999
    NOCACHE
    NOCYCLE;
    
DROP TABLE TRIPREQUEST;
CREATE TABLE TRIPREQUEST(
    TRNUM NUMBER(10) PRIMARY KEY,  -- 의미없는 시퀀스
    TNUM REFERENCES TRIPMATE_BOARD(TNUM) NOT NULL, -- 글 번호 
    MID REFERENCES CUSTOMER(MID) NOT NULL, -- 신청한 회원 아이디
    TRMEMO VARCHAR2(1000) NOT NULL,  --  메모 남기기
    TRRDATE DATE DEFAULT SYSDATE NOT NULL  -- 신청 시점
);

SELECT * FROM TRIPREQUEST WHERE TNUM IN (SELECT TNUM FROM TRIPMATE_BOARD WHERE MID = 'aaa');


SELECT * FROM TRIPMATE_BOARD;
select * from tripteam;
select * from tripRequest;
SELECT * FROM CUSTOMER;

commit;
--동행게시판  글 작성
INSERT INTO TRIPMATE_BOARD VALUES (TRIP_SEQ.NEXTVAL, 'aaa', '예린이와 여행갈 사람 구해요','MG',5,1,'TRIPBUSY','EXPENSIVE','ACTIVITY','예리니와 여행가실분~!','예린콩순이','예린.JPG',0,SYSDATE,'192.168.10.30');
INSERT INTO TRIPMATE_BOARD VALUES (TRIP_SEQ.NEXTVAL, 'ccc', '동준이와 여행갈 사람 구해요','MG',5,1, 'TRIPBUSY', 'CHEAP','QUIET','동주니와 여행가실분~!','동준콩돌이','동준.JPG',0,SYSDATE,'192.111.12.30');

-- 글 작성시에 여행팀에도 자동으로 글 작성
INSERT INTO TRIPTEAM VALUES (TT_SEQ.NEXTVAL,(select  max(tnum) from TRIPMATE_BOARD ),'aaa',0,SYSDATE);
INSERT INTO TRIPTEAM VALUES (TT_SEQ.NEXTVAL,(select  max(tnum) from TRIPMATE_BOARD ),'eee',0,SYSDATE);

commit;

-- 원글 수정
UPDATE TRIPMATE_BOARD SET TTITLE = '수정글',
                            TGENDER = 'MG',
                                TMAXMEMBERCOUNT = 4,
                                    TSTYLE = 'TRIPSTAY',
                                        THOTELSTYLE = 'CHEAP',
                                            TPLAYSTYLE = 'QUIET',
                                                TCONTENT = '수정본문',
                                                    TEAMNAME = '수정팀이름',
                                                        TIMAGE = 'ZZ.JPG'
                                             WHERE TNUM = 1;               
  select * from tripteam;
  commit;
-- 내 여행팀 팀장 조회
SELECT MID FROM TRIPTEAM WHERE TSTEP=0;
-- 내 특정 여행팀 조회
SELECT TMB.TEAMNAME,TT.*,M.* FROM TRIPTEAM TT, CUSTOMER M, TRIPMATE_BOARD TMB
    WHERE TT.MID = M.MID
        AND TT.TNUM = TMB.TNUM
            AND TT.TNUM = 2
                ORDER BY TSTEP,TTRDATE;
-- 여행팀에 들어가고싶어서 신청하기
INSERT INTO TRIPREQUEST VALUES (TR_SEQ.NEXTVAL,4,'eee','저 이팀에 껴서 같이 여행가고싶어요 제발 껴주세요ㅠㅠ',SYSDATE);
INSERT INTO TRIPREQUEST VALUES (TR_SEQ.NEXTVAL,1,'ddd','저 껴주세요 예린님');

-- 내 여행팀 리스트
SELECT TRB.TEAMNAME,TT.* FROM TRIPTEAM TT, TRIPMATE_BOARD TRB WHERE TT.TNUM = TRB.TNUM AND TT.MID='aaa';

-- 여행팀장이 요청 수락 리스트
SELECT TR.*, MNAME,MGENDER,MTEL,MBIRTH FROM TRIPREQUEST TR, CUSTOMER M
    WHERE TR.MID = M.MID
        AND TNUM IN (SELECT TNUM FROM TRIPMATE_BOARD WHERE MID='aaa')
            AND TNUM = 1
                ORDER BY TRRDATE;
    commit;   
-- 수락 전 인원체크
SELECT TNOWMEMBERCOUNT,TMAXMEMBERCOUNT FROM TRIPMATE_BOARD WHERE TNUM=2;

-- 여행팀장이 수락했을경우
INSERT INTO TRIPTEAM VALUES (TR_SEQ.NEXTVAL,4,'aaa',1,SYSDATE);
DELETE FROM TRIPREQUEST WHERE TNUM=2 AND MID='aaa';
UPDATE TRIPMATE_BOARD SET TNOWMEMBERCOUNT = TNOWMEMBERCOUNT +1 WHERE TNUM=2;

-- 여행팀장이 거절했을경우
DELETE FROM TRIPREQUEST WHERE TNUM=1 AND MID='bbb';
select * from triprequest;
commit;
select * from tripteam where tnum=1;
commit;
-- 여행팀 추방
DELETE FROM TRIPTEAM WHERE TNUM=1 AND mid='bbb';
select * from customer;
commit;

--1.글목록 (최신글 위로)
--listMate
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM TRIPMATE_BOARD ORDER BY TNUM DESC)A)
        WHERE RN BETWEEN 1 AND 10;
-- 조회수 올리기
UPDATE TRIPMATE_BOARD SET THIT = THIT +1 WHERE TNUM=1;
-- 글 상세보기
SELECT * FROM TRIPMATE_BOARD WHERE TNUM=1;

SELECT * FROM TRIPMATE_BOARD;
-- 페이징 처리를 위한 tot
SELECT COUNT(*) FROM TRIPMATE_BOARD WHERE 1=1;
    AND TSTYLE = 'TRIPBUSY'
        AND THOTELSYTEL = 'EXPENSIVE'
            AND TPLAYSTYLE = 'ACTIVITY'


select * from tripmate_board;

commit;


-- 2. 글 상세보기


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

-- notice 더미
INSERT INTO NOTICE_BOARD(NNUM , AID ,NTITLE ,NCONTENT,NIMAGE)
        VALUES (NOTICE_SEQ.NEXTVAL,'admin','국내선 탑승 게이트 위탁 수하물 요금 시행 안내','국내선 탑승 게이트 위탁 수하물 요금이 아래와 같이 부과될 예정이오니 참고하여 주시기 바랍니다.

1. 적용노선 : 국내선


2. 적용일 : 2022년 07월 01일 부 (출발일 기준)

 
3. 요금 안내

- 허용량 외의 기내 수하물은 반드시 위탁해야 하며, 탑승구에서 위탁 시 아래의 수수료가 부과됩니다. (무게/개수 초과 요금 별도부과)


*요금(1개당, 출발지 현지 통화 기준)

: 10,000원/ USD 10

 
*국내선에 한하여 적용됩니다. (국제선의 경우 1개당 20,000원 부과)

*승객의 편의를 위한 휠체어 및 유모차는 수수료를 부과하지 않습니다.

4. 이 외 기타 유의사항은 기존과 동일하며 홈페이지 내 세부 규정 참고 바랍니다.

 *탑승 수속 안내 > 수하물 안내 > 기내수하물 안내  확인하기','notice.jpeg');
commit;

--1.글목록 (최신글 위로)cruise.jpeg
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
INSERT INTO NOTICE_BOARD(NNUM , AID ,NTITLE,NCONTENT,NIMAGE)
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

commit;
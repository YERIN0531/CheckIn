----------------------------------- ASCD ---------------------------------------
--① DROP & CREATE TABLE 
DROP SEQUENCE ASC_SEQ;
DROP TABLE ASCD;

CREATE SEQUENCE ASC_SEQ MAXVALUE 9999999999 NOCACHE NOCYCLE;
CREATE TABLE ASCD(
    ACODE            VARCHAR2(50) PRIMARY KEY, -- 비행기아이디
    AIRLINE          VARCHAR2(50) NOT NULL,  -- 항공사
    ADEPARTLOC       VARCHAR2(50) NOT NULL,  -- 출발도시
        AARIVELOC        VARCHAR2(50) NOT NULL,  -- 도착도시
    AGOTIME          VARCHAR2(50) NOT NULL,  -- 가는시간 
    AGO_ARRIVETIME   VARCHAR2(50) NOT NULL,  -- 가는도착시간
    ACOME_DEPARTTIME VARCHAR2(50) NOT NULL,  -- 오는시간
    ACOME_ARRIVETIME VARCHAR2(50) NOT NULL,  -- 오는도착시간
    APRICE           NUMBER(10) NOT NULL     -- 표가격
);
SELECT * FROM ASCD;

-- ② ASCD DUMMY DATA
INSERT INTO ASCD VALUES ('KO001','대한한공','한국(인천)','일본(오사카)','10:00','12:00','12:00','14:00',200000);
INSERT INTO ASCD VALUES ('KO002','대한한공','한국(인천)','일본(오사카)','10:00','12:00','14:00','16:00',230000);
INSERT INTO ASCD VALUES ('KO003','대한한공','한국(인천)','일본(오사카)','10:00','12:00','18:00','20:00',250000);
INSERT INTO ASCD VALUES ('KO004','대한한공','한국(인천)','일본(오사카)','12:00','14:00','12:00','14:00',300000);
INSERT INTO ASCD VALUES ('KO005','대한한공','한국(인천)','일본(오사카)','12:00','14:00','14:00','16:00',250000);
INSERT INTO ASCD VALUES ('KO006','대한한공','한국(인천)','일본(오사카)','12:00','14:00','18:00','20:00',220000);
INSERT INTO ASCD VALUES ('KO007','대한한공','한국(인천)','일본(오사카)','16:00','18:00','12:00','14:00',320000);
INSERT INTO ASCD VALUES ('KO008','대한한공','한국(인천)','일본(오사카)','16:00','18:00','14:00','16:00',120000);
INSERT INTO ASCD VALUES ('KO009','대한한공','한국(인천)','일본(오사카)','16:00','18:00','18:00','20:00',150000);

---------------------------------- AIR_RESERVE ---------------------------------
--① DROP & CREATE TABLE

DROP SEQUENCE ARESERVE_SEQ;
DROP TABLE AIR_RESERVE;

CREATE SEQUENCE ARESERVE_SEQ MAXVALUE 9999999999 NOCACHE NOCYCLE; 
CREATE TABLE AIR_RESERVE(
    ASNO              NUMBER(10) PRIMARY KEY, -- 비행기아이디
    ACODE            VARCHAR2(50) NOT NULL REFERENCES ASCD(ACODE), --항공아이디
    MID         VARCHAR2(50) NOT NULL REFERENCES CUSTOMER(MID), --회원아이디
    AGODATE     DATE NOT NULL, -- 가는 날짜
    ACOMEDATE   DATE NOT NULL, -- 오는 날짜 
    SEATID      VARCHAR2(50) NOT NULL, -- 좌석번호
    ARDATE      DATE  DEFAULT SYSDATE NOT NULL -- 예약 완료 날짜
);

-- ② AIR_RESERVE DUMMY DATA

INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'aaa', '20220101','20220105', 'A2',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'aaa', '20220101','20220105', 'A1',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'bbb', '20220101','20220105', 'A3',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'bbb', '20220101','20220105', 'A4',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'bbb', '20220101','20220105', 'A5',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'bbb', '20220101','20220105', 'A6',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'ccc', '20220101','20220105', 'A7',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'ccc', '20220101','20220105', 'A8',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'ccc', '20220101','20220105', 'A9',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO001', 'ddd', '20220101','20220105', 'A10',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO002', 'eee', '20220101','20220105', 'A1',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO002', 'eee', '20220101','20220105', 'A2',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO002', 'bbb', '20220103','20220108', 'A4',SYSDATE);
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO003', 'ccc', '20220103','20220108', 'A2',SYSDATE);
SELECT * FROM AIR_RESERVE WHERE MID='ccc';

---------------------------------- AIR_ZZIM ------------------------------------
--① DROP & CREATE TABLE

DROP SEQUENCE AZZIM_SEQ;
DROP TABLE AIR_ZZIM;

CREATE SEQUENCE AZZIM_SEQ MAXVALUE 9999999999 NOCACHE NOCYCLE;
CREATE TABLE AIR_ZZIM(
    AZZIM       NUMBER(10) PRIMARY KEY,
    AZDATE      DATE DEFAULT SYSDATE NOT NULL,
    MID         VARCHAR2(50) NOT NULL REFERENCES CUSTOMER(MID),
    ACODE       VARCHAR2(50) NOT NULL REFERENCES ASCD(ACODE)  
);
-- ② AIR_ZZIM DUMMY DATA
SELECT * FROM AIR_ZZIM;
INSERT INTO AIR_ZZIM VALUES(AZZIM_SEQ.NEXTVAL, SYSDATE, 'aaa','KO001');
INSERT INTO AIR_ZZIM VALUES(AZZIM_SEQ.NEXTVAL, SYSDATE, 'ccc','KO002');
INSERT INTO AIR_ZZIM VALUES(AZZIM_SEQ.NEXTVAL, SYSDATE, 'ddd','KO001');
SELECT * FROM CUSTOMER;
COMMIT;

---------------------------------- 항공관련쿼리 ----------------------------------

                            ----- 관리자 영역 -----
-- AGOTIME          VARCHAR2(50) NOT NULL,  -- 가는시간 
    AGO_ARRIVETIME   VARCHAR2(50) NOT NULL,  -- 가는도착시간
    ACOME_DEPARTTIME VARCHAR2(50) NOT NULL,  -- 오는시간
    ACOME_ARRIVETIME                             
                            
                            
-- 항공 스케쥴 등록 
SELECT * FROM ASCD;
INSERT INTO ASCD VALUES ('JE001','제주항공','한국(인천)','필리핀(보라카이)','10:00','12:00','12:00','14:00',420000); 
INSERT INTO ASCD VALUES ('JE003','제주항공','한국(인천)','필리핀(보라카이)','12:00','18:00','11:00','15:00',280000); 
-- 항공 스케쥴 삭제
SELECT * FROM ASCD;
DELETE FROM ASCD WHERE ACODE='JE001';
-- 항공 스케쥴 수정
UPDATE ASCD SET AGOTIME='15:30',AGO_ARRIVETIME='17:30',ACOME_DEPARTTIME='18:00',ACOME_ARRIVETIME='20:00', APRICE=320000
WHERE ACODE='JE001';

-- 항공 디테일 
SELECT * FROM ASCD WHERE ACODE='KO001';
SELECT * FROM AIR_RESERVE;
COMMIT;

                            ----- 항공권 예약  -----
-- 항공 예약 상세 내역 (내가 예약한)
SELECT * FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE AND MID='aaa';
-- 항공 예약 내역 삭제
SELECT * FROM AIR_RESERVE;
DELETE FROM AIR_RESERVE WHERE ACODE='KO001' AND MID='aaa';
ROLLBACK;
-- 항공권 예약 및 좌석 선택 
INSERT INTO AIR_RESERVE VALUES(ARESERVE_SEQ.NEXTVAL ,'KO002', 'aaa', '20220531','20220605', 'A2',SYSDATE);

                            ----- 항공 리스트  -----

-- 항공 스케쥴 목록 (매진인 비행기는 뜨지 않게) 
-- 인천발 오사카행 , 2022-01-01~2022-01-05 비행기 중 매진이 아닌 비행기 목록 ★★★★★
    SELECT DISTINCT A.ACODE, ADEPARTLOC, AARIVELOC, AGOTIME, AGO_ARRIVETIME, ACOME_DEPARTTIME, ACOME_ARRIVETIME FROM ASCD A, AIR_RESERVE R WHERE A.ACODE=R.ACODE AND
    (AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') AND
    A.ACODE NOT IN (SELECT AR.ACODE
    FROM AIR_RESERVE AR, ASCD A WHERE A.ACODE=AR.ACODE AND
    (AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') GROUP BY AR.ACODE HAVING COUNT(SEATID) >= 10) OR
    A.ACODE IN (SELECT DISTINCT ACODE FROM ASCD
    WHERE (ACODE, AGOTIME, ACOME_DEPARTTIME) NOT IN 
    (SELECT S.ACODE, S.AGOTIME, S.ACOME_DEPARTTIME FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE
    AND AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%' )) ORDER BY A.ACODE;

SELECT * FROM ASCD A , AIR_RESERVE R WHERE A.ACODE=R.ACODE AND A.ACODE='KO001';
                            ----- 찜하기  -----

-- insert into (내아이디는 session 있을 거고,  
-- 찜 하기 누르면 정보가 테이블로 들어옴
SELECT * FROM  AIR_ZZIM;
INSERT INTO AIR_ZZIM(AZZIM, MID, ACODE) VALUES(AZZIM_SEQ.NEXTVAL,'aaa','KO003');

-- 찜 눌렀는지 안눌렀는지 여부 
SELECT COUNT(*) FROM AIR_ZZIM WHERE MID='aaa' AND ACODE='KO003';

-- 찜 취소 
DELETE FROM AIR_ZZIM WHERE MID='aaa' AND ACODE='KO003';
ROLLBACK;

-- 내가 찜한 리스트 
SELECT ACODE, ADEPARTLOC, AARIVELOC , AGOTIME, ACOME_DEPARTTIME, AIRLINE FROM ASCD WHERE ACODE IN(SELECT ACODE FROM AIR_ZZIM WHERE MID='aaa') ORDER BY ACODE DESC;

COMMIT;











-----------------------------------연습-----------------------------------------


-- 항공 스케줄 개수 

-- 특정 항공의 예약된 좌석 출력
SELECT SEATID FROM AIR_RESERVE WHERE ACODE='KO001';
-- 좌석 선택
SELECT * FROM AIR_RESERVE;
-- 좌석 선택 갱신

-- 비행기리스트
SELECT * FROM ASCD;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM ASCD ORDER BY ACODE) A) WHERE RN BETWEEN 1 AND 3;
-- 총 비행기 수 
SELECT COUNT(*) FROM ASCD;
-- 예약된 정보 뿌리기 
SELECT * FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE;

-- 내가 예약한 정보 뿌리기 
SELECT * FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE AND MID='aaa';

--특정 날짜에 예약된 항공기의 상태 뿌리기  --KO001항공기 
SELECT * FROM ASCD S, AIR_RESERVE R WHERE R.ACODE ='KO001' AND S.ACODE='KO001';

-- KO001 항공의 좌석 현황 (인천 - 오사카발 10시 비행기) 
SELECT COUNT(*) FROM (SELECT * FROM ASCD S, AIR_RESERVE R WHERE R.ACODE ='KO001' AND S.ACODE='KO001');

-- 인천에서 오사카 가는 비행기 목록 
SELECT * FROM ASCD WHERE ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%';

-- 인천에서 오사카 가는 비행기 날짜 포함 목록 
SELECT * FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%';








-- 인천발 오사카행 , 2022-01-01~2022-01-05 좌석 포함 비행기 목록 
SELECT * FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%'
                                                          AND AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' ;


-- 인천발 오사카행 , 2022-01-01~2022-01-05 비행기 중 매진이 아니고, 1개 이상 예약된 좌석포함 비행기 ★
SELECT * FROM ASCD A, AIR_RESERVE R WHERE A.ACODE=R.ACODE AND
    (AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') AND
    A.ACODE NOT IN (SELECT AR.ACODE
    FROM AIR_RESERVE AR, ASCD A WHERE A.ACODE=AR.ACODE AND
    (AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') GROUP BY AR.ACODE HAVING COUNT(SEATID) >= 10);
    
--인천발 오사카행 , 2022-01-01~2022-01-05 비행기 중 예약이 한개도 안된 비행기 ★
SELECT DISTINCT ACODE FROM ASCD
    WHERE (ACODE, AGOTIME, ACOME_DEPARTTIME) NOT IN 
    (SELECT S.ACODE, S.AGOTIME, S.ACOME_DEPARTTIME FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE
    AND AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%' );


-- 연습 TEMP
-- 인천발 오사카행 , 2022-01-01~2022-01-05 비행기 중 매진이 아닌 비행기 목록 ★★★★★
    SELECT DISTINCT A.ACODE, ADEPARTLOC, AARIVELOC, AGOTIME, ACOME_DEPARTTIME FROM ASCD A, AIR_RESERVE R WHERE A.ACODE=R.ACODE AND
    (AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') AND
    A.ACODE NOT IN (SELECT AR.ACODE
    FROM AIR_RESERVE AR, ASCD A WHERE A.ACODE=AR.ACODE AND
    (AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') GROUP BY AR.ACODE HAVING COUNT(SEATID) >= 10) OR
    A.ACODE IN (SELECT DISTINCT ACODE FROM ASCD
    WHERE (ACODE, AGOTIME, ACOME_DEPARTTIME) NOT IN 
    (SELECT S.ACODE, S.AGOTIME, S.ACOME_DEPARTTIME FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE
    AND AGODATE='2022-01-01' AND ACOMEDATE='2022-01-05' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%' )) ORDER BY A.ACODE;



commit;







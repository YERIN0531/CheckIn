----------------------------------- ASCD ---------------------------------------
--① DROP & CREATE TABLE 
DROP SEQUENCE ASC_SEQ;
DROP TABLE ASCD;
select * from ascd;
select * from air_reserve;


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
-- 닛뽄
INSERT INTO ASCD VALUES ('KO001','대한한공','한국(인천)','일본(오사카)','10:15','12:15','12:00','14:00',250000);
INSERT INTO ASCD VALUES ('AS001','아시아나','한국(인천)','일본(오사카)','10:30','12:30','12:00','14:00',230000);
INSERT INTO ASCD VALUES ('JE001','제주항공','한국(인천)','일본(오사카)','10:45','12:45','12:00','14:00',150000);

INSERT INTO ASCD VALUES ('KO002','대한한공','한국(인천)','일본(오사카)','12:15','14:15','14:00','16:00',230000);
INSERT INTO ASCD VALUES ('AS002','아시아나','한국(인천)','일본(오사카)','12:30','14:30','14:00','16:00',210000);
INSERT INTO ASCD VALUES ('JE002','제주항공','한국(인천)','일본(오사카)','12:45','14:45','14:00','16:00',130000);

INSERT INTO ASCD VALUES ('KO003','대한한공','한국(인천)','일본(오사카)','16:15','18:15','18:00','20:00',210000);
INSERT INTO ASCD VALUES ('AS003','아시아나','한국(인천)','일본(오사카)','16:30','18:30','18:00','20:00',190000);
INSERT INTO ASCD VALUES ('JE003','제주항공','한국(인천)','일본(오사카)','16:45','18:45','18:00','20:00',110000);

-- 태국
INSERT INTO ASCD VALUES ('KO004','대한한공','한국(인천)','태국(방콕)','08:05','14:05','08:00','14:00',360000);
INSERT INTO ASCD VALUES ('AS004','아시아나','한국(인천)','태국(방콕)','08:25','14:25','08:00','14:00',330000);
INSERT INTO ASCD VALUES ('JE004','제주항공','한국(인천)','태국(방콕)','08:50','14:50','08:00','14:00',300000);

INSERT INTO ASCD VALUES ('KO005','대한한공','한국(인천)','태국(방콕)','10:05','16:05','10:00','16:00',340000);
INSERT INTO ASCD VALUES ('AS005','아시아나','한국(인천)','태국(방콕)','10:25','16:25','10:00','16:00',310000);
INSERT INTO ASCD VALUES ('JE005','제주항공','한국(인천)','태국(방콕)','10:50','16:50','10:00','16:00',280000);

INSERT INTO ASCD VALUES ('KO006','대한한공','한국(인천)','태국(방콕)','12:05','18:05','14:00','20:00',320000);
INSERT INTO ASCD VALUES ('AS006','아시아나','한국(인천)','태국(방콕)','12:25','18:25','14:00','20:00',290000);
INSERT INTO ASCD VALUES ('JE006','제주항공','한국(인천)','태국(방콕)','12:50','18:50','14:00','20:00',260000);

-- 필리핀
INSERT INTO ASCD VALUES ('KO007','대한한공','한국(인천)','필리핀(보라카이)','09:00','13:30','12:00','16:30',320000);
INSERT INTO ASCD VALUES ('AS007','아시아나','한국(인천)','필리핀(보라카이)','09:10','13:40','12:00','16:30',300000);
INSERT INTO ASCD VALUES ('JE007','제주항공','한국(인천)','필리핀(보라카이)','09:20','13:50','12:00','16:30',280000);

INSERT INTO ASCD VALUES ('KO008','대한한공','한국(인천)','필리핀(보라카이)','10:00','14:30','10:00','14:30',310000);
INSERT INTO ASCD VALUES ('AS008','아시아나','한국(인천)','필리핀(보라카이)','10:10','14:40','10:00','14:30',290000);
INSERT INTO ASCD VALUES ('JE008','제주항공','한국(인천)','필리핀(보라카이)','10:20','14:50','10:00','14:30',270000);

INSERT INTO ASCD VALUES ('KO009','대한한공','한국(인천)','필리핀(보라카이)','12:05','16:35','09:00','13:30',300000);
INSERT INTO ASCD VALUES ('AS009','아시아나','한국(인천)','필리핀(보라카이)','12:15','16:45','09:00','13:30',280000);
INSERT INTO ASCD VALUES ('JE009','제주항공','한국(인천)','필리핀(보라카이)','12:20','16:55','09:00','13:30',260000);

-- 독일
INSERT INTO ASCD VALUES ('KO010','대한한공','한국(인천)','독일(베를린)','06:00','21:10','21:00','12:10',1400000);
INSERT INTO ASCD VALUES ('AS010','아시아나','한국(인천)','독일(베를린)','06:10','21:20','21:10','12:20',1380000);
INSERT INTO ASCD VALUES ('JE010','제주항공','한국(인천)','독일(베를린)','06:20','21:30','21:20','12:30',1300000);

INSERT INTO ASCD VALUES ('KO011','대한한공','한국(인천)','독일(베를린)','08:00','23:10','20:00','11:10',1380000);
INSERT INTO ASCD VALUES ('AS011','아시아나','한국(인천)','독일(베를린)','08:10','23:20','20:10','11:20',1360000);
INSERT INTO ASCD VALUES ('JE011','제주항공','한국(인천)','독일(베를린)','08:20','23:30','20:20','11:30',1250000);

INSERT INTO ASCD VALUES ('KO012','대한한공','한국(인천)','독일(베를린)','09:00','00:10','19:00','10:10',1350000);
INSERT INTO ASCD VALUES ('AS012','아시아나','한국(인천)','독일(베를린)','09:10','00:20','19:10','10:20',1330000);
INSERT INTO ASCD VALUES ('JE012','제주항공','한국(인천)','독일(베를린)','09:20','00:30','19:20','10:30',1200000);


-- 프랑스
INSERT INTO ASCD VALUES ('KO013','대한한공','한국(인천)','프랑스(파리)','06:00','20:00','21:00','11:00',1200000);
INSERT INTO ASCD VALUES ('AS013','아시아나','한국(인천)','프랑스(파리)','06:10','20:10','21:10','11:10',1180000);
INSERT INTO ASCD VALUES ('JE013','제주항공','한국(인천)','프랑스(파리)','06:20','20:20','21:20','11:20',1100000);

INSERT INTO ASCD VALUES ('KO014','대한한공','한국(인천)','프랑스(파리)','08:00','22:00','20:00','10:00',1180000);
INSERT INTO ASCD VALUES ('AS014','아시아나','한국(인천)','프랑스(파리)','08:10','22:10','20:10','10:10',1150000);
INSERT INTO ASCD VALUES ('JE014','제주항공','한국(인천)','프랑스(파리)','08:20','22:20','20:20','10:20',1050000);

INSERT INTO ASCD VALUES ('KO015','대한한공','한국(인천)','프랑스(파리)','09:00','23:00','19:00','09:00',1150000);
INSERT INTO ASCD VALUES ('AS015','아시아나','한국(인천)','프랑스(파리)','09:10','23:10','19:10','09:10',1120000);
INSERT INTO ASCD VALUES ('JE015','제주항공','한국(인천)','프랑스(파리)','09:20','23:20','19:20','09:20',1000000);

-- 스위스
INSERT INTO ASCD VALUES ('KO016','대한한공','한국(인천)','스위스(베른)','06:00','22:30','22:00','14:30',20000000);
INSERT INTO ASCD VALUES ('AS016','아시아나','한국(인천)','스위스(베른)','06:10','22:40','22:10','14:40',19800000);
INSERT INTO ASCD VALUES ('JE016','제주항공','한국(인천)','스위스(베른)','06:20','22:50','22:20','14:50',19000000);

INSERT INTO ASCD VALUES ('KO017','대한한공','한국(인천)','스위스(베른)','07:00','23:30','21:00','13:30',19500000);
INSERT INTO ASCD VALUES ('AS017','아시아나','한국(인천)','스위스(베른)','07:10','23:40','21:10','13:40',1900000);
INSERT INTO ASCD VALUES ('JE017','제주항공','한국(인천)','스위스(베른)','07:20','23:50','21:20','13:50',1800000);

INSERT INTO ASCD VALUES ('KO018','대한한공','한국(인천)','스위스(베른)','08:00','00:30','20:00','12:30',1900000);
INSERT INTO ASCD VALUES ('AS018','아시아나','한국(인천)','스위스(베른)','08:10','00:40','20:10','12:40',1850000);
INSERT INTO ASCD VALUES ('JE018','제주항공','한국(인천)','스위스(베른)','08:20','00:50','20:20','12:50',1700000);

-- 영국
INSERT INTO ASCD VALUES ('KO019','대한한공','한국(인천)','영국(런던)','23:55','09:35','14:30','17:30',18600000);
INSERT INTO ASCD VALUES ('AS019','아시아나','한국(인천)','영국(런던)','23:45','09:55','18:20','18:10',18300000);
INSERT INTO ASCD VALUES ('JE019','제주항공','한국(인천)','영국(런던)','22:45','09:55','18:20','18:10',18000000);

INSERT INTO ASCD VALUES ('KO020','대한한공','한국(인천)','영국(런던)','21:45','09:10','18:20','18:10',17800000);
INSERT INTO ASCD VALUES ('AS020','아시아나','한국(인천)','영국(런던)','21:30','08:55','18:10','18:00',17500000);
INSERT INTO ASCD VALUES ('JE020','제주항공','한국(인천)','영국(런던)','21:30','08:55','18:20','18:50',17000000);

INSERT INTO ASCD VALUES ('KO021','대한한공','한국(인천)','영국(런던)','20:00','10:30','18:00','18:30',17500000);
INSERT INTO ASCD VALUES ('AS021','아시아나','한국(인천)','영국(런던)','20:10','10:40','18:30','18:40',17300000);
INSERT INTO ASCD VALUES ('JE021','제주항공','한국(인천)','영국(런던)','20:20','10:50','19:20','19:20',16700000);

-- 베트남
INSERT INTO ASCD VALUES ('KO022','대한한공','한국(인천)','베트남(다낭)','08:00','13:00','17:00','22:00',350000);
INSERT INTO ASCD VALUES ('AS022','아시아나','한국(인천)','베트남(다낭)','08:10','13:10','17:10','22:10',330000);
INSERT INTO ASCD VALUES ('JE022','제주항공','한국(인천)','베트남(다낭)','08:20','13:20','17:20','22:20',300000);

INSERT INTO ASCD VALUES ('KO023','대한한공','한국(인천)','베트남(다낭)','09:00','14:00','16:00','21:00',330000);
INSERT INTO ASCD VALUES ('AS023','아시아나','한국(인천)','베트남(다낭)','09:10','14:10','16:10','21:10',310000);
INSERT INTO ASCD VALUES ('JE023','제주항공','한국(인천)','베트남(다낭)','09:20','14:20','16:20','21:20',280000);

INSERT INTO ASCD VALUES ('KO024','대한한공','한국(인천)','베트남(다낭)','10:00','15:00','15:00','20:00',320000);
INSERT INTO ASCD VALUES ('AS024','아시아나','한국(인천)','베트남(다낭)','10:10','15:10','15:10','20:10',290000);
INSERT INTO ASCD VALUES ('JE024','제주항공','한국(인천)','베트남(다낭)','10:20','15:20','15:20','20:20',260000);

select * from ascd;
commit;
---------------------------------- AIR_RESERVE ---------------------------------
--① DROP & CREATE TABLE
DROP TABLE AIR_RESERVE CASCADE CONSTRAINTS;

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

SELECT * FROM AIR_RESERVE WHERE MID='aaa';
COMMIT;
select * from ascd;
select * from air_reserve;
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
commit;
select * from ascd;
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
    (AGODATE='2022-08-03' AND ACOMEDATE='2022-08-06' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') AND
    A.ACODE NOT IN (SELECT AR.ACODE
    FROM AIR_RESERVE AR, ASCD A WHERE A.ACODE=AR.ACODE AND
    (AGODATE='2022-08-03' AND ACOMEDATE='2022-08-06' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') GROUP BY AR.ACODE HAVING COUNT(SEATID) >= 10) OR
    A.ACODE IN (SELECT DISTINCT ACODE FROM ASCD
    WHERE (ACODE, AGOTIME, ACOME_DEPARTTIME) NOT IN 
    (SELECT S.ACODE, S.AGOTIME, S.ACOME_DEPARTTIME FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE
    AND AGODATE='2022-08-03' AND ACOMEDATE='2022-08-06' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%' ))AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%' ORDER BY A.ACODE;

SELECT * FROM ASCD A , AIR_RESERVE R WHERE A.ACODE=R.ACODE AND A.ACODE='KO001';


SELECT * FROM AIR_RESERVE AR, ASCD A WHERE AR.ACODE=A.ACODE AND MID='aaa';

-- 내 예약 목록 확인
SELECT * FROM AIR_RESERVE AR, ASCD A WHERE MID='aaa' AND AR.ACODE = A.ACODE ORDER BY AGODATE,AGOTIME;
commit;
SELECT * FROM AIR_RESERVE;
select * from air;
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
    SELECT DISTINCT A.ACODE, ADEPARTLOC, AARIVELOC, AGOTIME, ACOME_DEPARTTIME, APRICE FROM ASCD A, AIR_RESERVE R WHERE A.ACODE=R.ACODE AND
    (AGODATE='2022-08-03' AND ACOMEDATE='2022-08-06' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') AND
    A.ACODE NOT IN (SELECT AR.ACODE
    FROM AIR_RESERVE AR, ASCD A WHERE A.ACODE=AR.ACODE AND
    (AGODATE='2022-08-03' AND ACOMEDATE='2022-08-06' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%') GROUP BY AR.ACODE HAVING COUNT(SEATID) >= 10) OR
    A.ACODE IN (SELECT DISTINCT ACODE FROM ASCD
    WHERE (ACODE, AGOTIME, ACOME_DEPARTTIME) NOT IN 
    (SELECT S.ACODE, S.AGOTIME, S.ACOME_DEPARTTIME FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE
    AND AGODATE='2022-08-03' AND ACOMEDATE='2022-08-06' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%' )) ORDER BY A.ACODE;


SELECT S.ACODE, S.AGOTIME, S.ACOME_DEPARTTIME FROM ASCD S, AIR_RESERVE R WHERE S.ACODE=R.ACODE
    AND AGODATE='2022-08-03' AND ACOMEDATE='2022-08-06' AND ADEPARTLOC LIKE '%'||'한'||'%' AND AARIVELOC LIKE '%'||'일'||'%' ;

SELECT * FROM ASCD A, AIR_RESERVE B WHERE A.ACODE=B.ACODE;
commit;

SELECT SEATID FROM AIR_RESERVE WHERE ACODE='KO001' AND AGODATE='2022-08-04' AND ACOMEDATE='2022-08-06';
SELECT * FROM AIR_RESERVE;





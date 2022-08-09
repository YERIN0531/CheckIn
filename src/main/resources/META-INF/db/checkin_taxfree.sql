SELECT * FROM TAB;
-- 정임 : TAXFREE, CART, ORDERS, ORDER_DETAIL
SELECT * FROM TAXFREE;
SELECT * FROM CART;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAIL;

DROP TABLE TAXFREE CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAIL CASCADE CONSTRAINTS;


-- (1) TAXFREE TABLE
SELECT * FROM TAXFREE;
DROP TABLE TAXFREE;
DROP SEQUENCE PRODUCT_SEQ;

CREATE SEQUENCE PRODUCT_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE TAXFREE (
    PNUM    NUMBER(10)   PRIMARY KEY, -- 상품 번호(시퀀스)
    PNAME   VARCHAR2(50) NOT NULL,    -- 상품 이름
    PPRICE  NUMBER(10)   NOT NULL,    -- 상품 가격
    PIMAGE1 VARCHAR2(50),             -- 상품 메인 이미지
    PIMAGE2 VARCHAR2(50),             -- 상품 이미지2
    PIMAGE3 VARCHAR2(50),             -- 상품 이미지3
    PSTOCK  NUMBER(10)   NOT NULL,    -- 상품 재고
    PLOC    VARCHAR2(50) NOT NULL     -- 상품의 현재 위치(도시)
);

-- DUMMY
INSERT INTO TAXFREE (PNUM, PNAME, PPRICE, PIMAGE1, PIMAGE2, PIMAGE3, PSTOCK, PLOC)
    VALUES(PRODUCT_SEQ.NEXTVAL, '샤넬립스틱', 30, NULL, NULL, NULL, 30, 'PARIS');
INSERT INTO TAXFREE (PNUM, PNAME, PPRICE, PIMAGE1, PIMAGE2, PIMAGE3, PSTOCK, PLOC)
    VALUES(PRODUCT_SEQ.NEXTVAL, '맥소바', 33, NULL, NULL, NULL, 120, 'LONDON');
INSERT INTO TAXFREE (PNUM, PNAME, PPRICE, PIMAGE1, PIMAGE2, PIMAGE3, PSTOCK, PLOC)
    VALUES(PRODUCT_SEQ.NEXTVAL, '디올향수', 180, NULL, NULL, NULL, 100, 'TOKYO');


-- (2) CART TABLE
DROP TABLE CART;
DROP SEQUENCE CART_SEQ;

CREATE SEQUENCE CART_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE CART(
    CARTNUM NUMBER(10)   PRIMARY KEY,                  -- 장바구니번호(시퀀스)
    PNUM    NUMBER(10)   NOT NULL REFERENCES TAXFREE,  -- 상품 번호
    MID     VARCHAR2(50) NOT NULL REFERENCES CUSTOMER, -- 회원 아이디
    COST    NUMBER(10)   NOT NULL,                     -- 가격
    QTY     NUMBER(10)   NOT NULL                      -- 수량
);

-- DUMMY
SELECT * FROM CART;
INSERT INTO CART (CARTNUM, PNUM, MID, COST, QTY)
    VALUES(CART_SEQ.NEXTVAL, 1, 'aaa', 3*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 1), 3);
INSERT INTO CART (CARTNUM, PNUM, MID, COST, QTY)
    VALUES(CART_SEQ.NEXTVAL, 1, 'bbb', 2*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 1), 2);
INSERT INTO CART (CARTNUM, PNUM, MID, COST, QTY)
    VALUES(CART_SEQ.NEXTVAL, 2, 'aaa', 3*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 2), 3);


-- (3) ORDERS TABLE 
DROP TABLE ORDERS;
DROP SEQUENCE ORDER_SEQ;

CREATE SEQUENCE ORDER_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE ORDERS (
    OR_NUM NUMBER(10)   PRIMARY KEY,                  -- 주문 번호(시퀀스)
    MID    VARCHAR2(50) NOT NULL REFERENCES CUSTOMER, -- 회원 아이디
    ORDATE DATE DEFAULT SYSDATE NOT NULL              -- 주문 날짜
);

-- DUMMY
INSERT INTO ORDERS 
    VALUES (TO_CHAR(SYSDATE, 'YYMMDD') || TRIM(TO_CHAR(ORDER_SEQ.NEXTVAL, '0000')), 
            'aaa', TO_DATE('2022-07-24', 'YYYY-MM-DD'));

-- (4) ORDER_DETAIL
DROP TABLE ORDER_DETAIL;
DROP SEQUENCE ORDERDETAIL_SEQ;

CREATE SEQUENCE ORDERDETAIL_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE ORDER_DETAIL(
    ORD_NUM    NUMBER(10) PRIMARY KEY,                   -- 주문 완료 번호
    OR_NUM     NUMBER(10) NOT NULL REFERENCES ORDERS,    -- 주문 번호  
    PNUM       NUMBER(10) NOT NULL REFERENCES TAXFREE,   -- 상품 번호
    COST       NUMBER(10) NOT NULL,                      -- 총 상품 가격
    QTY        NUMBER(10) NOT NULL                       -- 수량
);
COMMIT;
-- DUMMY

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- SQL / 면세 taxfree
SELECT * FROM TAXFREE;
-- 1. insertProduct 상품등록
INSERT INTO TAXFREE (PNUM, PNAME, PPRICE, PIMAGE1, PIMAGE2, PIMAGE3, PSTOCK, PLOC)
    VALUES(PRODUCT_SEQ.NEXTVAL, '초콜릿', 10, NULL, NULL, NULL, 32, 'OASAKA');
-- 2. modifyProduct 상품수정
UPDATE TAXFREE SET PNAME = 'LIPSTICK',
                   PPRICE = 12,
                   PIMAGE1 = NULL,
                   PIMAGE2 = NULL,
                   PIMAGE3 = NULL,
                   PSTOCK = 160,
                   PLOC   = 'LONDON'
                WHERE PNUM = 4;
-- 3. deleteProduct 상품삭제
DELETE FROM TAXFREE WHERE PNUM = 4;
-- 4. countProduct 상품개수 / 페이징을 위한
SELECT COUNT(*) FROM TAXFREE;
-- 5. listProduct 상품리스트 - paging
SELECT * FROM TAXFREE ORDER BY PNUM DESC; -- 서브쿼리
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM TAXFREE ORDER BY PNUM DESC)A) WHERE RN BETWEEN 1 AND 2;
-- 6. detailProduct 상품상세보기 - pnum
SELECT * FROM TAXFREE WHERE PNUM = 1;
-- 7. 검색 searchProduct
SELECT * FROM TAXFREE WHERE PNAME LIKE '%'||'샤'||'%';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- SQL / 장바구니 CART
-- 1. insertCart 장바구니 추가
-- 상품번호를 받아와서 장바구니 번호랑 회원 아이디, 총 가격, 수량 저장
INSERT INTO CART (CARTNUM, PNUM, MID, COST, QTY)
    VALUES(CART_SEQ.NEXTVAL, 2, 'bbb', 3*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 2), 3);
-- 2. deleteCartAll 장바구니 전체 삭제 08/04
DELETE FROM CART WHERE MID = 'aaa';
-- 2-1. deleteCart 장바구니 리스트 하나 삭제 08/04
DELETE FROM CART WHERE CARTNUM = 4;
SELECT * FROM CART;
commit;
-- 3. listCart 장바구니 리스트
SELECT * FROM CART C, TAXFREE T WHERE C.PNUM = T.PNUM AND MID = 'aaa' ORDER BY CARTNUM DESC;

-- 4. 장바구니에 상품이 있는지 없는지 확인 checkCart 0805    
SELECT COUNT(*) FROM CART WHERE MID='bbb' AND PNUM = 2;

-- 5. 면세품상세보기에서 이미 담긴 상품을 수량을 수정하고 싶을때 **** 08/04
-- updateCart
SELECT * FROM CART WHERE MID = 'bbb';
SELECT * FROM TAXFREE;
-- INSERT INTO CART (CARTNUM, PNUM, MID, COST, QTY)
--     VALUES(CART_SEQ.NEXTVAL, 2, 'aaa', 3*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 2), 3)
UPDATE CART SET QTY = 2+(SELECT QTY FROM CART WHERE PNUM = 1 AND MID = 'aaa'),
                COST = (2+(SELECT QTY FROM CART WHERE PNUM = 1 AND MID = 'aaa')) * (SELECT PPRICE FROM TAXFREE WHERE PNUM = 1)
            WHERE PNUM = 1 AND MID = 'aaa';

-- 6. updateInCart / 장바구니 리스트에서 상품의 개수를 수정하고 싶은 경우
UPDATE CART SET QTY = 2,
                COST = 2 * (SELECT PPRICE FROM TAXFREE WHERE PNUM = (SELECT PNUM FROM CART WHERE CARTNUM = 30))
            WHERE CARTNUM = 30;
SELECT * FROM CART;
---
SELECT * FROM CART WHERE MID = 'bbb';

COMMIT;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- SQL / 주문테이블 ORDERS
-- 1. insertOrderDetail 주문 
INSERT INTO ORDER_DETAIL (ORD_NUM, OR_NUM, PNUM, COST, QTY)
    VALUES(ORDERDETAIL_SEQ.NEXTVAL, 2207280001, 1, 3*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 1), 3);
-- 1-1. 주문 후 재고 수정 remainProduct
UPDATE TAXFREE SET PSTOCK = PSTOCK-3 WHERE PNUM = 1; -- 재고 수정 / 주문이 완료된 후에 재고 수정하는 함수
-- 2. insertOrders 오더테이블 장바구니에 담아주고
INSERT INTO ORDERS 
    VALUES (TO_CHAR(SYSDATE, 'YYMMDD') || TRIM(TO_CHAR(ORDER_SEQ.NEXTVAL, '0000')), 
            'aaa', TO_DATE('2022-07-25', 'YYYY-MM-DD'));
-- 3. insertOrderDetail 주문 상세 내역에 장바구니 데이터 넣기
INSERT INTO ORDER_DETAIL (ORD_NUM, OR_NUM, PNUM, COST, QTY)
    VALUES(ORDERDETAIL_SEQ.NEXTVAL, 2207280001, 1, 3*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 1), 3);
SELECT * FROM CART WHERE MID='aaa'; -- 내역이 들어가 있는지 확인하고
select * from order_detail;
SELECT * FROM CART WHERE MID='aaa';
-- 4. orderdetail 결제정보
insert into order_Detail
    select orderdetail_seq.nextval,  TO_CHAR(SYSDATE, 'YYMMDD') || TRIM(TO_CHAR(ORDER_SEQ.currVAL, '0000')), pnum, cost, qty from cart where mid='aaa' ;
insert into order_Detail
    select orderdetail_seq.nextval, ORDER_SEQ.CURRVAL, pnum, cost, qty from cart where mid='aaa' ;
-- deleteCart 장바구니에 담겨진 물품 삭제
delete cart where mid='aaa';




-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
SELECT * FROM TAXFREE;
SELECT * FROM CART;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAIL;

-- ORDER : OR_NUM 생성 완료 ORDERDETAIL 생성 안됨 DELETE 생성 안됨
COMMIT;
-- 1. 물건을 카트에 담는다
INSERT INTO CART (CARTNUM, PNUM, MID, COST, QTY)
    VALUES(CART_SEQ.NEXTVAL, 1, 'aaa', 1*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 1), 1);
INSERT INTO CART (CARTNUM, PNUM, MID, COST, QTY)
    VALUES(CART_SEQ.NEXTVAL, 2, 'aaa', 1*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 2), 1);
INSERT INTO CART (CARTNUM, PNUM, MID, COST, QTY)
    VALUES(CART_SEQ.NEXTVAL, 1, 'bbb', 3*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 1), 3);
INSERT INTO CART (CARTNUM, PNUM, MID, COST, QTY)
    VALUES(CART_SEQ.NEXTVAL, 3, 'aaa', 1*(SELECT PPRICE FROM TAXFREE WHERE PNUM = 3), 1);
SELECT * fROM TAXFREE;
-- 나의 카트 
SELECT * FROM CART WHERE MID='aaa';

-- 2. insertOrder / 카트에 있는 물건을 ORDER에 담는다
SELECT * FROM ORDERS;
INSERT INTO ORDERS VALUES (ORDER_SEQ.NEXTVAL, 'aaa', SYSDATE);

-- 3. insertOrderDetail / ORDER에 있는 주문번호와 카트에 있는 정보를 ORDER-DETAIL에 담는다
INSERT INTO ORDER_DETAIL 
    SELECT ORDERDETAIL_SEQ.NEXTVAL, (SELECT MAX(OR_NUM) FROM ORDERS), PNUM, COST, QTY FROM CART WHERE MID='aaa';
    
SELECT * FROM TAXFREE;
SELECT * FROM ORDER_DETAIL;       
SELECT * FROM CART;
SELECT * FROM ORDERS;
SELECT * FROM CART WHERE MID='aaa';
COMMIT;
-- 4. myOrderDetail / INSERT 된 PRODUCT들을 뿌려준다. CART TAXFREE ORDERDETAIL / 진행중
SELECT t.pnum, OD.OR_NUM, ORDATE, PIMAGE1, PNAME, OD.QTY, PPRICE, OD.COST 
    FROM TAXFREE T, CART C, ORDER_DETAIL OD, ORDERS O
        WHERE T.PNUM = C.PNUM AND C.PNUM = OD.PNUM AND OD.OR_NUM = O.OR_NUM
            AND C.MID = 'aaa' ORDER BY ORDATE DESC, OR_NUM ASC;

-- 이번에 주문한 것들만 받아오고 싶은 경우
SELECT OD.OR_NUM, ORDATE, PIMAGE1, PNAME, OD.QTY, PPRICE, OD.COST 
    FROM TAXFREE T, CART C, ORDER_DETAIL OD, ORDERS O
        WHERE T.PNUM = C.PNUM AND C.PNUM = OD.PNUM AND OD.OR_NUM = O.OR_NUM
            AND C.MID = 'aaa' ORDER BY ORDATE DESC, OR_NUM ASC;

-- 5. TAXFREE 테이블의 상품 재고 수정 진행 - update / 진행중 / 컨펌받기
-- 현재 INSERT된 것(가장 최근에 받아온 ORDERS
UPDATE TAXFREE SET PSTOCK = (PSTOCK-(SELECT QTY FROM ORDER_DETAIL WHERE OR_NUM=1 AND PNUM=10)) WHERE PNUM = 10;
UPDATE TAXFREE SET PSTOCK = (PSTOCK-1) WHERE PNUM = 1;
SELECT * FROM TAXFREE;

SELECT * FROM ORDER_DETAIL;
SELECT * FROM ORDERS WHERE MID='aaa';

 SELECT * FROM ORDER_DETAIL WHERE OR_NUM = 2;
 SELECT * FROM ORDER_DETAIL;
select pnum, qty from cart c where mid='aaa'; --pnum, qty update for문 안되면

-- 6. deleteCart 카트 안의 상품들을 지워준다. 
DELETE CART WHERE MID = 'aaa';
rollback;

SELECT * FROM CART where mid='aaa';
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAIL;
SELECT * FROM TAXFREE;
            
            
SELECT * FROM CART WHERE MID='aaa' ORDER BY CARTNUM DESC;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAIL;
commit;
SELECT PNAME, PSTOCK FROM TAXFREE;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
 SELECT OR_NUM FROM ORDERS O , CART C WHERE O.MID=C.MID AND O.MID='aaa';
 
 
 
SELECT * FROM ORDER_DETAIL;
SELECT * FROM CUSTOMER;

COMMIT;



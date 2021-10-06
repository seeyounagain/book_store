-- 211005

-- 도서 쇼핑몰 프로젝트 FINAL_SHOP

-- 쇼핑몰 회원 테이블
-- 아이디(기본키), 비밀번호, 이름, 연락처, 주소, 성별, 관리자여부, 가입일
-- ID, PW, NAME, TELL, ADDR, GENDER, IS_ADMIN, JOIN_DATE
    -- TELL 010-1111-2222
    -- GENDER 남 OR 여
    -- IS_ADMIN Y OR N
    -- ID 기본키 적용, 제약조건 이름 지정
    
CREATE TABLE BOOK_MEMBER (
    ID VARCHAR2(100)
    , PW VARCHAR2(100) NOT NULL
    , NAME VARCHAR2(100) NOT NULL
    , TELL VARCHAR2(30) NOT NULL
    , ADDR VARCHAR2(200)
    , GENDER VARCHAR2(6)
    , IS_ADMIN VARCHAR2(6) DEFAULT 'N'
    , JOIN_DATE DATE DEFAULT SYSDATE
    , CONSTRAINT MEMBER_PK PRIMARY KEY (ID)
);


SELECT
    *
FROM BOOK_MEMBER;

INSERT INTO BOOK_MEMBER (
    ID
    , PW
    , NAME
    , TELL
    , IS_ADMIN
) VALUES (
    'admin'
    , '1111'
    , '관리자'
    , '01000000000'
    , 'Y'
);

SELECT
    ID
    , NAME
    , IS_ADMIN
FROM BOOK_MEMBER
WHERE ID = 'book01' AND PW = 'book01';

DELETE FROM BOOK_MEMBER;

-- 쇼핑몰 상품 카테고리 테이블
-- 카테고리 코드(기본키), 카테고리명
-- 000 총류 100 철학 200 종교 300 사회과학 400 자연과학 500 기술과학 600 예술 700 언어 800 문학 900 역사

CREATE TABLE ITEM_CATEGORY (
   CATE_CODE VARCHAR2(50)
   , CATE_NAME VARCHAR2(100) NOT NULL
   , CONSTRAINT CATEGORY_PK PRIMARY KEY (CATE_CODE)
);

INSERT INTO ITEM_CATEGORY (
    CATE_CODE
    , CATE_NAME
) VALUES (
    '900'
    , '역사'
);

SELECT
    *
FROM ITEM_CATEGORY;

-- 쇼핑몰 상품 테이블
-- 상품코드(기본키), 상품명, 가격, 지은이, 출판사, 카테고리
-- ITEM_CODE, ITEM_NAME, ITEM_PRICE, WRITER, PUBLISHER ,REG_DATE, CATE_CODE
    -- ID 기본키 적용, 제약조건 이름 지정
    -- CATE_CODE 외래키 적용, 제약조건 이름 지정
    
CREATE TABLE BOOK_ITEM (
    ITEM_CODE VARCHAR2(50)
    , ITEM_NAME VARCHAR2(100) NOT NULL UNIQUE
    , ITEM_PRICE NUMBER NOT NULL
    , WRITER VARCHAR2(100) NOT NULL
    , PUBLISHER VARCHAR2(100) NOT NULL
    , REG_DATE DATE DEFAULT SYSDATE
    , CATE_CODE VARCHAR2(50)
    , CONSTRAINT ITEM_PK PRIMARY KEY (ITEM_CODE)
    , CONSTRAINT ITEM_CATE_FK FOREIGN KEY (CATE_CODE) REFERENCES ITEM_CATEGORY (CATE_CODE)
);


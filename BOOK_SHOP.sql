-- 211005

-- 도서 쇼핑몰 프로젝트 FINAL_SHOP

-- 메뉴 정보 테이블
CREATE TABLE MENU (
    MENU_CODE VARCHAR2(50)
    , MENU_NAME VARCHAR2(100) NOT NULL UNIQUE
    , MENU_URI VARCHAR2(100) NOT NULL UNIQUE
    , CONSTRAINT MENU_PK PRIMARY KEY (MENU_CODE)
    );
    
DROP TABLE MENU;

SELECT
    *
FROM MENU;

DELETE MENU;

INSERT INTO MENU VALUES ('MENU_001','상품관리','itemManage');
INSERT INTO MENU VALUES ('MENU_002','회원관리','memberManage');
INSERT INTO MENU VALUES ('MENU_003','매출관리','saleManage');

-- 사이드 메뉴 정보 테이블
CREATE TABLE SIDE_MENU (
    SIDE_MENU_CODE VARCHAR2(50)
    , SIDE_MENU_NAME VARCHAR2(100) NOT NULL UNIQUE
    , SIDE_MENU_URI VARCHAR2(100) NOT NULL UNIQUE
    , MENU_CODE VARCHAR2(50)
    , CONSTRAINT SIDE_MENU_FK FOREIGN KEY (MENU_CODE) REFERENCES MENU (MENU_CODE) ON DELETE CASCADE
    , CONSTRAINT SIDE_MENU_PK PRIMARY KEY (SIDE_MENU_CODE)
    );

SELECT
    *
FROM SIDE_MENU;

DELETE SIDE_MENU;

DROP TABLE SIDE_MENU;

INSERT INTO SIDE_MENU VALUES ('SIDE_001','카테고리관리','categoryManage','MENU_001');
INSERT INTO SIDE_MENU VALUES ('SIDE_002','상품등록','regItem','MENU_001');
INSERT INTO SIDE_MENU VALUES ('SIDE_003','상품관리','itemManage','MENU_001');

INSERT INTO SIDE_MENU VALUES ('SIDE_004','회원조회','memberList','MENU_002');
INSERT INTO SIDE_MENU VALUES ('SIDE_005','회원관리','memberManage','MENU_002');

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

DELETE FROM BOOK_MEMBER WHERE ID = 'book01';

-- 쇼핑몰 상품 카테고리 테이블
-- 카테고리 코드(기본키), 카테고리명
-- 000 총류 100 철학 200 종교 300 사회과학 400 자연과학 500 기술과학 600 예술 700 언어 800 문학 900 역사

CREATE TABLE ITEM_CATEGORY (
   CATE_CODE VARCHAR2(50)
   , CATE_NAME VARCHAR2(100) UNIQUE NOT NULL
   , CONSTRAINT CATEGORY_PK PRIMARY KEY (CATE_CODE)
);

INSERT INTO ITEM_CATEGORY (
    CATE_CODE
    , CATE_NAME
) VALUES (
    (SELECT 'CATE_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(CATE_CODE,6,3))),0) + 1,3,0) FROM ITEM_CATEGORY)
    , '인문학'
);

DELETE ITEM_CATEGORY;

SELECT
    *
FROM ITEM_CATEGORY;

DROP TABLE ITEM_CATEGORY;

-- 쇼핑몰 상품 테이블
-- 상품코드(기본키), 상품명, 가격, 지은이, 출판사, 옮긴이, 등록일, 발행일, ISBN, 쪽수, 카테고리
-- ITEM_CODE, ITEM_NAME, ITEM_PRICE, WRITER, PUBLISHER , TRANSLATOR, REG_DATE, PUB_DATE, ISBN, PAGE, CATE_CODE
    -- ID 기본키 적용, 제약조건 이름 지정
    -- CATE_CODE 외래키 적용, 제약조건 이름 지정
    
CREATE TABLE BOOK_ITEM (
    ITEM_CODE VARCHAR2(50)
    , ITEM_NAME VARCHAR2(100) NOT NULL UNIQUE
    , ITEM_PRICE NUMBER NOT NULL
    , WRITER VARCHAR2(100) NOT NULL
    , PUBLISHER VARCHAR2(100) NOT NULL
    , TRANSLATOR VARCHAR2(100)
    , REG_DATE DATE DEFAULT SYSDATE
    , PUB_DATE DATE NOT NULL
    , ISBN VARCHAR2(100) UNIQUE NOT NULL
    , PAGE NUMBER
    , CATE_CODE VARCHAR2(50)
    , CONSTRAINT ITEM_PK PRIMARY KEY (ITEM_CODE)
    , CONSTRAINT ITEM_CATE_FK FOREIGN KEY (CATE_CODE) REFERENCES ITEM_CATEGORY (CATE_CODE)
);

SELECT
    *
FROM BOOK_ITEM;

DROP TABLE BOOK_ITEM;

DELETE FROM BOOK_ITEM;

		SELECT
    		ITEM_CODE
    		, ITEM_NAME
    		, TO_CHAR(ITEM_PRICE, '999,999,999,999,999') AS ITEM_PRICE
    		, WRITER
    		, PUBLISHER
    		, (SELECT CATE_NAME FROM ITEM_CATEGORY WHERE CATE_CODE = I.CATE_CODE) AS CATE_CODE
    		, REG_DATE
		FROM BOOK_ITEM I
		ORDER BY REG_DATE DESC;
        
		INSERT INTO BOOK_ITEM (
		    ITEM_CODE
		    , ITEM_NAME
		    , ITEM_PRICE
		    , WRITER
		    , PUBLISHER
		    , CATE_CODE
		) VALUES (
		    (SELECT 'ITEM_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(ITEM_CODE,6,3))),0) + 1,3,0) FROM BOOK_ITEM)
		    , '혼자 공부하는 스프링'
		    , 21600
		    , '신용권'
		    , '한빛미디어'
		    , 'CATE_002'
		);

-- 상품 이미지 정보 테이블
-- 이미지코드(기본키), 첨부한 파일 이름, 업로드 된 파일 이름, 상품코드(외래키), 메인이미지여부


CREATE TABLE BOOK_IMG (
    IMG_CODE VARCHAR2(100)
    , ORIGIN_IMG_NAME VARCHAR2(300)
    , ATTACHED_IMG_NAME VARCHAR2(300)
    , ITEM_CODE VARCHAR2(50)
    , IS_MAIN VARCHAR2(6)
    , CONSTRAINT IMG_PK PRIMARY KEY (IMG_CODE)
    , CONSTRAINT IMG_FK FOREIGN KEY (ITEM_CODE) REFERENCES BOOK_ITEM (ITEM_CODE)
);

SELECT
    *
FROM BOOK_IMG;

SELECT NVL(MAX(TO_NUMBER(SUBSTR(IMG_CODE,5,3))) + 1, 1) FROM BOOK_IMG;

SELECT
    I.ITEM_CODE
    , ITEM_NAME
    , TO_CHAR(ITEM_PRICE, '999,999,999,999,999') AS ITEM_PRICE
    , WRITER
    , PUBLISHER
    , (SELECT CATE_NAME FROM ITEM_CATEGORY WHERE CATE_CODE = I.CATE_CODE) AS CATE_CODE
    , REG_DATE
    , IMG_CODE
    , ORIGIN_IMG_NAME
    , ATTACHED_IMG_NAME
    , IS_MAIN
    FROM BOOK_ITEM I, BOOK_IMG M
    WHERE I.ITEM_CODE = M.ITEM_CODE
    ORDER BY REG_DATE DESC;























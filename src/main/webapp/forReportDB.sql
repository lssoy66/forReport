
-- system 계정에서 작업 --------------------------------------------------

-- (1) 사용자계정 생성 :forreport/forreport
CREATE USER forreport IDENTIFIED BY forreport;
---(2) 계정 사용 허가
GRANT CONNECT,Resource TO forreport;--필수
Grant create view,create synonym to forreport;--옵션

-- forreport 계정에서 작업 -----------------------------------------------

/* 사용자 테이블 */
CREATE TABLE tbl_user (
   id VARCHAR2(20) NOT NULL, /* ID */
   password VARCHAR2(100) NOT NULL, /* 암호 */
   name VARCHAR2(20) NOT NULL, /* 이름 */
   phone VARCHAR2(12) NOT NULL, /* 휴대폰번호 */
   email VARCHAR2(30) NOT NULL, /* 이메일 */
   grade number default 0 NOT NULL, /* 등급 */
   enabled number(1) default 1 NOT NULL
);

CREATE UNIQUE INDEX PK_tbl_user
   ON tbl_user (
      id ASC
   );

ALTER TABLE tbl_user
   ADD
      CONSTRAINT PK_tbl_user
      PRIMARY KEY (
         id
      );

/* 상품종류 */
CREATE TABLE tbl_category (
   largeca NUMBER NOT NULL, /* 대분류 */
   smallca NUMBER NOT NULL /* 소분류 */
);

CREATE UNIQUE INDEX PK_tbl_category
   ON tbl_category (
      largeca ASC,
      smallca ASC
   );

ALTER TABLE tbl_category
   ADD
      CONSTRAINT PK_tbl_category
      PRIMARY KEY (
         largeca,
         smallca
      );


/* 상품테이블 */
CREATE TABLE tbl_product (
   pronum NUMBER NOT NULL, /* 상품번호 */
   id VARCHAR2(20), /* ID */
   largeca NUMBER NOT NULL, /* 대분류 */
   smallca NUMBER NOT NULL, /* 소분류 */
   title VARCHAR2(100) NOT NULL, /* 제목 */
   proname VARCHAR2(100) NOT NULL, /* 상품명 */
   prodsc VARCHAR2(3000) NOT NULL, /* 상품설명 */
   price NUMBER NOT NULL, /* 가격 */
   uploaddate DATE default sysdate NOT NULL, /* 작성일 */
   approval NUMBER default 0 NOT NULL /* 승인여부 */
);

CREATE UNIQUE INDEX PK_tbl_product
   ON tbl_product (
      pronum ASC
   );

ALTER TABLE tbl_product
   ADD
      CONSTRAINT PK_tbl_product
      PRIMARY KEY (
         pronum
      );

/* 썸네일 업로드 테이블 */
CREATE TABLE tbl_upload (
   pronum NUMBER NOT NULL, /* 상품번호 */
   uuid VARCHAR2(100) NOT NULL, /* UUID */
   filedirectory VARCHAR2(200) NOT NULL, /* 파일경로 */
   filename VARCHAR2(100) NOT NULL /* 파일이름 */
);

CREATE UNIQUE INDEX PK_tbl_upload
   ON tbl_upload (
      pronum ASC
   );

ALTER TABLE tbl_upload
   ADD
      CONSTRAINT PK_tbl_upload
      PRIMARY KEY (
         pronum
      );


/* 주문(결제)테이블 */
CREATE TABLE tbl_order (
   ordernum NUMBER NOT NULL, /* 주문번호 */
   pronum NUMBER NOT NULL, /* 상품번호 */
   id VARCHAR2(20), /* ID */
   paymethod VARCHAR2(20) NOT NULL, /* 결제방식 */
   payprice NUMBER NOT NULL, /* 결제금액 */
   orderdate DATE default sysdate NOT NULL /* 주문일자 */
);

CREATE UNIQUE INDEX PK_tbl_order
   ON tbl_order (
      ordernum ASC
   );

ALTER TABLE tbl_order
   ADD
      CONSTRAINT PK_tbl_order
      PRIMARY KEY (
         ordernum
      );

/* 장바구니 테이블 */
CREATE TABLE tbl_cart (
   cartnum NUMBER NOT NULL, /* 장바구니번호 */
   id VARCHAR2(20), /* ID */
   pronum NUMBER NOT NULL /* 상품번호 */
);

CREATE UNIQUE INDEX PK_tbl_cart
   ON tbl_cart (
      cartnum ASC
   );

ALTER TABLE tbl_cart
   ADD
      CONSTRAINT PK_tbl_cart
      PRIMARY KEY (
         cartnum
      );

/* 리뷰 테이블 */
CREATE TABLE tbl_review (
   reviewnum NUMBER NOT NULL, /* 리뷰번호 */
   pronum NUMBER NOT NULL, /* 상품번호 */
   id VARCHAR2(20), /* ID */
   review VARCHAR2(1000) NOT NULL, /* 작성내용 */
   reviewdate DATE NOT NULL, /* 작성일 */
   rate NUMBER default 0 NOT NULL /* 별점 */
);

CREATE UNIQUE INDEX PK_tbl_review
   ON tbl_review (
      reviewnum ASC
   );

ALTER TABLE tbl_review
   ADD
      CONSTRAINT PK_tbl_review
      PRIMARY KEY (
         reviewnum
      );
        
/* 공지사항테이블 */
CREATE TABLE tbl_notice (
   noticenum NUMBER NOT NULL, /* 공지사항번호 */
   noticetitle VARCHAR2(100) NOT NULL, /* 제목 */
   notice VARCHAR2(3000) NOT NULL, /* 내용 */
   writedate DATE default sysdate NOT NULL, /* 작성일 */
   revisedate DATE default sysdate NOT NULL /* 수정일 */
);

ALTER TABLE tbl_notice
   ADD
      CONSTRAINT PK_tbl_notice
      PRIMARY KEY (
         noticenum
      );
        
/* 자주묻는질문 테이블 */
CREATE TABLE tbl_question (
   questionnum NUMBER NOT NULL, /* 질문번호 */
   questiontitle VARCHAR2(100) NOT NULL, /* 제목 */
   question VARCHAR2(3000) not null/* 내용 */
);        

ALTER TABLE tbl_question
   ADD
      CONSTRAINT PK_tbl_question
      PRIMARY KEY (
         questionnum
      );

/* 권한 테이블 */
CREATE TABLE tbl_auth (
   auth varchar2(50) NOT NULL, /* 권한 */
   id VARCHAR2(20) NOT NULL /* ID */
);

/* 자동로그인 테이블 */ /*이름 절대 바꾸면 안됨*/
CREATE TABLE persistent_logins (
	username VARCHAR2(80) NOT NULL, 
	series VARCHAR2(80) NOT NULL, 
	token VARCHAR2(80) NOT NULL, 
	last_used TIMESTAMP NOT NULL 
);

-- 주문번호를 추가!!
/* 가상계좌 테이블 */
CREATE TABLE tbl_vbank(
    id VARCHAR2(20) NOT NULL,   /* ID */
    ordernum number NOT NULL,   /* 주문번호 */
    vbnum VARCHAR2(100) NOT NULL,   /* 입금계좌명 */
    vbname VARCHAR2(50) NOT NULL,   /* 은행명 */
    vbholder VARCHAR2(30) NOT NULL,   /* 예금주 */
    vbdate DATE NOT NULL    /* 입금기한 */
);


-- 참조(FK)
ALTER TABLE tbl_product
   ADD
      CONSTRAINT FK_tbl_category_TO_tbl_product
      FOREIGN KEY (
         largeca,
         smallca
      )
      REFERENCES tbl_category (
         largeca,
         smallca
      );

ALTER TABLE tbl_product
   ADD
      CONSTRAINT FK_tbl_user_TO_tbl_product
      FOREIGN KEY (
         id
      )
      REFERENCES tbl_user (
         id
      ) on delete set null;

ALTER TABLE tbl_upload
   ADD
      CONSTRAINT FK_tbl_product_TO_tbl_upload
      FOREIGN KEY (
         pronum
      )
      REFERENCES tbl_product (
         pronum
      );

ALTER TABLE tbl_order
   ADD
      CONSTRAINT FK_tbl_product_TO_tbl_order
      FOREIGN KEY (
         pronum
      )
      REFERENCES tbl_product (
         pronum
      );

ALTER TABLE tbl_order
   ADD
      CONSTRAINT FK_tbl_user_TO_tbl_order
      FOREIGN KEY (
         id
      )
      REFERENCES tbl_user (
         id
      ) on delete set null;

ALTER TABLE tbl_cart
   ADD
      CONSTRAINT FK_tbl_user_TO_tbl_cart
      FOREIGN KEY (
         id
      )
      REFERENCES tbl_user (
         id
      ) on delete cascade;

ALTER TABLE tbl_cart
   ADD
      CONSTRAINT FK_tbl_product_TO_tbl_cart
      FOREIGN KEY (
         pronum
      )
      REFERENCES tbl_product (
         pronum
      );

ALTER TABLE tbl_review
   ADD
      CONSTRAINT FK_tbl_user_TO_tbl_review
      FOREIGN KEY (
         id
      )
      REFERENCES tbl_user (
         id
      ) on delete set null;

ALTER TABLE tbl_review
   ADD
      CONSTRAINT FK_tbl_product_TO_tbl_review
      FOREIGN KEY (
         pronum
      )
      REFERENCES tbl_product (
         pronum
      );
    
ALTER TABLE tbl_auth
   ADD
      CONSTRAINT FK_tbl_user_TO_tbl_auth
      FOREIGN KEY (
         id
      )
      REFERENCES tbl_user (
         id
      ) on delete cascade;
      

/* 가상계좌 테이블 FK 추가 */
ALTER TABLE tbl_vbank
   ADD
      CONSTRAINT FK_tbl_user_TO_tbl_vbank
      FOREIGN KEY (
         id
      )
      REFERENCES tbl_user (
         id
      ) on delete cascade;

ALTER TABLE tbl_vbank
   ADD
      CONSTRAINT FK_tbl_order_TO_tbl_vbank
      FOREIGN KEY (
         ordernum
      )
      REFERENCES tbl_order (
         ordernum
      );
        
--시퀀스 생성 
create sequence seq_cart;
create sequence seq_product;
create sequence seq_order;
create sequence seq_review;
create sequence seq_notice;
create sequence seq_questionl;

-- ! 관리자 계정 추가 !
-- 관리자 계정은 테스트 코드를 수행해 작성합니다
--user1, user1, user1Name, 01000001111, user1@user1.com, 0
--user2, user2, user2Name, 01000002222, user2@user2.com, 0
--user3, user3, user3Name, 01000003333, user3@user3.com, 0
--user4, user4, user4Name, 01000004444, user4@user4.com, 0
--user5, user5, user5Name, 01000005555, user5@user5.com, 0
--user6, user6, user6Name, 01000006666, user6@user6.com, 0
--user7, user7, user7Name, 01000007777, user7@user7.com, 0
--user8, user8, user8Name, 01000008888, user8@user8.com, 0
--user9, user9, user9Name, 01000009999, user9@user9.com, 0
--user10, user10, user10Name, 01000001010, user10@user10.com, 0
--aa, aa, aaName, 01011112222, aa@aa.com, 0
--bb, bb, bbName, 01022222222, bb@bb.com, 0

-- 테이블 내용 조회
select * from tbl_category;
select * from tbl_user;
select * from tbl_auth;
select * from tbl_product;
select * from tbl_cart;
select * from tbl_order;
select * from tbl_vbank;
select * from tbl_review;
select * from tbl_upload;
select * from tbl_notice;
select * from tbl_question;

-- 데이터 삭제
delete tbl_user;

--- 테이블 삭제(모든 테이블을 삭제할 경우, 아래 순서대로 해야 문제 없이 삭제됩니다)
drop table tbl_vbank;
drop table tbl_auth;
drop table tbl_question;
drop table tbl_notice;
drop table tbl_review;
drop table tbl_cart;
drop table tbl_order;
drop table tbl_upload;
drop table tbl_product;
drop table tbl_category;
drop table tbl_user;

commit;

-- 카테고리 테이블(tbl_category)에 데이터 추가
insert into tbl_category values('0', '0');  -- 리포트(0)/인문사회(0)
insert into tbl_category values('0', '1');  -- 리포트(0)/자연공학(1)
insert into tbl_category values('0', '2');  -- 리포트(0)/예술체육(2)
insert into tbl_category values('0', '3');  -- 리포트(0)/교양(3)
insert into tbl_category values('1', '0');  -- 논문(1)/인문사회(0)
insert into tbl_category values('1', '1');  -- 논문(1)/자연공학(1)
insert into tbl_category values('1', '2');  -- 논문(1)/예술체육(2)
insert into tbl_category values('1', '3');  -- 논문(1)/교양(3)

-- 페이징 처리 확인을 위한 가짜 데이터(tbl_product) 추가
-- 레포트(0) 인문사회(0)
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title1', 'proname1', 'prodcs1', '100', sysdate, '1'); -- 상품번호, 업로드아이디, 대카테고리, 소카테고리, 제목, 상품명, 설명, 가격, 승인(0 - 미승인)
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title2', 'proname2', 'prodcs2', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title3', 'proname3', 'prodcs3', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title4', 'proname4', 'prodcs4', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title5', 'proname5', 'prodcs5', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title6', 'proname6', 'prodcs6', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title7', 'proname7', 'prodcs7', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title8', 'proname8', 'prodcs8', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title9', 'proname9', 'prodcs9', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title10', 'proname10', 'prodcs10', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title11', 'proname11', 'prodcs11', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '0', '레포트인문사회title12', 'proname12', 'prodcs12', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '0', '레포트인문사회title13', 'proname13', 'prodcs13', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '0', '레포트인문사회title14', 'proname14', 'prodcs14', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '0', '레포트인문사회title15', 'proname15', 'prodcs15', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '0', '레포트인문사회title16', 'proname16', 'prodcs16', '100', sysdate, '1');

-- 레포트(0) 자연공학(1)
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title1', 'proname1', 'prodcs1', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title2', 'proname2', 'prodcs2', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title3', 'proname3', 'prodcs3', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title4', 'proname4', 'prodcs4', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title5', 'proname5', 'prodcs5', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title6', 'proname6', 'prodcs6', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title7', 'proname7', 'prodcs7', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title8', 'proname8', 'prodcs8', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title9', 'proname9', 'prodcs9', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title10', 'proname10', 'prodcs10', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title11', 'proname11', 'prodcs11', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '1', '레포트자연공학title12', 'proname12', 'prodcs12', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '1', '레포트자연공학title13', 'proname13', 'prodcs13', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '1', '레포트자연공학title14', 'proname14', 'prodcs14', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '1', '레포트자연공학title15', 'proname15', 'prodcs15', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '1', '레포트자연공학title16', 'proname16', 'prodcs16', '100', sysdate, '1');

-- 레포트(0) 예술체육(2)
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title1', 'proname1', 'prodcs1', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title2', 'proname2', 'prodcs2', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title3', 'proname3', 'prodcs3', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title4', 'proname4', 'prodcs4', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title5', 'proname5', 'prodcs5', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title6', 'proname6', 'prodcs6', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title7', 'proname7', 'prodcs7', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title8', 'proname8', 'prodcs8', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title9', 'proname9', 'prodcs9', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title10', 'proname10', 'prodcs10', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title11', 'proname11', 'prodcs11', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '2', '레포트예술체육title12', 'proname12', 'prodcs12', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '2', '레포트예술체육title13', 'proname13', 'prodcs13', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '2', '레포트예술체육title14', 'proname14', 'prodcs14', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '2', '레포트예술체육title15', 'proname15', 'prodcs15', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '2', '레포트예술체육title16', 'proname16', 'prodcs16', '100', sysdate, '1');

-- 레포트(0) 교양(3)
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title1', 'proname1', 'prodcs1', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title2', 'proname2', 'prodcs2', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', 레포트교양'title3', 'proname3', 'prodcs3', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title4', 'proname4', 'prodcs4', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title5', 'proname5', 'prodcs5', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title6', 'proname6', 'prodcs6', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title7', 'proname7', 'prodcs7', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title8', 'proname8', 'prodcs8', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title9', 'proname9', 'prodcs9', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title10', 'proname10', 'prodcs10', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title11', 'proname11', 'prodcs11', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '0', '3', '레포트교양title12', 'proname12', 'prodcs12', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '3', '레포트교양title13', 'proname13', 'prodcs13', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '3', '레포트교양title14', 'proname14', 'prodcs14', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '3', '레포트교양title15', 'proname15', 'prodcs15', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '0', '3', '레포트교양title16', 'proname16', 'prodcs16', '100', sysdate, '1');

-- 논문(1) 인문사회(0)
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title1', 'proname1', 'prodcs1', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title2', 'proname2', 'prodcs2', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title3', 'proname3', 'prodcs3', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title4', 'proname4', 'prodcs4', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title5', 'proname5', 'prodcs5', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title6', 'proname6', 'prodcs6', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title7', 'proname7', 'prodcs7', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title8', 'proname8', 'prodcs8', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title9', 'proname9', 'prodcs9', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title10', 'proname10', 'prodcs10', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title11', 'proname11', 'prodcs11', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '0', '논문인문사회title12', 'proname12', 'prodcs12', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '0', '논문인문사회title13', 'proname13', 'prodcs13', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '0', '논문인문사회title14', 'proname14', 'prodcs14', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '0', '논문인문사회title15', 'proname15', 'prodcs15', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '0', '논문인문사회title16', 'proname16', 'prodcs16', '100', sysdate, '1');

-- 논문(1) 자연공학(1)
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title1', 'proname1', 'prodcs1', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title2', 'proname2', 'prodcs2', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title3', 'proname3', 'prodcs3', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title4', 'proname4', 'prodcs4', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title5', 'proname5', 'prodcs5', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title6', 'proname6', 'prodcs6', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title7', 'proname7', 'prodcs7', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title8', 'proname8', 'prodcs8', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title9', 'proname9', 'prodcs9', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title10', 'proname10', 'prodcs10', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title11', 'proname11', 'prodcs11', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '1', '논문자연공학title12', 'proname12', 'prodcs12', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '1', '논문자연공학title13', 'proname13', 'prodcs13', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '1', '논문자연공학title14', 'proname14', 'prodcs14', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '1', '논문자연공학title15', 'proname15', 'prodcs15', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '1', '논문자연공학title16', 'proname16', 'prodcs16', '100', sysdate, '1');

--논문(1) 예술체육(2)
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title1', 'proname1', 'prodcs1', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title2', 'proname2', 'prodcs2', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title3', 'proname3', 'prodcs3', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title4', 'proname4', 'prodcs4', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title5', 'proname5', 'prodcs5', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title6', 'proname6', 'prodcs6', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title7', 'proname7', 'prodcs7', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title8', 'proname8', 'prodcs8', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title9', 'proname9', 'prodcs9', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title10', 'proname10', 'prodcs10', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title11', 'proname11', 'prodcs11', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '2', '논문예술체육title12', 'proname12', 'prodcs12', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '2', '논문예술체육title13', 'proname13', 'prodcs13', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '2', '논문예술체육title14', 'proname14', 'prodcs14', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '2', '논문예술체육title15', 'proname15', 'prodcs15', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '2', '논문예술체육title16', 'proname16', 'prodcs16', '100', sysdate, '1');

-- 논문(1) 교양(3)
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title1', 'proname1', 'prodcs1', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title2', 'proname2', 'prodcs2', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title3', 'proname3', 'prodcs3', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title4', 'proname4', 'prodcs4', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title5', 'proname5', 'prodcs5', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title6', 'proname6', 'prodcs6', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title7', 'proname7', 'prodcs7', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title8', 'proname8', 'prodcs8', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title9', 'proname9', 'prodcs9', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title10', 'proname10', 'prodcs10', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title11', 'proname11', 'prodcs11', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'bb', '1', '3', '논문교양title12', 'proname12', 'prodcs12', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '3', '논문교양title13', 'proname13', 'prodcs13', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '3', '논문교양title14', 'proname14', 'prodcs14', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '3', '논문교양title15', 'proname15', 'prodcs15', '100', sysdate, '1');
insert into tbl_product values(seq_product.nextval, 'aa', '1', '3', '논문교양title16', 'proname16', 'prodcs16', '100', sysdate, '1');

commit;

-- 테스트를 위한 가짜 데이터(tbl_review) 추가
-- 리뷰번호, 리뷰작성자, 상품번호, 리뷰본론, 오늘날짜, 별점
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '1'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '2'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '3'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '4'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '5'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '4'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '4'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '5'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '5'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '2'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '3'); 
insert into tbl_review values(seq_review.nextval, 229, 'aa', 'review', sysdate, '3'); 

-- 테스트를 위한 가짜 데이터(tbl_order) 추가
-- (무통장의 경우 계좌가 발급되어야 하므로 실제 페이지에서만 테스트 가능, 아래 코드는 신용카드인 경우만 해당)
insert into tbl_order values(seq_order.nextval, 229, 'aa', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 229, 'bb', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 229, 'user1', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 229, 'user2', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 229, 'user3', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 229, 'user4', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 234, 'aa', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 234, 'bb', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 234, 'user1', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 234, 'user2', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 236, 'user3', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 236, 'user4', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 217, 'user3', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 217, 'user4', 'card', 100, sysdate);
insert into tbl_order values(seq_order.nextval, 222, 'aa', 'card', 100, sysdate);

commit;


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
   password VARCHAR2(20) NOT NULL, /* 암호 */
   auth NUMBER default 0 NOT NULL , /* 권한 */
   name VARCHAR2(20) NOT NULL, /* 이름 */
   phone VARCHAR2(12) NOT NULL, /* 휴대폰번호 */
   email VARCHAR2(30) NOT NULL, /* 이메일 */
   grade number default 0 NOT NULL /* 등급 */
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
   writedate DATE NOT NULL, /* 작성일 */
   revisedate DATE NOT NULL /* 수정일 */
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
        
--시퀀스 생성 
create sequence seq_cart;
create sequence seq_product;
create sequence seq_order;
create sequence seq_review;
create sequence seq_notice;
create sequence seq_questionl;

-- 데이터 추가 테스트
insert into tbl_user values('aa', '123', '0', 'hong', '01011111111', 'abc@abc.com', '0' );
insert into tbl_category values('123', '456');
insert into tbl_product values('123', 'aa', '123', '456', 'title', 'proname', 
'prodcs', '10000', sysdate, '0');
insert into tbl_cart values('1234', 'aa', '123');
insert into tbl_order values('1234', '123', 'aa', 'cash', '10000', sysdate);
insert into tbl_review values('1111', '123', 'aa', 'good', sysdate, '0');
insert into tbl_upload values('123', 'uuid', 'directory', 'filename');

delete from tbl_user where id ='aa';

insert into tbl_cart values(SEQ_CART.nextval, 'aa', '123');

-- ! 관리자 계정 추가 ! :: Oracle SQL Developer 사용할 때 insert 후 꼭 commit
insert into tbl_user values('admin', 'admin', '1', '관리자', '00000000000', 'admin@admin.com', '0' );

-- 테이블 내용 조회
select * from tbl_user;

-- 데이터 삭제
delete tbl_user;

--- 테이블 삭제(모든 테이블을 삭제할 경우, 아래 순서대로 해야 문제 없이 삭제됩니다)
drop table tbl_question;
drop table tbl_notice;
drop table tbl_review;
drop table tbl_cart;
drop table tbl_order;
drop table tbl_upload;
drop table tbl_product;
drop table tbl_category;
drop table tbl_user;

-- 카테고리 테이블(tbl_category)에 데이터 추가
insert into tbl_category values('0', '0');  -- 리포트(0)/인문사회(0)
insert into tbl_category values('0', '1');  -- 리포트(0)/자연공학(1)
insert into tbl_category values('0', '2');  -- 리포트(0)/예술체육(2)
insert into tbl_category values('0', '3');  -- 리포트(0)/교양(3)
insert into tbl_category values('1', '0');  -- 논문(1)/인문사회(0)
insert into tbl_category values('1', '1');  -- 논문(1)/자연공학(1)
insert into tbl_category values('1', '2');  -- 논문(1)/예술체육(2)
insert into tbl_category values('1', '3');  -- 논문(1)/교양(3)


--관리자
drop table admin;
create table admin
(
	aId varchar2(20) primary key,--관리자아이디PK
	aPwd varchar2(50),			--패스
	alevel number(1),			--관리자 등급
	regdate date default sysdate--계정생성일
);
--회원
drop table member_s;
create table member_s
(
	mId varchar2(100) primary key,--유저아이디PK
	mPwd varchar2(50),			--유저패스워드
	mName varchar2(20),			--유저이름
	mAddr varchar2(20),			--유저주소
	mPhone varchar2(100),		--유저핸드폰번호
	mState number(1),			--회원상태(탈퇴)
	regdate date default sysdate--유저가입일
);
--카테고리
drop table category;
create table category
(	
    code varchar2(50), --대분류카테고리
    cName varchar2(50) primary key --소분류카테고리(상세카테고리)PK
);
--제품
drop table  product;
create table product
(
	pNum number(20) primary key,--제품번호PK
	pName varchar2(100),		--제품이름
	pContent varchar2(100),		--제품설명
	pPrice number(20),			--제품가격
	pbuyCount number(20),		--구매카운드
	cName varchar2(50), 		--카테고리(fk)
	constraint fk_pcategory foreign key(cName) references category(cName)
);
--제품이미지
drop table  proimage;
create table proimage
(
	piNum number(20) primary key,--이미지넘버PK
	pNum number(20),			 --제품번호(fk)
	constraint fk_imagepNum foreign key(pnum) references product(pNum),
	piFilename varchar(20),		 --파일이름
	piFilesize number			 --파일사이즈
);
--제품상세
drop table  prodetail;
create table prodetail
(
    pdNum number(20) primary key,--제품상세번호PK
	pNum number(20),			 --제품번호(fk)
	constraint fk_detailpNum foreign key(pnum) references product(pNum),
	proSize varchar2(50),--제품사이즈
	proCount number(20)--제품수량
);
--카트
drop table  cart;
create table cart
(
    cCartNum number(20) primary key,--장바구니 넘버PK
	pnum number(20),--제품넘버(fk)
   	 mId varchar2(100),--회원아이디(fk)

	constraint fk_cartpNum foreign key(pnum) references product(pNum),
	constraint fk_cartuId foreign key(mId) references member_s(mId)
	--추가
	alter table cart add ccount number(10);--수량
);

--주문
drop table  orders;
create table orders
(
	oNum number(20) primary key,--주문번호PK
	mId varchar2(100),			--유저아이디(fk)
	constraint fk_order_uId foreign key(mId) references member_s(mId),
    totalSales number(20),		--총구매가격
    deLocation varchar2(100),	--배송지
	oDate date default sysdate 	--주문날짜
);
--주문상세
drop table  orderdetail;
create table orderdetail
(
	odNum number(20) primary key,--주문상세번호PK
	oNum number(20),--주문번호(FK)
	constraint fk_order_oNum foreign key(oNum) references orders(oNum),
	pdNum number(20),--제품상세번호(FK)
	constraint fk_order_pdNum foreign key(pdNum) references prodetail(pdNum),
	dCount number(20),--주문수량
    dPrice number(20), --제품가격
    dState number(1)--주문상태
); 
--후기
drop table  comments_s;
create table comments_s
(
    coNum number(30) primary key,--리뷰글번호PK
	odNum number(20),--주문상세번호(fk)
	constraint fk_comment_odNum foreign key(odNum) references orderdetail(odNum),
	cScore varchar2(30),--평점
    content varchar2(90),--리뷰내용
	mid varchar2(100),--회원아이디(작성자)(fk)
	constraint fk_comment_mid foreign key(mid) references member_s(mid),
	cDate  date default sysdate--작성날짜
);

-----------------------------—시퀀스—--------------------------------
--<상품 테이블 시퀀스>
create sequence seq_product
MINVALUE 1
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1
START WITH 1
CACHE 20
NOORDER
NOCYCLE ;

--<이미지 테이블 시퀀스>
create sequence seq_proimage
MINVALUE 1
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1
START WITH 1
CACHE 20
NOORDER
NOCYCLE ;

--<카트 테이블 시퀀스>
create sequence seq_cart
MINVALUE 1
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1
START WITH 1
CACHE 20
NOORDER
NOCYCLE ;

--<카테고리 테이블 시퀀스>
create sequence seq_category
MINVALUE 1
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1
START WITH 1
CACHE 20
NOORDER
NOCYCLE ;

--<후기 테이블 시퀀스>
create sequence seq_comments
MINVALUE 1
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1
START WITH 1
CACHE 20
NOORDER
NOCYCLE ;

--<주문 테이블 시퀀스>
create sequence seq_order
MINVALUE 1
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1
START WITH 1
CACHE 20
NOORDER
NOCYCLE ;

--<상세주문 테이블 시퀀스>
create sequence seq_orderdetail
MINVALUE 1
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1
START WITH 1
CACHE 20
NOORDER
NOCYCLE ;


--<추가사항>

create sequence seq_prodetail
MINVALUE 1
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1
START WITH 1
CACHE 20
NOORDER
NOCYCLE ;
--proimage 컬럼추가
alter table proimage add imgtype number(3);
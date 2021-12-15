create table commentsss
(
    coNum number(30) primary key,--리뷰PK넘버
	odNum number(20),--주문상세번호(fk)
	cScore varchar2(30),--평점
    content varchar2(100),--리뷰내용
	mid varchar2(10),--회원아이디(작성자)(fk)
	cDate  date default sysdate--작성날짜
);

INSERT INTO COMMENTSSS VALUES(SEQ_COMMENTS.nextval, 1, '★★★★★', '좋아요', 'aaa', SYSDATE);
INSERT INTO COMMENTSSS VALUES(SEQ_COMMENTS.nextval, 2, '★★★', '괜찮아요', 'bbb', SYSDATE);
INSERT INTO COMMENTSSS VALUES(SEQ_COMMENTS.nextval, 3, '★★', '배송이느려요', 'ccc', SYSDATE);
INSERT INTO COMMENTSSS VALUES(SEQ_COMMENTS.nextval, 4, '★★★★★', '너무좋아요', 'ddd', SYSDATE);

SELECT * FROM COMMENTSSS;

--COMMIT;
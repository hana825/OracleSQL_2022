SELECT * FROM tbl_books;


DROP TABLE tbl_books;

CREATE TABLE tbl_books(
    isbn VARCHAR2(13) PRIMARY KEY,
    title nVARCHAR2(50) NOT NULL,
    author nVARCHAR2(50) NOT NULL,
    publisher nVARCHAR2(50) NOT NULL,
    price NUMBER,
    discount NUMBER,
    description nVARCHAR2(2000),
    pubdate VARCHAR2(10),
    link VARCHAR2(125),
    image VARCHAR2(125)
);

INSERT ALL 
INTO tbl_books(isbn, title, author, publisher)
VALUES ('0001','자바', '홍길동', '우리출판사')
INTO tbl_books(isbn, title, author, publisher)
VALUES ('0002','오라클', '홍길동', '우리출판사')
SELECT * FROM DUAL;


INSERT INTO tbl_books(isbn, title, author, publisher, price)
VALUES ('0003', 'MySQL', '이몽룡', '남원출판사','9000');

INSERT INTO tbl_books(isbn, title, author, publisher, price)
VALUES ('0004', 'MySQL', '이몽룡', '남원출판사','');

/*
SQL Developer에서 INSERT, UPDATE, DELETE룰 수행하였으나 다른(Spring) 프로젝트에서 데이터반영이 안되는 경우 명령 끝에 반드시 COMMIT을 수행해야 한다.
INSERT, UPDATE, DELETE를 수행한 결과는 아직 메모리 버퍼에 머물러있는 상태에다. 실제 물리적 저장소에 저장이 안된 상태이다. 
이 상태에서 다른 프로젝트에서 데이터를 조회하면 데이터가 보이지 않는다. (COMMIT을 할 때까지)
*/

COMMIT;
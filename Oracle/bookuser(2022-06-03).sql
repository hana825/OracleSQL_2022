-- 2022-06-03
-- One Day Project

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

SELECT * FROM tbl_books;
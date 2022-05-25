-- 2022-05-25
DROP TABLE tbl_student;
DROP TABLE tbl_dept;
DROP TABLE tbl_belong;

-- 학생정보 테이블
CREATE TABLE tbl_student(
    ST_NUM	    VARCHAR2(8) PRIMARY KEY,
    ST_NAME	    NVARCHAR2(15) NOT NULL,
    ST_GRADE	NUMBER(1,0),
    ST_TEL	    VARCHAR2(10),
    ST_ADDR	    NVARCHAR2(255)
);

-- 학과정보 테이블
CREATE TABLE tbl_dept(
    D_CODE	VARCHAR2(5) PRIMARY KEY,
    D_NAME	NVARCHAR2(20) NOT NULL,
    D_PRO	NVARCHAR2(15),
    D_CLASS	VARCHAR2(5)
);

-- 소속정보 테이블
CREATE TABLE tbl_belong(
    B_SEQ	NUMBER PRIMARY KEY,
    B_STNUM	VARCHAR2(8) NOT NULL,
    B_DCODE	VARCHAR2(5) NOT NULL,
    UNIQUE(B_STNUM, B_DCODE)
);

-- 학생정보 샘플데이터 추가
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220001', '홍길동', 1);
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220002', '이몽룡', 3);
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220003', '성춘향', 2);

-- 학과정보 샘플데이터 추가
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class) VALUES ('D0001', '컴퓨터공학', '장영실', '505');
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class) VALUES ('D0002', '체육과', '임꺽정', '501');
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class) VALUES ('D0003', '법학과', '장영자', '502');

-- 소속정보 샘플데이터 추가
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (1, '20220001', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (2, '20220002', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (3, '20220002', 'D0002');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (4, '20220003', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (5, '20220003', 'D0002');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (6, '20220003', 'D0003');


/*
테이블에 일련번호 칼럼이 있을 경우
중복되지 않은 일련번호를 사용하여 PK로 설정한다.
오라클 이외의 다른 DBMS에서는 AUTO INCREMENT라는 속성을 사용하여
데이터를 insert 할 때 자동으로 칼럼 데이터를 추가한다.
하지만 오라클은 그러한 속성이 없어서 상당히 불편하다.

오라클에서는 SEQUENCE라는 특별한 객체가 있어서
그 객체를 사용하여 같은 효과를 발휘한다.

또는 PK에 해당하는 칼럼을 문자열 32byte 크기로 설정하고
UUID를 사용하기도 한다.
프로그래밍 언어(Java, c, python : 호스트 언어)와 함께 
프로젝트를 할 때는 UUID를 사용한다.

*/

-- seq_belong 이라는 SEQUENCE 객체를 생성하고
-- 시작값을 1로 자동 증가 옵션을 1로 설정하겠다.
CREATE SEQUENCE seq_belong
INCREMENT BY 1 START WITH 1;

-- seq_belong SEQUENCE 의 NEXTVAL 값을 조회(SELECT) 하라
-- NEXTVAL 값은 호출(SELECT 등)할 때마다 항상 1 증가된 값을 보여준다.
SELECT seq_belong.NEXTVAL FROM DUAL;

-- 표준 SQL에서 간단한 4칙 연산을 수행하는 방법
-- 오라클에서는 SELECT 명령문이 FROM 절이 없이 수행하는 것이 불가능하다.
-- 그래서 의미없는(DUMY) Table인 DUAL Table을 사용하여 FROM 절을 붙여준다.
SELECT 10 + 20 FROM DUAL;
SELECT 100 * 100 FROM DUAL;
SELECT 100 - 10 FROM DUAL;
SELECT 50 / 20 FROM DUAL;


-- SEQUENCE를 사용하여 자동 증가하는 SEQ을 만들고, INSERT에서 사용하기
INSERT INTO tbl_belong (b_seq, b_stnum, b_dcode)
VALUES (seq_belong.NEXTVAL, '20220003', 'D0004');
INSERT INTO tbl_belong (b_seq, b_stnum, b_dcode)
VALUES (seq_belong.NEXTVAL, '20220003', 'D0007');


SELECT * FROM tbl_belong;


-- tbl_student, tbl_dept, tbl_belong 3개의 table LEFT JOIN하여
-- 학번, 이름, 학과코드, 학과명, 학년을 표시하는 SELECT문 작성

SELECT ST.st_num 학번, ST.st_name 이름, B.b_dcode 학과코드, 
        D.d_name 학과명, ST.st_grade 학년
FROM tbl_student ST
LEFT JOIN tbl_belong B
ON ST.st_num = B.b_stnum
LEFT JOIN tbl_dept D
ON B.b_dcode = D.d_code
ORDER BY st_num;


-- 학생정보를 확인하면서 어떤 학과에 소속되었는지를 알고싶다.
-- 소속은 tbl_belong에 저장되어 있다.
SELECT st_num, st_name, st_grade
FROM tbl_student;

-- 20220001 학생이 어떤 학과 소속인지 알고시ㅠ다
SELECT * FROM tbl_belong
WHERE b_stnum = '20220001';

SELECT st_num ,st_name, b_dcode, st_grade
FROM tbl_student
LEFT JOIN tbl_belong
ON b_stnum = '20220001';


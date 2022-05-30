-- 여기는 hana 화면

-- mySQL은 DB와 관련된 명령을 실행할 때
-- 가장 먼저 어떤 DB를 사용할 것인지 알려줘야 한다.
USE mydb;
DROP TABLE tbl_test;
-- Table을 생성할 때 칼럼의 이름은 사전에 있는 키워드를 가급적 사용하지 않는 것이 좋다.
-- 사전에 있는 키워드를 사용할 때는 접두사를 부착하여 사용하는 것이 좋다.
CREATE TABLE tbl_test (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    t_name VARCHAR(30)
);

/*
DBMS 중에서 가장 많이 사용하는 오라클과 함께 MySQL을 사용하는데
MySQL에서 사용하는 방식이 DBMS의 업계표준으로 정착이 된 상태

대부분의 DBMS들은 먼저 Database를 생성하고 
사용자가 Database에 접근할 수 있는 권한을 부여하고
사용자는 Database를 사용하겠다 라고 선언을 한 후 DB 관련된 명령을 사용한다.
*/

INSERT INTO tbl_test (t_name)
VALUES ('홍길동');

SELECT * FROM tbl_test;

-- 다중데이터 INSERT 하기
INSERT INTO tbl_test (t_name)
VALUES ('이몽룡'), ('성춘향'), ('장영자'), ('서시'), ('장희빈');

/*
tbl_test의 ID 칼럼은 AUTO_INCREMENT로 설정되었기 때문에 데이터를 INSERT 할 때마다
자동으로 Sequence값이 생성되어 추가된다.
5.x MySQL에서는 AUTO_INCREMENT 칼럼에 이슈가 있었다.
5.x 숫자 type은 주로 INT형을 사용하는데 INT형은 정수 11자리이다.
때문에 정수형 11자리 범위를 벗어나는 경우 데이터 INSERT가 불가능해지는 문제가 있었다.
5.7 버전 이후에는 BIGINT형 타입이 도입되어 문제를 해결하였다.
DB table을 만들 때 AUTO_INCREMENT 칼럼에는 반드시 BIGINT형을 지정한다.

MySQL 숫자형 데이터 타입
TINYINT : 1Byte : -128 ~ 127 까지만 저장 가능
SMALLINT : 2Byte : -32768 ~ 32767
MEDIUMINT : 3Byte : -8388608 ~ 8388607
INT : 4Byte : -2147483648 ~ 2147483647
BIGINT : 8BYte : -2의 7승 -1 부터 2의 7승까지
*/

/*
AUTO_INCREMENT 칼럼을 만들 때 주의할 점
데이터 타입은 BIGINT로 설정. 가급적 PRIMARY KEY로 설정할 것
PK 아닌 경우는 반드시 NOT NULL과 UNIQUE를 같이 설정한다.
PK 또는 NOT NULL과 UNIQUE 설정이 되지 않았을 경우 Table생성에서 오류가 난다.
*/

CREATE TABLE tbl_student (
	ST_NUM	VARCHAR(5),
	ST_NAME	VARCHAR(20),
	ST_DEPT	VARCHAR(10),
	ST_GRADE	INT,
	ST_TEL	VARCHAR(15),
	ST_ADDR	VARCHAR(125)
)

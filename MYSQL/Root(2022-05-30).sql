-- 여기는 root 접속한 화면
-- root는 Oracle의 sys와 같은 역할
/*
mySQL 사용자와 DB(Data저장소)의 관계가 연결이 아니다.
오라클에서는 사용자에게 default Table Space를 지정하여
login(접속)을 하면 자동으로 기본 DB가 연결된다.

사용자는 단순히 DB서버에 접속하는 권한을 부여받을 뿐이고
어떤 DB를 사용할 것인지 처음 시작할 때 연결을 해주어야 한다.
*/

-- DB 저장소 생성
CREATE DATABASE myDB;

-- 일반 사용자 생성
-- MySQL은 전통적으로 root 사용자로 접속하여 DB를 관리한다.
-- 최근 추세는 root 사용자는 DB, USER 생성만을 담당하고,
-- DB관리는 일반 사용자들 생성하여 실행하도록 권장한다.
-- MySQL은 사용자를 생성할 때 어떤 방법으로 접속할 것인지를 명시해야 한다.
-- hana 사용자는 localhost에서만 mySQL 서버에 접속할 수 있다.
DROP USER 'hana'@'localhost';
CREATE USER 'hana'@'localhost'
IDENTIFIED BY '!Korea8080';

/*
MySQL은 사용자를 등록하면 그 사용자는 DBA 권한을 기본적으로 갖는다.
MySQL은 실무에서 가장 많이 사용하는 버전이 5.7.x이다.
5.7버전은 사용자 등록과 동시에 DB 관련된 명령을 대부분 사용할 수 있다.
8.x버전은 사용자권한이 좀더 엄격해졌다. 

새로 등록한 사용자에게 DB에 접근할 수 있는 권한부여하기
hana@localhost 사용자에게 mydb Schema에 접근하여 모든 DML 명령을 수행할 수 있는 권한을 부여한다.
*/

GRANT ALL PRIVILEGES ON mydb.* TO 'hana'@'localhost';

CREATE USER 'user1'@'127.0.0.1' IDENTIFIED BY '!Korea8080';

-- user1은 모든 DB Schema에 접근권한 부여
GRANT ALL PRIVILEGES ON *.* TO 'user1'@'127.0.0.1';

-- 어디에서나 접속할 수 있도록 범위를 지정하지 않는 사용자 등록
CREATE USER 'user2'@'*' IDENTIFIED BY '!Korea8080';





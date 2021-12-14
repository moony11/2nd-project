CREATE TABLE MEMBER
(
    MEMBER_ID    NUMBER          NOT NULL, 
    NICKNAME     VARCHAR2(20)    NOT NULL, 
    NAME         VARCHAR2(20)    NOT NULL, 
    PHONE        VARCHAR2(20)    NOT NULL, 
    EMAIL        VARCHAR2(40)    NOT NULL, 
    LOGIN_ID     VARCHAR2(40)    NOT NULL, 
    LOGIN_PW     VARCHAR2(40)    NOT NULL, 
    BIRTH        VARCHAR2(40)    NOT NULL, 
    CONSTRAINT MEMBER_ID PRIMARY KEY (MEMBER_ID)
)
/

CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1;
/

COMMIT;

INSERT INTO MEMBER VALUES ( MEMBER_SEQ.NEXTVAL, 'NNBBB1', 'N1', '000-1111-1111', 'ABC@NAVER.COM', 'BBB', 'CCC', '1990/04/26' );
SELECT LOGIN_ID FROM MEMBER WHERE LOGIN_ID = 'ABCD';
SELECT LOGIN_PW FROM MEMBER WHERE LOGIN_ID= 'ABC';
SELECT * FROM MEMBER WHERE LOGIN_ID= 'ABC11';
SELECT * FROM MEMBER WHERE LOGIN_ID='ABC';
SELECT LOGIN_ID FROM MEMBER WHERE LOGIN_ID = 'ABC';
SELECT * FROM MEMBER;

UPDATE MEMBER SET LOGIN_PW = 'BBB', EMAIL='BBB@NAVER.COM', PHONE='111-2222-3333' WHERE LOGIN_ID = 'ABC11'
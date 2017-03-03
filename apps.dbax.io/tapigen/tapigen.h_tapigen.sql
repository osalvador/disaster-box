DROP TABLE TAPIGEN.H_TAPIGEN CASCADE CONSTRAINTS
/

CREATE TABLE TAPIGEN.H_TAPIGEN
(
  ID                   NUMBER(20)               NOT NULL,
  SESSION_ID           VARCHAR2(256 BYTE)           NULL,
  TABLE_NAME           VARCHAR2(256 BYTE)           NULL,
  TABLE_PKS            VARCHAR2(256 BYTE)           NULL,
  TABLE_SQL            CLOB                         NULL,
  AUDIT_CREATED_BY     VARCHAR2(100 BYTE)           NULL,
  AUDIT_CREATED_DATE   VARCHAR2(100 BYTE)           NULL,
  AUDIT_MODIFIED_BY    VARCHAR2(100 BYTE)           NULL,
  AUDIT_MODIFIED_DATE  VARCHAR2(100 BYTE)           NULL,
  LOGGER               VARCHAR2(256 BYTE)           NULL,
  TAPIGEN_METHODS      VARCHAR2(512 BYTE)           NULL,
  ERROR                VARCHAR2(4000 BYTE)          NULL,
  CREATED_BY           VARCHAR2(100 BYTE)       DEFAULT -1                    NOT NULL,
  CREATED_DATE         DATE                     DEFAULT sysdate               NOT NULL,
  MODIFIED_BY          VARCHAR2(100 BYTE)       DEFAULT -1                    NOT NULL,
  MODIFIED_DATE        DATE                     DEFAULT sysdate               NOT NULL
)
TABLESPACE USERS
/



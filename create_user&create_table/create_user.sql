ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER sejong IDENTIFIED BY sejong;

GRANT RESOURCE, CONNECT TO sejong;

ALTER USER sejong DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
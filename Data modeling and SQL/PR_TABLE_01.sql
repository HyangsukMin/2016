CREATE TABLE MEMBER (
MEM_CODE NvarCHAR2(11) NOT NULL,
MEM_NAME NVARCHAR2(5) NOT NULL,
PRIMARY KEY(MEM_CODE)
);

-------------------------------------------------------
CREATE TABLE TYPE (
T_CODE CHAR(2) NOT NULL PRIMARY KEY,
T_DESCRIPT NVARCHAR2(3) NOT NULL
);
------------------------------------------------------
CREATE TABLE SUBJECT (
SUB_CODE NvarCHAR2(11) NOT NULL,
SUB_NAME NVARCHAR2(10) NOT NULL,
SUB_DESCRIPT NVARCHAR2(100) NOT NULL,
PRIMARY KEY (SUB_CODE)
);

-------------------------------------------------------------------------------
CREATE TABLE QUESTION (
Q_CODE NVARCHAR2(11) NOT NULL,
T_CODE CHAR(2) NOT NULL,
SUB_CODE NvarCHAR2(11) NOT NULL,
Q_PROBLEM NVARCHAR2(300) NOT NULL,
Q_C1 NVARCHAR2(300),
Q_C2 NVARCHAR2(300),
Q_C3 NVARCHAR2(300),
Q_C4 NVARCHAR2(300),
Q_ANS NVARCHAR2(30) NOT NULL,
Q_LEVEL NCHAR(1) NOT NULL,
Q_INDATE DATE NOT NULL,
Q_DESCRIPT NVARCHAR2(50) NOT NULL,
MEM_CODE NvarCHAR2(11) not null ,
PRIMARY KEY(Q_CODE),
FOREIGN KEY(SUB_CODE) REFERENCES SUBJECT,
FOREIGN KEY(MEM_CODE) REFERENCES MEMBER,
FOREIGN KEY (T_CODE) REFERENCES TYPE);

SELECT * FROM QUESTION;
--------------------------------------------------------------------------------
CREATE TABLE Q_DETAIL(
Q_CODE NVARCHAR2(11) NOT NULL,
Q_POCA NUMBER(4,1),
Q_NOTT NUMBER,
Q_NOCA NUMBER,
Q_TIME TIMESTAMP,
PRIMARY KEY (Q_CODE),
FOREIGN KEY (Q_CODE) REFERENCES QUESTION
);
SELECT * FROM Q_DETAIL;
-------------------------------------------------------------------------------
CREATE TABLE EXAME(
EXAME_CODE NVARCHAR2(11) NOT NULL,
EXAME_SCORE NUMBER(3),
MEM_CODE NVARCHAR2(11) NOT NULL,
PRIMARY KEY (EXAME_CODE),
FOREIGN KEY (MEM_CODE) REFERENCES MEMBER
);
SELECT * FROM EXAME;
--------------------------------------------------------------------------------
CREATE TABLE EXAME_DETAIL (
EXAME_CODE NVARCHAR2(11) NOT NULL,
Q_CODE NVARCHAR2(11) NOT NULL,
D_NUM NUMBER NOT NULL,
D_ANS NVARCHAR2(30),
D_CANS NVARCHAR2(30),
D_CRR CHAR(1),
D_STIME TIMESTAMP,
D_LTIME TIMESTAMP,
D_SCORE NUMBER,
PRIMARY KEY (EXAME_CODE, D_NUM),
FOREIGN KEY (EXAME_CODE) REFERENCES EXAME,
FOREIGN KEY (Q_CODE) REFERENCES QUESTION
);
SELECT * FROM EXAME_DETAIL;




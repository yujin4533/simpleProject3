show user;

-- 회원
CREATE TABLE p3member(
    memberSeq NUMBER(10) NOT NULL,
    userName VARCHAR2(40) NOT NULL,
    userID VARCHAR2(40) NOT NULL,
    pwd VARCHAR2(200) NOT NULL,
    status NUMBER(1) DEFAULT 1,
    CONSTRAINT p3member PRIMARY KEY(memberSeq),
    CONSTRAINT p3member_userID UNIQUE(userID)
);
-- 회원시퀀스
CREATE SEQUENCE seq_p3member
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCACHE
NOCYCLE;

-- 파일
CREATE TABLE p3file(
    fileSeq NUMBER(10) NOT NULL,
    memberSeq NUMBER(10) NOT NULL,
    fileType VARCHAR2(20) NOT NULL,
    fileOrgName VARCHAR2(100) NOT NULL,
    fileNewName VARCHAR2(200) NOT NULL,
    fileSize VARCHAR2(200) NOT NULL,
    fileInformation VARCHAR2(1000),
    fileTag VARCHAR2(200),
    uploadDate DATE DEFAULT SYSDATE,
    status NUMBER(1) DEFAULT 1,
    CONSTRAINT p3file PRIMARY KEY(fileSeq),
    CONSTRAINT p3file_memberSeq FOREIGN KEY(memberSeq) REFERENCES p3member(memberSeq)
);
-- 회원시퀀스
CREATE SEQUENCE seq_p3file
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCACHE
NOCYCLE;

-- 파일 다운로드
CREATE TABLE p3download(
    fileSeq NUMBER(10) NOT NULL,
    memberSeq NUMBER(10) NOT NULL,
    saveDate DATE DEFAULT SYSDATE
);

-- 파일 찜목록
CREATE TABLE p3heart(
    fileSeq NUMBER(10) NOT NULL,
    memberSeq NUMBER(10) NOT NULL,
    status NUMBER(1) DEFAULT 1,
    saveDate DATE DEFAULT SYSDATE
);
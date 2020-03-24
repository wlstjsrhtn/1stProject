DROP TABLE MEMBER;
CREATE TABLE MEMBER(
  MId VARCHAR2(100) PRIMARY KEY,
  MPw VARCHAR2(100) NOT NULL,
  MName VARCHAR2(100) NOT NULL,
  MTel VARCHAR2(100),
  MBirth DATE,
  MEmail VARCHAR2(100),
  MGender VARCHAR2(5),
  MAddress VARCHAR2(100),
  MRdate DATE DEFAULT SYSDATE
);
-- mId 중복체크
SELECT * FROM MEMBER WHERE MId='aaa';
-- 회원가입(mID, mPw, mNAME / mEMAIL, mPHOTO, mBIRTH, mADDRESS)
INSERT INTO MEMBER(MId, MPw, MName, MTel, MBirth, MEmail, MGender, MAddress)
            VALUES('aaa', '111', '홍길동', '010-9999-9999', '1990-01-01', 'a@a.naver.com', 'M', '종로');
-- 로그인 (mID, mPW)
SELECT * FROM MEMBER WHERE MId='aaa' AND MPw='111';
--세션에 넣기 위해 mId로 member dto가져오기
SELECT * FROM MEMBER WHERE MId='aaa';
--회원정보수정(mPw, mNAME / mEMAIL, mPHOTO, mBIRTH, mADDRESS 수정 가능)
UPDATE MEMBER SET MPw='222', MName='김길동', MTel='010-8888-8888', MBirth='1991-01-01', MGender='F', MAddress='송파' WHERE MId='aaa';
-- 회원목록(startRow ~ endRow)
SELECT * FROM MEMBER ORDER BY MRdate DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM MEMBER ORDER BY MRdate DESC) A) WHERE RN BETWEEN 1 AND 10;
SELECT * FROM MEMBER WHERE MId='aaa' AND MPw='222';
-- 가입한 전체 회원 명수
SELECT COUNT(*) FROM MEMBER;
-- 회원탈퇴
DELETE FROM MEMBER;
----------------------- 관리자--------------
DROP TABLE ADMIN;
CREATE TABLE ADMIN(
    AId VARCHAR2(30) PRIMARY KEY,
    APw VARCHAR2(30) NOT NULL,
    AName VARCHAR2(30) NOT NULL);
-- dummy data
INSERT INTO ADMIN VALUES ('admin','111','김관리');
-- admin loginCheck
SELECT * FROM ADMIN WHERE AId='admin' AND APw='111';
-- admin aid로 dto 가져오기
SELECT * FROM ADMIN WHERE AId='admin';
COMMIT;
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
-- mId �ߺ�üũ
SELECT * FROM MEMBER WHERE MId='aaa';
-- ȸ������(mID, mPw, mNAME / mEMAIL, mPHOTO, mBIRTH, mADDRESS)
INSERT INTO MEMBER(MId, MPw, MName, MTel, MBirth, MEmail, MGender, MAddress)
            VALUES('aaa', '111', 'ȫ�浿', '010-9999-9999', '1990-01-01', 'a@a.naver.com', 'M', '����');
-- �α��� (mID, mPW)
SELECT * FROM MEMBER WHERE MId='aaa' AND MPw='111';
--���ǿ� �ֱ� ���� mId�� member dto��������
SELECT * FROM MEMBER WHERE MId='aaa';
--ȸ����������(mPw, mNAME / mEMAIL, mPHOTO, mBIRTH, mADDRESS ���� ����)
UPDATE MEMBER SET MPw='222', MName='��浿', MTel='010-8888-8888', MBirth='1991-01-01', MGender='F', MAddress='����' WHERE MId='aaa';
-- ȸ�����(startRow ~ endRow)
SELECT * FROM MEMBER ORDER BY MRdate DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM MEMBER ORDER BY MRdate DESC) A) WHERE RN BETWEEN 1 AND 10;
SELECT * FROM MEMBER WHERE MId='aaa' AND MPw='222';
-- ������ ��ü ȸ�� ���
SELECT COUNT(*) FROM MEMBER;
-- ȸ��Ż��
DELETE FROM MEMBER;
----------------------- ������--------------
DROP TABLE ADMIN;
CREATE TABLE ADMIN(
    AId VARCHAR2(30) PRIMARY KEY,
    APw VARCHAR2(30) NOT NULL,
    AName VARCHAR2(30) NOT NULL);
-- dummy data
INSERT INTO ADMIN VALUES ('admin','111','�����');
-- admin loginCheck
SELECT * FROM ADMIN WHERE AId='admin' AND APw='111';
-- admin aid�� dto ��������
SELECT * FROM ADMIN WHERE AId='admin';
COMMIT;
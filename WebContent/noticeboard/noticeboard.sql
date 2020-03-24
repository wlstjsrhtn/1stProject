DROP TABLE NOTICEBOARD;
DROP SEQUENCE NOTICEBOARD_SEQ;
CREATE SEQUENCE NOTICEBOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE NOTICEBOARD(
  NNum NUMBER(4) PRIMARY KEY,
  AId VARCHAR2(30) REFERENCES Admin(AId),
  NTitle VARCHAR2(100) NOT NULL,
  NPhoto VARCHAR2(30),
  NContent VARCHAR2(500) NOT NULL,
  NDate DATE DEFAULT SYSDATE,
  NHit NUMBER(4) DEFAULT 0
);
SELECT * FROM NOTICEBOARD;
-- ���̵�����(����)
INSERT INTO NOTICEBOARD(NNum, AId, NTitle, NPhoto, NContent, NDate)
              VALUES(NOTICEBOARD_SEQ.NEXTVAL, 'admin', '����',NULL, '����', NULL); 
-- �۸��(startRow���� endRow����) - �۹�ȣ, �ۼ����̸�, ...
SELECT N.*, NTitle FROM NOTICEBOARD N, ADMIN A WHERE N.AId=A.AId 
                ORDER BY NNum; -- ��� ����
SELECT * FROM 
    (SELECT ROWNUM RN, C.* FROM 
    (SELECT N.*, AName FROM NOTICEBOARD N, ADMIN A WHERE N.AId=A.AId 
                ORDER BY NNum) C)
    WHERE RN BETWEEN 1 AND 11;
-- �۰���
SELECT COUNT(*) FROM NOTICEBOARD;
-- �۾���(����)
INSERT INTO NOTICEBOARD (NNum, AId, NTitle, NPhoto, NContent, NDate)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin','title',NULL,'content',null);
-- FHit �ϳ� �ø���(1���� ��ȸ�� �ϳ� �ø���)
UPDATE NOTICEBOARD SET NHIT = NHIT +1 WHERE NNum=1;
-- bId�� �� dto����
SELECT N.*, NTitle FROM NOTICEBOARD N, ADMIN A WHERE N.AId=A.AId AND NNum=1;
-- �� �����ϱ�(FId, FTitle, FContent, FILENAME,  FIp, FDATE)
UPDATE NOTICEBOARD SET NTitle = '����',
                    NPhoto = 'MOVIE.JPG',
                    NContent = '����',
                    NDate = NULL
            WHERE NNum = 1;
-- �� �����ϱ�(bId�� �����ϱ�)
DELETE FROM NOTICEBOARD WHERE NNum=3;
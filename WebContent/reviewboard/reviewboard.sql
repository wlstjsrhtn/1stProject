DROP TABLE REVIEWBOARD;
DROP SEQUENCE REVIEWBOARD_SEQ;
CREATE SEQUENCE REVIEWBOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE REVIEWBOARD(
  RNum NUMBER(4) PRIMARY KEY,
  MId VARCHAR2(100) REFERENCES MEMBER(MId),
  RTitle VARCHAR2(100) DEFAULT '��Ÿ',
  RContent VARCHAR2(4000) NOT NULL,
  RFileName VARCHAR2(100),
  RRdate DATE DEFAULT SYSDATE,
  RHit NUMBER(4) DEFAULT 0,
  RGroup NUMBER(4) NOT NULL,
  RStep NUMBER(4) NOT NULL,
  RIndent NUMBER(4) NOT NULL,
  RIp VARCHAR2(100) NOT NULL
);
-- ���̵�����(����)
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
              VALUES(REVIEWBOARD_SEQ.NEXTVAL, 'aaa', '����', '����', NULL, REVIEWBOARD_SEQ.CURRVAL, 0, 0, '192.168.20.44');  
-- ���̵�����(���� 1���ۿ� ���� ù��° �亯��)
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
              VALUES (REVIEWBOARD_SEQ.NEXTVAL, 'aaa','reply','content', null, 1, 1, 1, '192.168.20.31');
select * from fileboard order by fgroup desc, fstep;
-- ���̵����� (���� 1���ۿ� ���� �ι�° �亯��)
--    �亯�� �߰��� STEP a ����
UPDATE REVIEWBOARD SET RStep = RStep+1 
    WHERE RGroup = 1 AND RStep>0;
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
              VALUES (REVIEWBOARD_SEQ.NEXTVAL, 'aaa','reply','content', null, 1, 1, 1, '192.168.20.31');
COMMIT;
-- �۸��(startRow���� endRow����) - �۹�ȣ, �ۼ����̸�, ...
SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE R.MID=M.MID 
                ORDER BY RGROUP DESC, RSTEP; -- ��� ����
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE R.MID=M.MID 
                ORDER BY RGROUP DESC, RSTEP) A)
    WHERE RN BETWEEN 1 AND 11;
-- �۰���
SELECT COUNT(*) FROM REVIEWBOARD;
-- �۾���(����)
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
    VALUES (REVIEWBOARD_SEQ.NEXTVAL, 'bbb','title','content',null, 
        REVIEWBOARD_SEQ.CURRVAL, 0, 0, '192.168.10.151');
-- FHit �ϳ� �ø���(1���� ��ȸ�� �ϳ� �ø���)
UPDATE REVIEWBOARD SET RHIT = RHIT +1 WHERE RNum=1;
-- bId�� �� dto����
SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE M.MID=R.MID AND RNum=1;
-- �� �����ϱ�(FId, FTitle, FContent, FILENAME,  FIp, FDATE)
UPDATE REVIEWBOARD SET RTITLE = '����',
                    RCONTENT = '����',
                    RFILENAME = NULL,
                    RIP = '192.168.151.10',
                    RRDATE = SYSDATE
            WHERE RNum = 1;
-- �� �����ϱ�(bId�� �����ϱ�)
DELETE FROM REVIEWBOARD WHERE RNum=3;
--    �亯�� �߰��� STEP a ����
UPDATE REVIEWBOARD SET RSTEP = RSTEP+1 
    WHERE RGROUP = 1 AND RSTEP>0;
-- �亯�� ����
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
    VALUES (FILEBOARD_SEQ.NEXTVAL, 'bbb','reply','content', null,
        1, 1, 1, '192.168.10.151');
commit;
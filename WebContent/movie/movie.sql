DROP TABLE MOVIE CASCADE CONSTRAINTS;
CREATE TABLE MOVIE(
  MTitle VARCHAR2(100) PRIMARY KEY,
  MPhoto VARCHAR2(30) DEFAULT 'NOIMG.JPG' NOT NULL,
  MStory VARCHAR2(4000) NOT NULL,
  MDName VARCHAR2(100) NOT NULL,
  MActor VARCHAR2(500) NOT NULL,
  MW VARCHAR2(100) DEFAULT 'N',
  MBRanK NUMBER(10) NOT NULL,
  MRdate VARCHAR2(100),
  MHit NUMBER(4) DEFAULT 0
);
-- ��ȭ����Ʈ(����='Y', ����������='N')
SELECT * FROM MOVIE WHERE MW='Y';
-- ��ȭ���
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('�κ������', '�κ������.JPG', '�ٰŸ�', '������', '���', 'Y', '3', '20.02.26');
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('��ũ���ͽ�', '��ũ���ͽ�.JPG', '�ٰŸ�', '������', '���', 'Y', '1', '20.03.11');
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('��Ÿ���', '��Ÿ���.JPG', '�ٰŸ�', '������', '���', 'Y', '2', '18.10.09');
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('����Ʈ�ư�Ÿ', '����Ʈ�ư�Ÿ.JPG', '�ٰŸ�', '������', '���', 'N', '1', '20.03.19');
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('����', '����.JPG', '�ٰŸ�', '������', '���', 'N', '2', '20.03.19');
-- MHit �ϳ� �ø���(1���� ��ȸ�� �ϳ� �ø���)
UPDATE MOVIE SET MHIT = MHIT +1 WHERE MTitle='�κ������';
-- bId�� �� dto����
SELECT M.* FROM MOVIE M WHERE MTitle='�κ������';
-- ��ȭ����
UPDATE MOVIE SET MPhoto='����.JPG', MStory='�ٰŸ�', MDName='������', MActor='���', MBRank='3' WHERE MTitle='����';
-- ��ȭ����
DELETE FROM MOVIE WHERE MTitle='����';
-- ��ȭ��������Ʈ(������)
SELECT * FROM MOVIE ORDER BY MBRank;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM MOVIE ORDER BY MBRank) A) WHERE RN BETWEEN 1 AND 10;
-- ��ȭ��������Ʈ(������)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM MOVIE ORDER BY MBRank) A) WHERE MW='N' AND RN BETWEEN 1 AND 10;
ROLLBACK;
commit;
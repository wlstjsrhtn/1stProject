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
-- 더미데이터(원글)
INSERT INTO NOTICEBOARD(NNum, AId, NTitle, NPhoto, NContent, NDate)
              VALUES(NOTICEBOARD_SEQ.NEXTVAL, 'admin', '제목',NULL, '본문', NULL); 
-- 글목록(startRow부터 endRow까지) - 글번호, 작성자이름, ...
SELECT N.*, NTitle FROM NOTICEBOARD N, ADMIN A WHERE N.AId=A.AId 
                ORDER BY NNum; -- 출력 기준
SELECT * FROM 
    (SELECT ROWNUM RN, C.* FROM 
    (SELECT N.*, AName FROM NOTICEBOARD N, ADMIN A WHERE N.AId=A.AId 
                ORDER BY NNum) C)
    WHERE RN BETWEEN 1 AND 11;
-- 글갯수
SELECT COUNT(*) FROM NOTICEBOARD;
-- 글쓰기(원글)
INSERT INTO NOTICEBOARD (NNum, AId, NTitle, NPhoto, NContent, NDate)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin','title',NULL,'content',null);
-- FHit 하나 올리기(1번글 조회수 하나 올리기)
UPDATE NOTICEBOARD SET NHIT = NHIT +1 WHERE NNum=1;
-- bId로 글 dto보기
SELECT N.*, NTitle FROM NOTICEBOARD N, ADMIN A WHERE N.AId=A.AId AND NNum=1;
-- 글 수정하기(FId, FTitle, FContent, FILENAME,  FIp, FDATE)
UPDATE NOTICEBOARD SET NTitle = '제목',
                    NPhoto = 'MOVIE.JPG',
                    NContent = '본문',
                    NDate = NULL
            WHERE NNum = 1;
-- 글 삭제하기(bId로 삭제하기)
DELETE FROM NOTICEBOARD WHERE NNum=3;
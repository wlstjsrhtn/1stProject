DROP TABLE REVIEWBOARD;
DROP SEQUENCE REVIEWBOARD_SEQ;
CREATE SEQUENCE REVIEWBOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE REVIEWBOARD(
  RNum NUMBER(4) PRIMARY KEY,
  MId VARCHAR2(100) REFERENCES MEMBER(MId),
  RTitle VARCHAR2(100) DEFAULT '기타',
  RContent VARCHAR2(4000) NOT NULL,
  RFileName VARCHAR2(100),
  RRdate DATE DEFAULT SYSDATE,
  RHit NUMBER(4) DEFAULT 0,
  RGroup NUMBER(4) NOT NULL,
  RStep NUMBER(4) NOT NULL,
  RIndent NUMBER(4) NOT NULL,
  RIp VARCHAR2(100) NOT NULL
);
-- 더미데이터(원글)
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
              VALUES(REVIEWBOARD_SEQ.NEXTVAL, 'aaa', '제목', '내용', NULL, REVIEWBOARD_SEQ.CURRVAL, 0, 0, '192.168.20.44');  
-- 더미데이터(위의 1번글에 대한 첫번째 답변글)
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
              VALUES (REVIEWBOARD_SEQ.NEXTVAL, 'aaa','reply','content', null, 1, 1, 1, '192.168.20.31');
select * from fileboard order by fgroup desc, fstep;
-- 더미데이터 (위의 1번글에 대한 두번째 답변글)
--    답변글 추가전 STEP a 수행
UPDATE REVIEWBOARD SET RStep = RStep+1 
    WHERE RGroup = 1 AND RStep>0;
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
              VALUES (REVIEWBOARD_SEQ.NEXTVAL, 'aaa','reply','content', null, 1, 1, 1, '192.168.20.31');
COMMIT;
-- 글목록(startRow부터 endRow까지) - 글번호, 작성자이름, ...
SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE R.MID=M.MID 
                ORDER BY RGROUP DESC, RSTEP; -- 출력 기준
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE R.MID=M.MID 
                ORDER BY RGROUP DESC, RSTEP) A)
    WHERE RN BETWEEN 1 AND 11;
-- 글갯수
SELECT COUNT(*) FROM REVIEWBOARD;
-- 글쓰기(원글)
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
    VALUES (REVIEWBOARD_SEQ.NEXTVAL, 'bbb','title','content',null, 
        REVIEWBOARD_SEQ.CURRVAL, 0, 0, '192.168.10.151');
-- FHit 하나 올리기(1번글 조회수 하나 올리기)
UPDATE REVIEWBOARD SET RHIT = RHIT +1 WHERE RNum=1;
-- bId로 글 dto보기
SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE M.MID=R.MID AND RNum=1;
-- 글 수정하기(FId, FTitle, FContent, FILENAME,  FIp, FDATE)
UPDATE REVIEWBOARD SET RTITLE = '제목',
                    RCONTENT = '본문',
                    RFILENAME = NULL,
                    RIP = '192.168.151.10',
                    RRDATE = SYSDATE
            WHERE RNum = 1;
-- 글 삭제하기(bId로 삭제하기)
DELETE FROM REVIEWBOARD WHERE RNum=3;
--    답변글 추가전 STEP a 수행
UPDATE REVIEWBOARD SET RSTEP = RSTEP+1 
    WHERE RGROUP = 1 AND RSTEP>0;
-- 답변글 쓰기
INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp)
    VALUES (FILEBOARD_SEQ.NEXTVAL, 'bbb','reply','content', null,
        1, 1, 1, '192.168.10.151');
commit;
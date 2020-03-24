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
-- 영화리스트(상영중='Y', 개봉예정작='N')
SELECT * FROM MOVIE WHERE MW='Y';
-- 영화등록
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('인비저블맨', '인비저블맨.JPG', '줄거리', '감독명', '배우', 'Y', '3', '20.02.26');
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('다크워터스', '다크워터스.JPG', '줄거리', '감독명', '배우', 'Y', '1', '20.03.11');
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('스타이즈본', '스타이즈본.JPG', '줄거리', '감독명', '배우', 'Y', '2', '18.10.09');
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('세인트아가타', '세인트아가타.JPG', '줄거리', '감독명', '배우', 'N', '1', '20.03.19');
INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate)
           VALUES('비행', '비행.JPG', '줄거리', '감독명', '배우', 'N', '2', '20.03.19');
-- MHit 하나 올리기(1번글 조회수 하나 올리기)
UPDATE MOVIE SET MHIT = MHIT +1 WHERE MTitle='인비저블맨';
-- bId로 글 dto보기
SELECT M.* FROM MOVIE M WHERE MTitle='인비저블맨';
-- 영화수정
UPDATE MOVIE SET MPhoto='비행.JPG', MStory='줄거리', MDName='감독명', MActor='배우', MBRank='3' WHERE MTitle='비행';
-- 영화삭제
DELETE FROM MOVIE WHERE MTitle='비행';
-- 영화순위리스트(개봉작)
SELECT * FROM MOVIE ORDER BY MBRank;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM MOVIE ORDER BY MBRank) A) WHERE RN BETWEEN 1 AND 10;
-- 영화순위리스트(예정작)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM MOVIE ORDER BY MBRank) A) WHERE MW='N' AND RN BETWEEN 1 AND 10;
ROLLBACK;
commit;
-- 2) 문자열 함수
-- ASCII(아스키코드), CHAR(숫자)
SELECT ASCII('A');
SELECT CHAR(65);

-- BIT_LENGTH(문자열)- BIT 크기, CHAR_LENGTH(문자열) - 문자갯수, LENGTH(문자열) - Byte수
SELECT BIT_LENGTH('abc'), CHAR_LENGTH('abc'), LENGTH('abc');
SELECT BIT_LENGTH('가나다'), CHAR_LENGTH('가나다'), LENGTH('가나다');

-- CONCAT(문자열1, 문자열2, ...)
SELECT name, CONCAT(mobile1, mobile2) 
  FROM usertbl;

-- usertbl에서 mobile1과 mobile2를 하나의 필드로 출력하되 중간에 '-' 삽입
SELECT name, CONCAT_WS('-', mobile1, mobile2) 
  FROM usertbl;

--  INSTR(문자열, 검색어)
SELECT INSTR('APPLE BANANA ORANGE', 'PPL');

-- FORMAT(숫자, 소수점 자릿수)
SELECT FORMAT(123456.123456, 3);

-- INSERT(기준 문자열, 위치, 길이만큼 삭제, 삽입할 문자열) -- 길이만큼 삭제함
SELECT INSERT ('abcdefghi', 3, 4, '@@@@'), INSERT('abcdefghi', 3, 2, '@@@@');

-- LEFT(문자열, 길이), RIGHT(문자열, 길이)
SELECT LEFT('abcdefghi', 3), RIGHT('abcdefghi', 3);

-- UPPER(문자열), LOWER(문자열)
SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH');

-- LPAD(문자열, 길이, 채울 문자열), RPAD(문자열, 길이, 채울 문자열)
SELECT LPAD('START', 8, '##'), RPAD('END', 6, '##');

-- LTRIM, RTRIM, TRIM : 공백제거
SELECT LTRIM('  TEST  '), RTRIM('    TEST   '), TRIM('   TEST   ');

-- REPEAT(문자열, 횟수) : 문자열 반복
SELECT REPEAT('ABC', 3);

-- REPLACE(문자열, 원래 문자열, 바꿀 문자열)
SELECT REPLACE('이것이 MariaDB', '이것이', 'This Is');
SELECT name, REPLACE(mobile1, mobile1, '010'), mobile2 FROM userTBL;

-- REVERSE(문자열) : 순서 바꾸기
SELECT REVERSE('1234598765');
SELECT REVERSE(name) FROM userTBL;

-- SPACE(길이) : 공백 출력
SELECT CONCAT('A',SPACE(5),'B');

-- SUBSTRING(문자열, 시작위치, 길이)
SELECT IFNULL(SUBSTRING(mobile2, 1, 4), '-')
  FROM usertbl;

-- SUBSTRING_INDEX(문자열, 구분자, 횟수) : 구분자가 해당 횟수에 나오면 그 이후는 버림
SELECT SUBSTRING_INDEX('www.naver.com', '.', 2),
       SUBSTRING_INDEX('www.naver.com/abc/def/', '/', 1);


-- 3) 수학 함수
-- ABS(숫자) : 절대값 반환
SELECT ABS(-100);

-- 삼각함수 : SIN(숫자), COS(숫자), TAN(숫자), ACOS(숫자), ASIN(숫자), ATAN(숫자)

-- CEIL(숫자) : 올림, FLOOR(숫자) : 내림, ROUND(숫자) : 반올림
SELECT CEIL(4.7), FLOOR(4.7), ROUND(4.7222, 2);

-- MOD(숫자1, 숫자2) : 숫자1을 숫자2로 나눈 나머지 값 반환
SELECT MOD(15, 4) ;

-- POW(숫자1, 숫자2) : 제곱, SQRT(숫자) : 제곱근
SELECT POW(2,3), SQRT(9);

-- RAND() : 0이상 1 미만의 실수를 구함
SELECT RAND();

-- TRUNCATE(숫자, 정수) : 소숫점의 정수까지만 유지
SELECT TRUNCATE(12345.1234, 2);

-- 4) 날짜 및 시간함수
-- ADDDATE(날짜, 차이), SUBDATE(날짜, 차이) : 날짜 기준 차이를 더하거나 뺀 날짜 반환
SELECT mdate, ADDDATE(mdate, 10), ADDDATE(mdate, interval 1 month), ADDDATE(mdate, interval 1 year)
  FROM usertbl;

SELECT mdate, SUBDATE(mdate, 10), SUBDATE(mdate, interval 1 month), SUBDATE(mdate, interval 1 year)
  FROM usertbl;

-- ADDTIME(날짜/시간, 시간), SUBTIME(날짜/시간, 시간)
SELECT now(), ADDTIME(now(), '1:1:1'), SUBTIME(now(), '1:1:1');

-- CURDATE() : 연-월-일, CURTIME() : 시-분-초, NOW(), SYSDATE() : 연-월-일 시:분:초
SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

-- YEAR, MONTH, DAY, HOUR, MINUTE, SECOND, MICROSECOND
-- 날짜 또는 시간에서 연, 월, 일, 시, 분, 초, 밀리초 구하는 함수
SELECT NOW(), YEAR(NOW()), MONTH(NOW()), DAY(NOW()), HOUR(NOW()), MINUTE(NOW()), SECOND(NOW()), MICROSECOND(NOW());

-- DATE(), TIME()
-- DATETIME 형식에서 연-월-일 및 시:분:초만 추출
SELECT NOW(), DATE(NOW()), TIME(NOW());

-- DATEDIFF(날짜1, 날짜2), TIMEDIFF(시간1, 시간2)
SELECT DATEDIFF(NOW(), '2022-01-01'), TIMEDIFF(CURTIME(), '12:10:10')

-- DAYOFWEEK(날짜), MONTHNAME(), DAYOFYEAR(날짜)
-- 현재요일, 월 이름, 1년 중 몇 번째 날인지
SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

-- LAST_DAY(날짜)
-- 주어진 날짜의 마지막 날짜 구하기
SELECT LAST_DAY('2022-11-01');

-- MAKEDATE(연도, 정수)
-- 연도에서 정수만큼 지난 날짜 구하기
SELECT MAKEDATE('2022', 50);

-- MAKETIME(시, 분, 초)
-- '시:분:초'의 TIME 형식을 만든다
SELECT MAKETIME(10,11,12);

-- PERIOD_ADD(연월, 개월수) : 연월 + 개월수, PERIOD_DIFF(연월1, 연월2) : 연월1 - 연월2
-- 연월은 YYYY, YYYYMM 형식 사용
SELECT PERIOD_ADD(202209,2), PERIOD_DIFF(202209, 201905);

-- QUARTER(날짜)
-- 날짜가 4분기중 몇 분기인지 반환
SELECT QUARTER(NOW());

-- TIME_TO_SEC(시간)
-- 시간을 초 단위로 구함
SELECT TIME_TO_SEC(CURTIME());

-- 5) 시스템정보 함수
-- USER(), DATABASE()
SELECT USER(), DATABASE();

-- FOUND_ROWS()
SELECT * FROM userTBL;
SELECT FOUND_ROWS();

-- ROW_COUNT()
UPDATE buyTBL SET price = price * 2;
SELECT ROW_COUNT();

-- VERSION()
SELECT VERSION();

-- SLEEP(초)
SELECT SLEEP(5);
SELECT * FROM userTBL;













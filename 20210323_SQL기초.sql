drop table sungjuk;
create table sungjuk(
    uname varchar(50) not null  
    ,kor int          not null
    ,eng int        not null
    ,mat int        not null
    ,tot int        null --빈값 허용
    ,aver int       --null 생략가능
    );
    insert into sungjuk(uname, kor, eng, mat)
values ('홍길동', 70, 85, 100);

insert into sungjuk(uname,kor,eng,mat)
values ('무궁화',30,30,40);

insert into sungjuk(uname,kor,eng,mat)
values ('진달래',90,90,20);

insert into sungjuk(uname,kor,eng,mat)
values ('개나리',100,60,30);

insert into sungjuk(uname,kor,eng,mat)
values ('라일락',30,80,40);
insert into sungjuk(uname,kor,eng,mat)
values ('봉선화',80,80,20);

insert into sungjuk(uname,kor,eng,mat)
values ('대한민국',10,65,35);

insert into sungjuk(uname,kor,eng,mat)
values ('해바라기',30,80,40);

insert into sungjuk(uname,kor,eng,mat)
values ('나팔꽃',30,80,20);

insert into sungjuk(uname,kor,eng,mat)
values ('대한민국',100,100,100);

select * from sungjuk;
commit;
select kor as korea, eng as english, mat as math from sungjuk;
select max(kor), max(uname) as name from sungjuk;

-- 오라클 내장 함수 : max, min, sum, avg 등
select count(eng) as english from sungjuk;
select avg(mat) as 수학평균 from sungjuk; --임시 칼럼명으로 이름도 가능
select count(uname) as 이름, max(uname)  from sungjuk group by uname;

select count(aver) from sungjuk; --null값은 카운트하지 않음. //0
--문1) 국어 점수가 50이상 행을 조회하시오

select * from sungjuk where kor >= 50;

--문2) 영어점수가 50점 미만 행을 조회하시오
select * from sungjuk where eng< 50;
--문3) 이름이 '대한민국' 행을 조회(출력)하시오
select * from sungjuk where uname ='대한민국'; --문자열데이터는 작은따옴표. 띄어쓰기도 포함되니 주의

--문4) 이름이 '대한민국' 아닌 행을 조회하시오
select * from sungjuk where uname != '대한민국';
select * from sungjuk where uname not like '대한민국';
select * from sungjuk where uname <> '대한민국';
select * from sungjuk where not uname = '대한민국'; 

--문5) 국어, 영어, 수학 세과목의 점수가 모두 90이상 행을 조회하시오
select *from sungjuk where kor>=90 and eng>= 90 and mat>=90; 
--문6) 국어, 영어, 수학 중에서 한과목이라도 40미만 행을 조회하시오
select *from sungjuk where kor<40 or eng<40 or mat<40; 
    -- select 할때 내가 부른 칼럼명대로 가져옴
    
--문7) 국어점수가 80~89점 사이 행을 조회하시오
select * from sungjuk where kor between 80 and 89;
    --and 연산자 쓰면 =을 해준다.. 주의하기
select * from sungjuk where kor>=80 and kor<=89;
--문8) 이름이 '무궁화', '봉선화'를 조회하시오
select * from sungjuk where uname in('봉선화', '무궁화');
select * from sungjuk where uname = '봉선화' or uname = '무궁화';

[LIKE 연산자]
- 문자열 데이터에서 비슷한 유형을 검색할 때
- 글자갯수 상관없음 %
- 글자갯수 일치 필요 _

--문 9)이름에서 '홍'으로 시작하는 이름을 조회하시오
select * from sungjuk where uname like '홍%';
--문10)이름에서 '화'로 끝나는 이름을 조회하시오
select * from sungjuk where uname like '%화';
select uname as 이름
from sungjuk 
where uname like '%화';
--문11)이름에 '나'글자 있는 이름을 조회하시오
select * from sungjuk where uname like '%나%';

--연습
where subject like '%trim%';
--trim을 변수처리해서 검색조회

--문12)두글자 이름에서 '화'로 끝나는 이름을 조회하시오
select * from sungjuk where uname like '_화';

select * from sungjuk;

select uname as 이름 from sungjuk where uname like '_나_';
--연습문제
select * from
from board
where subject like '%happy%' or content like '%happy%';

[sort정렬]
- 오름차순 asc, 생략가능, 기본값. 1->10 A->Z a->z
- 내림차순 desc
- 1차정렬 후에도 n차정렬 가능!!
- 형식) order by 컬럼1, 컬럼2, 컬럼3,..
- 원하는 데이터 가공후 -> 맨 마지막에 보기좋게끔 정렬해주는 역할. 

-- 전체 레코드를 이름순으로 정렬해서 조회하시오
select * 
from sungjuk
order by uname asc; --오름차순 정렬, 가나다순, asc생략가능

select *
from sungjuk
order by kor;

-- 1차정렬 : 국어 점수 asc
-- 2차정렬 : 국어 점수가 같다면 -> 이름을 기준으로 내림차순 정렬
select * 
from sungjuk
order by kor, uname desc;
select *
from sungjuk 
order by kor, eng, mat;

--문13) 국어 점수가 50점이상인 행에 대해서 총점과 평균을 구하시오
select
kor+mat+eng as 총점 , round((kor+mat+eng)/3) as 평균 
from sungjuk
where kor >=50;
commit;
update sungjuk
set tot = kor+ mat+ eng , aver = (kor+mat+eng)/3 
where kor >= 50;
select * from sungjuk;
select * from sungjuk order by uname;
select * from sungjuk order by kor desc;

--문14) 평균 70점 이상 행을 이름순으로 조회하시오
select *
from sungjuk
where aver >= 70 
order by uname;

select *
from sungjuk 
where (kor+mat+eng)/3 >= 70 order by uname;

select count(*) 
from sungjuk 
where tot is null;

select *
from sungjuk 
where aver is not null;

select *
from sungjuk
where not aver is null 
order by uname;
--문15) 비어있는 총점과 평균을 모두 구하시오
select *
from sungjuk
where tot is null and aver is null;

update sungjuk
set
tot = eng+kor+mat , aver = (eng+kor+mat)/3
where tot is null and aver is null;

select * from sungjuk;

[alter] 
- 테이블의 구조 수정 및 변경
1. 컬럼추가
형식) alter table table명 add ( 컬럼명 데이터타입);

--music컬럼 추가
alter table sungjuk add (music int null);

2. 컬럼명 수정
형식 ) alter table 테이블명 rename column 컬럼명 to 바꿀컬럼명;

alter table sungjuk rename column kor to korea;

3. 컬럼 데이터 타입 수정
형식) alter table 테이블명 modify (컬럼명 데이터타입);
--music 컬럼 자료형을 varchar로 수정
alter table sungjuk modify ( music varchar(5));
desc sungjuk;

4. 컬럼 삭제
형식 ) alter table 테이블명 drop (컬럼명);
    alter table 테이블명 drop column 컬럼명;
alter table sungjuk drop column music;
desc sungjuk;

[as]
- 칼럼명 임시 변경 및 부여
select count (*) from sungjuk;
select count (*) as cnt from sungjuk;
select count (*) cnt from sungjuk;

[commit 과 rollback]
commit;
select * from sungjuk;
rollback;
delete from sungjuk where korea >= 50;

[between]
A부터 B까지
select 
*
from sungjuk
where korea between 80 and 89;

[in]
문자열 목록에서 찾기
select *
from sungjuk
where uname in('봉선화', '무궁화');

select * from sungjuk;
select *
from sungjuk
where not (korea = 100 and eng = 100 and mat = 100);

ㄴ
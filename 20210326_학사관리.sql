create table tb_student(
   hakno    char(5)      not null
  ,uname    varchar(50)  not null
  ,email    varchar(100) unique
  ,address  varchar(100) not null
  ,phone    varchar(20)
  ,regdt    date         default sysdate
  ,primary key(hakno)
);
create table tb_gwamok(
   gcode    char(4)       not null
  ,gname    varchar(100)  not null
  ,ghakjum  number(2)     default 1
  ,regdt    date          default sysdate
  ,primary key(gcode)
);

create table tb_sugang(
   sno    number     not null
  ,hakno  char(5)    not null
  ,gcode  char(4)    not null
  ,primary key(sno)
);

create sequence sugang_seq;
insert into tb_student(hakno,uname,address,phone,email)
values('g1001','홍길동','서울','111-5558','11@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1002','홍길동','제주','787-8877','33@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1003','개나리','서울','554-9632','77@naver.com');
insert into tb_student(hakno,uname,address,phone,email)
values('g1004','홍길동','부산','555-8844','88@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1005','진달래','서울','544-6996','33@nate.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1006','개나리','제주','777-1000','66@naver.com');
insert into tb_gwamok(gcode,gname,ghakjum)
values('p001','OOP',3);

insert into tb_gwamok(gcode,gname,ghakjum)
values('p002','Oracle',3);

insert into tb_gwamok(gcode,gname,ghakjum)
values('p003','JSP',2);

insert into tb_gwamok(gcode,gname,ghakjum)
values('d001','웹표준',1);
insert into tb_gwamok(gcode,gname,ghakjum)
values('d002','포토샵',5);

insert into tb_gwamok(gcode,gname,ghakjum)
values('d003','플래시',3);

insert into tb_gwamok(gcode,gname,ghakjum)
values('p004','MVC',3);

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1001','p001');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1002','p002');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1002','p001');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1001','p003');
insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1005','d001');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1005','d002');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1001','d001');

select count(*) from tb_student;
select count(*) from tb_gwamok;
select count(*) from tb_sugang;
commit;

문1)학생테이블에서 지역별 인원수를 인원수순으로 조회하시오

select* from tb_student;
select address, count(*) 인원수
from tb_student
group by address
order by count(*) ;

문2)학생테이블에서 동명이인이 각 몇명인지 조회하시오

select * from tb_student;
select count(distinct uname) from tb_student;

select uname, count(*)
from tb_student
group by uname;

select a.*
from tb_student as a, tb_student as b;

select a.*
from tb_student a
self join tb_student b 
on a.uname = b.uname;

문3)학생테이블의 학번, 이름, 주소를 조회하시오 (주소는 영문으로 출력)

select hakno, uname, 
    case when address = '서울' then 'seoul'
        when address='제주' then 'jeju'
        when address='부산' then 'busan'
    end as address
from tb_student;

문4)학생테이블에서 주소별 인원수가 3명미만 행을 조회하시오
select *
from tb_student
order by address
;

select count(*), address
from tb_student
group by address;

select count(*), address
from tb_student
group by address
having count(address)<3;

commit;

//////////////////////////////////////////////////////////////////////////

--구분코드 생성 예시 : 주로 영문자 + 숫자 조합. 한글은 X(통계내기 어려움)
--예) 과목코드 : 프로그래밍 p~~~, 디자인 d~~,  건축 c~~~
--예) 전임강사 / 시간강사 / 조교... 
--예) 과일나라 쇼핑몰 : 사과 apple100 .. / 오렌지 orange101.../ 바나나/...

문5) 과목테이블에서 프로그램 교과목 조회
select *
from tb_gwamok
where gcode like 'p%';
select * from tb_gwamok;

문6) 과목테이블에서 디자인 교과목 중 3학점만 조회
select *
from tb_gwamok
where gcode like 'd%' and ghakjum =3;

문제7) 과목테이블에서 프로그램 교과목의 학점 평균보다 낮은 프로그램 교과목 조회

select * from tb_gwamok;

select  *
from tb_gwamok 
where ghakjum< (select  
avg(ghakjum)
from tb_gwamok                                                                         
where gcode like 'p%')
and gcode like 'p%';

select 
avg(ghakjum)
from tb_gwamok
where gcode like 'p%'; 

////////////////////////////////////////////////////////////////////////
[테이블 조인]
-형식)
    from 테이블1 join 테이블2 on 조건절 ; --표준SQL(ANSI)
    
    FROM 테이블1, 테이블2 ON 조건절; -- ORACLE DB
    
    SELECT T1.*,T2.*,T3.*
    FROM T1 JOIN T2
    ON T1.X=T2.X
    JOIN T3 
    ON T1.Y = T3.Y--3개조인
    
    SELECT *
    FROM T1 JOIN T2
    ON T1.X = T2.X JOIN T3
    ON T1.Y = T3.Y JOIN T4
    ON T1.Z = T4.Z; --4개조인
    
- 조건절 : WHERE, HAVING( GROUP BY 와 함께 ), ON (JOIN과 함께)
- 물리적 테이블 : 실제로 DB에 CREATE 한 테이블
- 논리적 테이블 : SQL문에 의해 가공된 테이블. 보여주기용 

물리적 테이블과 논리적 테이블은 서로 동등한 관계

--학번을 기준으로 수강테이블과 학생테이블을 조인하기

SELECT * FROM TB_SUGANG;

SELECT *
FROM TB_STUDENT ST
JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO;
--INNER라는 말은 생략 가능. 가장 기본형
--HAKNO 라는 컬럼의 이름이 같아서 HAKNO_1하는 식으로 알아서 바뀌어 나오고 있음

SELECT *
FROM TB_STUDENT ST
LEFT JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO;

SELECT ST.*, SG.*
FROM TB_STUDENT ST
JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO;

SELECT ST.*, SG.GCODE, SG.SNO
FROM TB_STUDENT ST
JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO;

SELECT *
FROM TB_STUDENT ST
JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO
JOIN TB_GWAMOK GM ON SG.GCODE = GM.GCODE;

SELECT SG.*, gm.ghakjum,gm.gname,gm.regdt
FROM TB_SUGANG SG
JOIN TB_GWAMOK  GM ON SG.GCODE = GM.GCODE;

--조회할 때 테이블간에 중복되지 않는 컬럼명은 테이블명을 생략할 수 있다. 
SELECT SG.*, ghakjum, gname, regdt
FROM TB_SUGANG SG
JOIN TB_GWAMOK  GM ON SG.GCODE = GM.GCODE;

문1)수강신청을 한 학생들 중에서 '제주'에 사는 학생들만 학번, 이름, 주소를 조회하시오

SELECT * FROM TB_STUDENT;

SELECT HAKNO, UNAME, ADDRESS
FROM TB_STUDENT
WHERE ADDRESS = '제주';

--어느 테이블을 기준으로 잡을것인가..

SELECT ADDRESS,SG.HAKNO,UNAME
FROM TB_SUGANG SG JOIN TB_STUDENT ST
                ON SG.HAKNO = ST.HAKNO
                WHERE ADDRESS = '제주';
                
SELECT A.ADDRESS, A.HAKNO, A.UNAME               
FROM(
SELECT ADDRESS,SG.HAKNO,UNAME
FROM TB_SUGANG SG JOIN TB_STUDENT ST
                ON SG.HAKNO = ST.HAKNO) A
WHERE A.ADDRESS = '제주';

문2)지역별로 수강신청 인원수, 지역을 조회하시오
     서울 2명
     제주 1명
     
SELECT * FROM TB_SUGANG SU
JOIN TB_STUDENT ST ON SU.HAKNO = ST.HAKNO
;     

SELECT COUNT(SU.HAKNO), MAX(ST.UNAME) FROM TB_SUGANG SU
GROUP BY SU.HAKNO
JOIN TB_STUDENT ST ON SU.HAKNO = ST.HAKNO; 


SELECT HAKNO , COUNT(HAKNO)
FROM TB_SUGANG
GROUP BY HAKNO; 

SELECT A.HAKNO,TB_STUDENT.ADDRESS,TB_STUDENT.UNAME
FROM
(SELECT HAKNO , COUNT(HAKNO)
FROM TB_SUGANG
GROUP BY HAKNO) A JOIN TB_STUDENT 
ON TB_STUDENT.HAKNO = A.HAKNO;

--한 학생이 수강신청을 여러개 할 수 있으므로 -> 학생별로 그룹핑해서 한개 레코드씩으로 묶고.
--묶은 그 학생의 정보를 학생테이블과 조인해서 가져온다 

SELECT B.ADDRESS, COUNT(*) FROM
(SELECT A.HAKNO,TB_STUDENT.ADDRESS ,TB_STUDENT.UNAME FROM
(SELECT HAKNO , COUNT(HAKNO) FROM TB_SUGANG GROUP BY HAKNO) A 
    JOIN TB_STUDENT ON TB_STUDENT.HAKNO = A.HAKNO) B
    GROUP BY B.ADDRESS;

SELECT COUNT(ADDRESS)수강인원, ADDRESS 주소 
FROM TB_SUGANG SG
    JOIN TB_STUDENT  ST ON SG.HAKNO= ST.HAKNO
    GROUP BY ADDRESS; 
        
문3)과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
     d001 웹표준 2명 
     d002 포토샵 1명
     p001 OOP   2명
     
SELECT * FROM TB_GWAMOK;

SELECT GCODE, COUNT(GCODE)
FROM TB_SUGANG
GROUP BY GCODE;

SELECT GM.GCODE 과목코드, COUNT(GM.GCODE)||'명'수강인원, MAX(GM.GNAME) 과목명
FROM TB_SUGANG SG
JOIN TB_STUDENT ST ON SG.HAKNO = ST.HAKNO
JOIN TB_GWAMOK GM ON GM.GCODE = SG.GCODE
GROUP BY GM.GCODE;

문4) 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
     g1001  홍길동  6
     g1002  홍길동  6
     g1005  진달래  6
     
SELECT * FROM TB_SUGANG ;

SELECT * FROM TB_STUDENT ST JOIN TB_SUGANG SG ON sg.hakno = st.hakno
                            JOIN TB_GWAMOK GM ON sg.GCODE = GM.GCODE 
                            ;
SELECT * FROM TB_GWAMOK;

----------------------답-------------------------------------------
SELECT SG.HAKNO ,SUM(GM.GHAKJUM),MAX(ST.UNAME) FROM TB_STUDENT ST 
                            JOIN TB_SUGANG SG ON sg.hakno = st.hakno
                            JOIN TB_GWAMOK GM ON sg.GCODE = GM.GCODE 
                            GROUP BY SG.HAKNO
                            ORDER BY sg.hakno;
                            
SELECT SG.HAKNO, COUNT(*) FROM TB_SUGANG SG JOIN TB_STUDENT ST ON sg.hakno = st.hakno
GROUP BY SG.HAKNO;
문5) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
     g1001  p001  OOP
     g1001  p003  JSP  
     g1001  d001  웹표준
---------------------------------------답-------------
SELECT  A.HAKNO,A.GCODE, B.GNAME FROM     
(SELECT * FROM TB_SUGANG WHERE HAKNO = 'g1001') A 
JOIN TB_GWAMOK B ON A.GCODE = B.GCODE;

     
     
문6)수강신청을 한 학생들의 학번, 이름 조회
----------------------------------------------답
SELECT A.HAKNO, B.UNAME FROM
(SELECT HAKNO FROM TB_SUGANG 
GROUP BY HAKNO) A JOIN TB_STUDENT B ON A.HAKNO = B.HAKNO ;

     
문7)수강신청을 하지 않은 학생들의 학번, 이름 조회
SELECT SUB.HAKNO, SUB.UNAME FROM(
SELECT * FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO) AS SUB
;

SELECT A.UNAME, A.HAKNO FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO
WHERE B.SNO IS NULL;

SELECT SUB.* FROM (
SELECT * FROM(
SELECT * FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO)
WHERE SNO IS NULL ) SUB;

-----------------------------------답
SELECT A.UNAME, A.HAKNO FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO
WHERE B.SNO IS NULL;
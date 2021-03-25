create table emp(
  empno       number(4)     --사번(-9999~9999)
  ,ename      varchar2(10)  --이름
  ,job        varchar2(9)   --직급
  ,mgr        number(4)     --매니저정보
  ,hiredate   date          --입사일
  ,sal        number(7,2)   --급여(소수점 2자리)
  ,comm       number(7,2)   --커미션(보너스)
  ,deptno     number(2)     --부서코드(-99~99)
);
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '개나리', '사원', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '진달래', '주임', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '라일락', '주임', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '손흥민', '과장', 7839, '2002-01-11', 400, 30);
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '박지성', '주임', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '김연아', '사원', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '무궁화', '사원', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, '홍길동', '부장', 7566, '2006-06-17', 450, 20);

select * from emp;
commit;

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '송강호', '과장', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '정우성', '대표', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '김혜수', '사원', 7902, '2001-12-03', 200, 20);

전체 행 개수 조회
select count(*) from emp;

drop table emp;
create table emp(
  empno       number(4)     primary key --사번(-9999~9999)
  ,ename      varchar2(50)              --이름
  ,job        varchar2(10)              --직급
  ,mgr        number(4)                 --매니저정보
  ,hiredate   date                      --입사일
  ,sal        number(7,2)               --급여(소수점 2자리)
  ,comm       number(7,2)               --커미션(보너스)
  ,deptno     number(2)                 --부서코드(-99~99)
);

문4) 테이블의 칼럼(필드) 목록을 확인하시오

select * from emp;

문5) 사원이름순(오름차순) 정렬하시오
select *
from emp
order by ename; 

문6) 사원이름순(내림차순) 정렬하시오
select *
from emp
order by ename desc; 

문7) 급여 내림차순으로 사원이름(ename), 급여(sal), 부서코드(deptno)를 조회하시오
select ename, sal, deptno
from emp 
order by sal desc;

문8) 부서코드 오름차순, 급여 내림차순으로
     사원이름(ename), 급여(sal), 부서코드(deptno)를 조회하시오

select ename, sal, deptno
from emp
order by deptno , sal desc;

문9) 이름(ename)/입사일자(hiredate)/부서코드(deptno)를
      부서코드 오름차순, 입사일자(hiredate) 오름차순으로 조회하시오
select ename, hiredate, deptno
from emp
order by deptno, hiredate ;

문10) 직급(job) 칼럼의 중복데이터를 하나씩만 조회하시오
select distinct job
from emp;
문11) emp테이블의 job 오름차순, sal 내림차순으로 정렬해서
      ename 이름, job 직급, sal 급여 칼럼명으로 별칭을 바꿔서 조회하시오
select ename 이름, job 직급, sal 급여
from emp
order by job, sal desc;

문12) 이름(ename)/입사일자(hiredate)/부서코드(deptno)를
      부서코드 오름차순, 입사일자(hiredate) 오름차순으로 조회하시오
select ename, hiredate, deptno
from emp
order by deptno , hiredate ;

문13) 직급(job) 칼럼의 중복데이터를 하나씩만 조회하시오

select distinct job from emp;
문14) emp테이블의 job 오름차순, sal 내림차순으로 정렬해서
      ename 이름, job 직급, sal 급여 칼럼명으로 별칭을 바꿔서 조회하시오
select ename 이름, job 직급, sal 급여      
from emp
order by job, sal desc;


문15) 부서코드(deptno)가 30인 직원을 조회하시오
select *
from emp
where deptno = 30;

문16) 중복된 부서코드를 한개씩만 조회하시오
select distinct deptno from emp;

문12) 급여가 100보다 많고 400보다 작은 직원 조회하기(급여 내림차순)
select *
from emp
where sal >100 and sal<400
order by sal desc;

문13) 급여가 100이하 또는 400 이상의 직원 검색하기(급여 내림차순)
select *
from emp
where sal <=100 or sal>=400
order by sal desc;

문14) 직급(job)이 과장 또는 부장인 직원들을 이름순으로 조회하시오

select *
from emp
where job in('과장', '부장')
order by ename;

문17) 부서코드가 10 또는 20 또는 30인 직원을 조회하시오
      (or, in연산자 각각 활용해서 조회)
select *
from emp
where deptno in(10,20,30);



문18) 급여가 300~500인 직원을 급여순으로 조회하시오
      (and, between연산자 각각 활용해서 조회)
select *
from emp
where sal between 300 and 500;

문19) 이름이 무궁화 조회하시오

select * from emp where ename = '무궁화';

문20) 김씨성을 조회하시오

select * from emp where ename like '김%';
select * from emp;

문21) 이름에 '화' 포함된 줄을 조회하시오

select * from emp where ename like '%화%';

문22) 부서코드가 20인 레코드에 대해서
      급여의 1%를 커미션으로 책정하시오
update emp set comm = sal*0.01
where deptno =20;

select * from emp;
문23) 연봉을 아래와 같이 구한후 이름, 급여, 커미션, 연봉을 조회하시오
      연봉구하는 식 : 급여(sal)*12개월+보너스(comm)

select (sal*12)+comm 연봉, ename, sal, comm
from emp;

문24) 커미션이 null이면 0으로 바꾼후 연봉을 다시 계산해서
      이름, 급여, 커미션, 연봉을 조회하시오

select (sal*12)+nvl(comm,0) 연봉, ename, sal, nvl(comm,0)
from emp;

문25) 각 사람의 급여를 검색해서 '누구누구의 급여는 얼마입니다'로 조회하시오
      (|| 결합연산자)
      
select ename||'의 급여는 '||sal||'만원 입니다' as result     
from emp;

문26) emp테이블에서 입사일(hiredate)이 2005년 1월 1일 이전인 사원에 대해
      사원의 이름(ename), 입사일, 부서번호(deptno)를 입사일순으로 조회하시오
select ename, hiredate, deptno
from emp
where hiredate<TO_DATE('2005-01-01');

select ename, hiredate, deptno
from emp
where hiredate<'2005-01-01';
--날짜 데이터는 ''안에 넣으면 된당!
문27) emp테이블에서 부서번호가 20번이나 30번인 부서에 속한
     사원들에 대하여 이름, 직업코드(job), 부서번호를 이름순으로 조회하시오
     (or, in연산자 각각 활용해서 모두 조회)
     
select ename, job, deptno
from emp
where deptno in(20, 30)
order by ename;

문28) 사번, 이름, 부서를 조회하시오
      (단, 부서코드가 10이면 관리부
                      20이면 영업부
                      30이면 교육부로 바꿔서 출력)
                      
select * from emp;

select empno, ename, 
    case when deptno = 10 then '관리부'
        when deptno = 20 then '영업부'
        when deptno = 30 then '교육부'
    end as dept
from emp;

문제29) 다음의 SQL문을 분석하시오
      select empno, sal from emp
      where not(sal>200 and sal<300)
      order by sal;

문제30) 다음의 SQL문을 분석하시오
      select empno, sal from emp
      where not sal>200 and sal<300 
      order by sal;
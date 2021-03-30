
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
   SELECT
       sub.hakno,sub.hap,max(st.uname)
   FROM                         
(SELECT sg.hakno,sum(gm.ghakjum) hap FROM TB_SUGANG SG 
                JOIN TB_GWAMOK GM ON sg.GCODE = GM.GCODE
                group by sg.hakno) sub join TB_STUDENT ST on sg.hakno = st.hakno
;


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



/////////////////////////////////////////////////////////////////////
[다양한 조인~]
- inner join : 두 테이블에 공통으로 존재하는 컬럼. inner는 생략가능( 교집합)
- left outer join : 왼쪽테이블 전부 + 공통존재 데이터 추출.
- right outer  join : 오른쪽테이블 전부 + 공통으로 존재하는 데이터 추출.

[left join]
학생 테이블의 모든 행을 가져오고 + 수강테이블에서 학번이 일치하는 행만 가져오기. 
select * from tb_sugang a
where a.hakno in
(select hakno
from tb_student) ;

select hakno
from tb_student;

문8) left 조인을 써서 수강신청 하지 않은 학번, 이름, 과목코드 조회
select s.hakno, s.uname from tb_student s where s.hakno in (
select hakno from tb_sugang);

/////////////////////////////////////////////////////////////////////////
[+ 연산자를 이용한 조인]
 - + 연산자를 이용해서 left,right join이 가능하다
 - + 기호는 일치되지 않는 행이 존재하지 않는 쪽에 붙인다..
 
 문제10) 수강신청을 하지 않은 학번, 이름, 과목코드 조회
select *
 from tb_student ST, tb_sugang SU
 where ST.hakno SU.hakno(+);
 
 -- null 값인 것도 다 나온다!! 
 --sugang 테이블에 없는 student 도 다 나온다. left join 같은 효과. 실무에서는 글쎄?
 --즉 +를 이용해서 조인과 같은 테이블 만들기 가능. 뭐 이런것도 있다 정도만. 
 
 문제10) 프로그램 교과목중에서 과목별로 수강신청한 인원수를 구하여 아래와 같이 출력하시오
 
 p001 OOP 2
 p002 Oracle 1
 --------------------------------------------------------답----------
 select su.gcode, gw.gname , count(gw.gname) 수강인원 from tb_sugang su 
    join tb_gwamok gw on su.gcode = gw.gcode
    where su.gcode like 'p%'
    group by su.gcode, gw.gname
    order by su.gcode;
    
-----------------------------------------------------------------------

 
 문제11) OOP교과목을 신청한 학생들의 학번과 이름출력
 p001 OOP g1001 홍길동
--------------------------------------------------------답------
 select gcode, gname, st.hakno, uname from 
 (select su.gcode,hakno,gname from tb_sugang su 
    join tb_gwamok gw on su.gcode = gw.gcode 
    where gw.gname = 'OOP') A JOIN tb_student st on A.hakno= st.hakno;

////////////////////////////////////////////////////////////////////////
[rownum]: 행번호! 
select hakno, uname, rownum from tb_student;
--행번호에 별칭 부여하기
select hakno, uname, rownum rn from tb_student;
--행번호로 정렬하기
select hakno, uname, rownum from tb_student
order by rownum desc;

--이름으로 정렬하기 : 행번호가 먼저 부여되고 -> 정렬된다. order by는 select한 후에 하므로!
select hakno, uname, rownum from tb_student
order by uname;

select hakno, uname, rownum rn from tb_student 
where rownum< 4;
--where 먼저하고 select 하므로 rn이라는 alias를 where 에서 쓸수없다.. 

select hakno, uname, rownum rn from tb_student
where rownum between 1 and 3;

--rownum칼럼은 셀프조인후에 행번호 추가하고 조건절로 활용한다
select hakno, uname, rownum, rn
from(
select hakno, uname, rownum rn from tb_student)
where rn >3;

////////////////////////////////////////////////////
문제12) 과목테이블에서 과목이름을 내림차순 정렬 후, 행번호 4~6번 사이만 조회하시오
select * from (
select gcode, gname,rownum rn from tb_gwamok)
where rn between 4 and 6;
select * from(
select gcode, gname,rownum rn from tb_gwamok)
order by gname desc;

-----------------------------------------------------------
select * from(
select a.*, rownum rn from(
select gcode, gname from tb_gwamok order by gname desc) a) 
where rn >4
;

////////////////////////////////////////////////////////////////
문제13) 학번별 수강신청한 총학점을 구하고, 학번별 정렬해서 행번호 4~6만 조회하시오
단, 수강신청을 하지않은 학생의 총학점도 0으로 표시
select * from (
select a.*,rownum rn from( 
select st.hakno,sum(nvl(gw.ghakjum,0)) 총학점
        from tb_sugang su join tb_gwamok  gw on su.gcode = gw.gcode
                right outer join tb_student st on st.hakno=su.hakno
                            group by st.hakno
                            order by st.hakno) a)                
                    where rn between 4 and 6;
                    
                    commit;

��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     g1001  ȫ�浿  6
     g1002  ȫ�浿  6
     g1005  ���޷�  6
     
SELECT * FROM TB_SUGANG ;

SELECT * FROM TB_STUDENT ST JOIN TB_SUGANG SG ON sg.hakno = st.hakno
                            JOIN TB_GWAMOK GM ON sg.GCODE = GM.GCODE 
                            ;
SELECT * FROM TB_GWAMOK;

----------------------��-------------------------------------------
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
��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  p001  OOP
     g1001  p003  JSP  
     g1001  d001  ��ǥ��
---------------------------------------��-------------
SELECT  A.HAKNO,A.GCODE, B.GNAME FROM     
(SELECT * FROM TB_SUGANG WHERE HAKNO = 'g1001') A 
JOIN TB_GWAMOK B ON A.GCODE = B.GCODE;

     
     
��6)������û�� �� �л����� �й�, �̸� ��ȸ
----------------------------------------------��
SELECT A.HAKNO, B.UNAME FROM
(SELECT HAKNO FROM TB_SUGANG 
GROUP BY HAKNO) A JOIN TB_STUDENT B ON A.HAKNO = B.HAKNO ;

     
��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ
SELECT SUB.HAKNO, SUB.UNAME FROM(
SELECT * FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO) AS SUB
;

SELECT A.UNAME, A.HAKNO FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO
WHERE B.SNO IS NULL;

SELECT SUB.* FROM (
SELECT * FROM(
SELECT * FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO)
WHERE SNO IS NULL ) SUB;

-----------------------------------��
SELECT A.UNAME, A.HAKNO FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO
WHERE B.SNO IS NULL;



/////////////////////////////////////////////////////////////////////
[�پ��� ����~]
- inner join : �� ���̺� �������� �����ϴ� �÷�. inner�� ��������( ������)
- left outer join : �������̺� ���� + �������� ������ ����.
- right outer  join : ���������̺� ���� + �������� �����ϴ� ������ ����.

[left join]
�л� ���̺��� ��� ���� �������� + �������̺��� �й��� ��ġ�ϴ� �ุ ��������. 
select * from tb_sugang a
where a.hakno in
(select hakno
from tb_student) ;

select hakno
from tb_student;

��8) left ������ �Ἥ ������û ���� ���� �й�, �̸�, �����ڵ� ��ȸ
select s.hakno, s.uname from tb_student s where s.hakno in (
select hakno from tb_sugang);

/////////////////////////////////////////////////////////////////////////
[+ �����ڸ� �̿��� ����]
 - + �����ڸ� �̿��ؼ� left,right join�� �����ϴ�
 - + ��ȣ�� ��ġ���� �ʴ� ���� �������� �ʴ� �ʿ� ���δ�..
 
 ����10) ������û�� ���� ���� �й�, �̸�, �����ڵ� ��ȸ
select *
 from tb_student ST, tb_sugang SU
 where ST.hakno SU.hakno(+);
 
 -- null ���� �͵� �� ���´�!! 
 --sugang ���̺� ���� student �� �� ���´�. left join ���� ȿ��. �ǹ������� �۽�?
 --�� +�� �̿��ؼ� ���ΰ� ���� ���̺� ����� ����. �� �̷��͵� �ִ� ������. 
 
 ����10) ���α׷� �������߿��� ���񺰷� ������û�� �ο����� ���Ͽ� �Ʒ��� ���� ����Ͻÿ�
 
 p001 OOP 2
 p002 Oracle 1
 --------------------------------------------------------��----------
 select su.gcode, gw.gname , count(gw.gname) �����ο� from tb_sugang su 
    join tb_gwamok gw on su.gcode = gw.gcode
    where su.gcode like 'p%'
    group by su.gcode, gw.gname
    order by su.gcode;
    
-----------------------------------------------------------------------

 
 ����11) OOP�������� ��û�� �л����� �й��� �̸����
 p001 OOP g1001 ȫ�浿
--------------------------------------------------------��------
 select gcode, gname, st.hakno, uname from 
 (select su.gcode,hakno,gname from tb_sugang su 
    join tb_gwamok gw on su.gcode = gw.gcode 
    where gw.gname = 'OOP') A JOIN tb_student st on A.hakno= st.hakno;

////////////////////////////////////////////////////////////////////////
[rownum]: ���ȣ! 
select hakno, uname, rownum from tb_student;
--���ȣ�� ��Ī �ο��ϱ�
select hakno, uname, rownum rn from tb_student;
--���ȣ�� �����ϱ�
select hakno, uname, rownum from tb_student
order by rownum desc;

--�̸����� �����ϱ� : ���ȣ�� ���� �ο��ǰ� -> ���ĵȴ�. order by�� select�� �Ŀ� �ϹǷ�!
select hakno, uname, rownum from tb_student
order by uname;

select hakno, uname, rownum rn from tb_student 
where rownum< 4;
--where �����ϰ� select �ϹǷ� rn�̶�� alias�� where ���� ��������.. 

select hakno, uname, rownum rn from tb_student
where rownum between 1 and 3;

--rownumĮ���� ���������Ŀ� ���ȣ �߰��ϰ� �������� Ȱ���Ѵ�
select hakno, uname, rownum, rn
from(
select hakno, uname, rownum rn from tb_student)
where rn >3;

////////////////////////////////////////////////////
����12) �������̺��� �����̸��� �������� ���� ��, ���ȣ 4~6�� ���̸� ��ȸ�Ͻÿ�
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
����13) �й��� ������û�� �������� ���ϰ�, �й��� �����ؼ� ���ȣ 4~6�� ��ȸ�Ͻÿ�
��, ������û�� �������� �л��� �������� 0���� ǥ��
select * from (
select a.*,rownum rn from( 
select st.hakno,sum(nvl(gw.ghakjum,0)) ������
        from tb_sugang su join tb_gwamok  gw on su.gcode = gw.gcode
                right outer join tb_student st on st.hakno=su.hakno
                            group by st.hakno
                            order by st.hakno) a)                
                    where rn between 4 and 6;
                    
                    commit;
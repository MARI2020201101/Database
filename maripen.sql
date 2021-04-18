select * from tbl_room;
select * from tbl_reserv;
select * from tbl_img;
desc tbl_room;
desc tbl_reserv;
desc tbl_img;
select sysdate from dual;
select to_char(sysdate,'yyMMddHHMISS') from dual;
select * from ALL_TAB_COLUMNS  where table_name='TBL_RESERV';
select * from USER_CONSTRAINTS  where table_name='TBL_RESERV';
create sequence reserv_seq MAXVALUE 99 cycle;
insert into tbl_reserv(RESERV_ID,NAME,START_DATE,STAY_DATE,RESERV_STATE,
    ADULT_COUNT,CHILD_COUNT,BABY_COUNT,ROOM_ID,ROOM_PRICE,EXTRA_PRICE,TOTAL_PRICE,
    TEL,PAYMENT,PEAKUP,ARR_TIME,DEPARTURE,TRANSPORT,REQUEST)
    VALUES ((to_char(sysdate,'yyMMddHHMISS')||LPAD(reserv_seq.NEXTVAL,2,'0')),'임연수',sysdate+1,1,'입금대기',
    4,0,0,1,150000,0,150000,
    01012341234,'무통장입금','N','14:00','서울특별시','자가','리퀘스트없음');
insert into tbl_reserv(RESERV_ID,NAME,START_DATE,STAY_DATE,RESERV_STATE,
    ADULT_COUNT,CHILD_COUNT,BABY_COUNT,ROOM_ID,ROOM_PRICE,EXTRA_PRICE,TOTAL_PRICE,
    TEL,PAYMENT,PEAKUP,ARR_TIME,DEPARTURE,TRANSPORT,REQUEST)
    VALUES ((to_char(sysdate,'yyMMddHHMISS')||LPAD(reserv_seq.NEXTVAL,2,'0')),'임꺽정',sysdate+10,1,'예약완료',
    4,0,0,1,150000,0,150000,
    01012341234,'카드결제','N','15:00','부산광역시','대중교통','리퀘스트없음');
commit;

delete from tbl_img;
insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\101\2886863009_38xX4tPF_8.jpg',1,0);
    
insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\101\2886863009_38xX4tPF_9.jpg',1,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\101\2886863009_38xX4tPF_10.jpg',1,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\101\2886863009_NYtxw3rp_1.jpg',1,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\101\2886863009_NYtxw3rp_2.jpg',1,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\101\2886863009_NYtxw3rp_4.jpg',1,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\101\2886863009_NYtxw3rp_5.jpg',1,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\101\2886863009_NYtxw3rp_6.jpg',1,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\101\2886863009_NYtxw3rp_7.jpg',1,1);

insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_ebR7Z5ra_8.jpg',2,0);
insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_ebR7Z5ra_9.jpg',2,1);
    
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_ebR7Z5ra_10.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_ebR7Z5ra_11.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_ebR7Z5ra_12.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_ebR7Z5ra_13.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_ebR7Z5ra_14.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_ebR7Z5ra_15.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_eIvXcWOz_16.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_eIvXcWOz_17.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_eIvXcWOz_18.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_eIvXcWOz_19.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_eIvXcWOz_20.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_JBZp6GvC_1.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_JBZp6GvC_2.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_JBZp6GvC_3.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_JBZp6GvC_4.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_JBZp6GvC_5.jpg',2,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\102\2886863009_JBZp6GvC_7.jpg',2,1);

insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\103\2886863009_9WcMm2Kj_1.jpg',3,0);   
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\103\2886863009_9WcMm2Kj_2.jpg',3,1);   
        insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\103\2886863009_9WcMm2Kj_3.jpg',3,1); 
        insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\103\2886863009_9WcMm2Kj_4.jpg',3,1); 
        insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\103\2886863009_9WcMm2Kj_5.jpg',3,1); 
            insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\103\2886863009_v0UaQ9Hb_6.jpg',3,1);

commit;
insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\201\2886863009_TwKuO9NF_1.jpg',4,0);
insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\201\2886863009_TwKuO9NF_2.jpg',4,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\201\2886863009_TwKuO9NF_3.jpg',4,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\201\2886863009_TwKuO9NF_4.jpg',4,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\201\2886863009_TwKuO9NF_5.jpg',4,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\201\2886863009_TwKuO9NF_6.jpg',4,1);
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\201\2886863009_TwKuO9NF_7.jpg',4,1);

insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_3kAe10q2_13.jpg',7,0); 
    
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_3kAe10q2_14.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_3kAe10q2_16.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_3kAe10q2_19.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_3kAe10q2_20.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_d689tKNj_1.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_d689tKNj_2.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_d689tKNj_3.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_HvJRSuWb_4.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_HvJRSuWb_5.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_HvJRSuWb_6.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_HvJRSuWb_7.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_HvJRSuWb_8.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_HvJRSuWb_9.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_HvJRSuWb_10.jpg',7,1); 
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\VIP\2886863009_HvJRSuWb_11.jpg',7,1); 
    

  
insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\separate\2886863009_qtvlmRjB_1.jpg',5,0); 
      insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\separate\2886863009_qtvlmRjB_2.jpg',5,1); 
        insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\separate\2886863009_qtvlmRjB_3.jpg',5,1); 
        insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\separate\2886863009_qtvlmRjB_4.jpg',5,1); 

insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_6o07d5BZ_3.jpg',6,0);    
insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_6o07d5BZ_4.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_6o07d5BZ_5.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_6o07d5BZ_6.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_6o07d5BZ_7.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_6o07d5BZ_8.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_BKlHb07F_10.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_BKlHb07F_11.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_BKlHb07F_12.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_BKlHb07F_13.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_BKlHb07F_16.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_Csq7lRuw_1.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_Csq7lRuw_2.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_wBU68HNf_19.jpg',6,1);  
    insert into tbl_img(IMG_ID,ROOM_ID,TYPE) 
    VALUES('upload\room\special\2886863009_wBU68HNf_20.jpg',6,1);  
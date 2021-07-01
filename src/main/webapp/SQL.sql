select * from emc;

select street from bolad;

select * from bolad where street = '송암로';

update bolad set street = '회재로' where street = '송암로' or street = '용봉로' or street = '충장로';

insert into road values('회재로', '서구');

select * from emc;


delete from bolad where bolno = 17;
delete from bolad where bolno = 20;

update emc set lightcolor = '평시';

update bolad set bstatus = '고장';
update bolad set bstatus = '정상';

<<<<<<< HEAD
select * from bolad;
=======
insert into emc values(emcno_sequence.nextval, '태풍으로 인한 침수', '진윤상','회재로','12:00~14:00','양호','서구');
insert into road values('송암로','남구');
insert into admin values('admin2','1234','유연진','남구','남부경찰서');
insert into bolad values(bolno_sequence.nextval,'송암로','최고볼라드','정상',null);

update emc set info = '2021 추억의 충장축제' where emcno = 22;
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-IoT-4/SmartBollard.git

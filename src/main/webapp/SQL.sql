select * from emc;

select street from bolad;

select * from bolad where street = '송암로';

update bolad set street = '회재로' where street = '송암로' or street = '용봉로' or street = '충장로';

insert into road values('회재로', '서구');

select * from bolad;


delete from bolad where bolno = 17;
delete from bolad where bolno = 20;

update bolad set heartbeat = 600;

update bolad set bstatus = '고장';
update bolad set bstatus = '정상';

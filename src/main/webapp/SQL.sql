select * from emc;

select street from bolad;

select * from bolad where street = '�۾Ϸ�';

update bolad set street = 'ȸ���' where street = '�۾Ϸ�' or street = '�����' or street = '�����';

insert into road values('ȸ���', '����');

select * from emc;


delete from bolad where bolno = 17;
delete from bolad where bolno = 20;

update emc set lightcolor = '���';

update bolad set bstatus = '����';
update bolad set bstatus = '����';

<<<<<<< HEAD
select * from bolad;
=======
insert into emc values(emcno_sequence.nextval, '��ǳ���� ���� ħ��', '������','ȸ���','12:00~14:00','��ȣ','����');
insert into road values('�۾Ϸ�','����');
insert into admin values('admin2','1234','������','����','���ΰ�����');
insert into bolad values(bolno_sequence.nextval,'�۾Ϸ�','�ְ����','����',null);

update emc set info = '2021 �߾��� ��������' where emcno = 22;
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-IoT-4/SmartBollard.git

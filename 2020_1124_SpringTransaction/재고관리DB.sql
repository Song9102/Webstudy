
--�԰�
create sequence seq_product_in_idx

create table product_in
(
   idx   int primary key,--�Ϸù�ȣ
   name  varchar2(255),   --��ǰ�� 
   cnt   int,			  --�԰����	
   regdate date           --�԰�����
)

--���
create sequence seq_product_out_idx

create table product_out
(
   idx   int primary key,--�Ϸù�ȣ
   name  varchar2(255),   --��ǰ�� 
   cnt   int,			  --������	
   regdate date           --�������
)

--���
create sequence seq_product_remain_idx

create table product_remain
(
   idx   int primary key,--�Ϸù�ȣ
   name  varchar2(255) not null unique,   --��ǰ�� 
   cnt   int,			  --������	
   regdate date          --�������
)

select * from product_remain

 delete from product_in where idx= #{ idx }

commit

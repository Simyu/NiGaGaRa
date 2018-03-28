alter table goods Modify(RECEIVER_ADDR varchar(200));
alter table goods Modify(sender_Addr varchar(200));

select * from goods where sender_id='qwe';
select * from member;
select * from delivery;
select * from grade;
select * from payment;
insert into delivery values(delivery_SEQ.nextval,'qwe','qwe',sysdate,sysdate,0,'138','138');
select delivery_Man from delivery where goods_Num ='138'
select * from member where mem_id = (select delivery_Ma
n from delivery where goods_Num ='138');

select a.*, b.delivery_state from (select * from goods where sender_id='qwe')a left outer join delivery b on a.goods_num=b.goods_num;  

select *
		from member
		where mem_id = (
		select delivery_Man
		from delivery
		where goods_Num =
		#{goods_Num})
select * from member where mem_id = 'qwe';
update member set	mem_eval = 0	where mem_id = 'qwe';

update goods set match_State = '배송전'	where goods_Num = '90';
update delivery set	delivery_State = 1	where goods_Num = '90';

select * from delivery where goods_Num = '138';

update delivery set	delivery_State = delivery_State + 1	where goods_Num = '138'and delivery_State <2;

update member set mem_eval = (select sum(grade)/count(*) from grade a, delivery b where a.delivery_num = b.delivery_num and delivery_man='qwe')
select sum(grade)/count(*) from grade a, delivery b where a.delivery_num = b.delivery_num and delivery_man='qwe'

select match_state from goods where Goods_Num = '140';

alter table member add mem_eval varchar(10);

select * from cash_exchange;
insert into cash_exchange values (cash_exchange_SEQ.nextval,'qwe','����',sysdate,12,12)

alter table payment add mem_id varchar(20);

select *
		from payment
		where mem_id = 'qwe'
		
	select
		a.receiver_Addr,a.sender_Addr from
		delivery b,goods a where
		b.goods_Num = a.goods_Num and b.goods_Num = 21
alter table goods Modify(RECEIVER_ADDR varchar(200));
alter table goods Modify(sender_Addr varchar(200));

select * from goods where sender_id='qwe';
select * from member;
select * from delivery;
select * from grade;
insert into delivery values(delivery_SEQ.nextval,'leesuj28','leesuj28',sysdate,sysdate,1,'61','61');
select delivery_Man from delivery where goods_Num ='138'
select * from member where mem_id = (select delivery_Man from delivery where goods_Num ='138');

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
update goods set match_State = '¹è¼ÛÀü'	where goods_Num = '61';

update delivery set	delivery_State = 1	where goods_Num = '61';

update delivery set	delivery_State = delivery_State + 1	where goods_Num = '138'and delivery_State <2;

update member set mem_eval = (select sum(grade)/count(*) from grade a, delivery b where a.delivery_num = b.delivery_num and delivery_man='qwe')
select sum(grade)/count(*) from grade a, delivery b where a.delivery_num = b.delivery_num and delivery_man='qwe'

select match_state from goods where Goods_Num = '140';

alter table member add mem_eval varchar(10);
alter table goods Modify(RECEIVER_ADDR varchar(200));
alter table goods Modify(sender_Addr varchar(200));

select * from goods where goods_num=42
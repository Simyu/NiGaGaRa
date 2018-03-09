drop table member CASCADE CONSTRAINT;

CREATE TABLE member
(
    mem_id             VARCHAR2(20)     NOT NULL, 
    mem_pw             VARCHAR2(20)     NULL, 
    mem_name           VARCHAR2(20)     NULL, 
    mem_birth          VARCHAR2(20)     NULL, 
    mem_zipcode        VARCHAR2(5)      NULL, 
    mem_addr           VARCHAR2(90)     NULL, 
    mem_addr_detail    VARCHAR2(90)     NULL, 
    mem_state          VARCHAR2(20)     NULL, 
    mem_gender         VARCHAR2(20)     NULL, 
    mem_phone          VARCHAR2(20)     NULL, 
    mem_email          VARCHAR2(20)     NULL, 
    point_total        NUMBER           NULL, 
    mem_type           VARCHAR2(20)     NULL, 
    mem_account        VARCHAR2(20)     NULL, 
    mem_img            VARCHAR2(100)    NULL, 
    mem_lati           NUMBER           NULL, 
    mem_longi          NUMBER           NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (mem_id)
);

drop table cash_exchange CASCADE CONSTRAINT;

CREATE TABLE cash_exchange
(
    exchange_num     NUMBER          NOT NULL, 
    mem_id           VARCHAR2(20)    NULL, 
    exchange_type    VARCHAR2(20)    NULL, 
    exchange_date    DATE            NULL, 
    point            NUMBER          NULL, 
    cash             NUMBER          NULL, 
    CONSTRAINT CASH_EXCHANGE_PK PRIMARY KEY (exchange_num)
);


CREATE SEQUENCE cash_exchange_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE cash_exchange
    ADD CONSTRAINT FK_cash_exchange_mem_id_member FOREIGN KEY (mem_id)
        REFERENCES member (mem_id);

drop table goods CASCADE CONSTRAINT;
        
CREATE TABLE goods
(
    goods_Num           NUMBER          NOT NULL, 
    goods_Name          VARCHAR2(20)    NULL, 
    weight              VARCHAR2(20)    NULL, 
    quantity            NUMBER          NULL, 
    estimated_Price     NUMBER          NULL, 
    receiver_Name       VARCHAR2(20)    NULL, 
    receiver_zipcode    VARCHAR2(20)    NULL, 
    receiver_Addr       VARCHAR2(200)    NULL, 
    receiver_Tel        VARCHAR2(20)    NULL, 
    sender_zipcode      VARCHAR2(20)    NULL, 
    sender_Addr         VARCHAR2(200)    NULL, 
    delivery_Tool       VARCHAR2(20)    NULL, 
    goods_Msg           VARCHAR2(2000)    NULL, 
    Match_State         VARCHAR2(20)    NULL, 
    sender_id           VARCHAR2(20)    NULL, 
    CONSTRAINT GOODS_PK PRIMARY KEY (goods_Num)
);


CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE goods
    ADD CONSTRAINT FK_goods_sender_id_member_mem_ FOREIGN KEY (sender_id)
        REFERENCES member (mem_id);

drop table delivery CASCADE CONSTRAINT;
        
CREATE TABLE delivery
(
    delivery_num      NUMBER          NOT NULL, 
    sender            VARCHAR2(20)    NULL, 
    delivery_Man      VARCHAR2(20)    NULL, 
    departure_Time    DATE            NULL, 
    arrival_Time      DATE            NULL, 
    delivery_State    VARCHAR2(20)    NULL, 
    goods_Num         NUMBER          NULL, 
    delivery_qr       VARCHAR2(20)    NULL, 
    CONSTRAINT DELIVERY_PK PRIMARY KEY (delivery_num)
);


CREATE SEQUENCE delivery_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE delivery
    ADD CONSTRAINT FK_delivery_goods_Num_goods_go FOREIGN KEY (goods_Num)
        REFERENCES goods (goods_Num);


ALTER TABLE delivery
    ADD CONSTRAINT FK_delivery_sender_member_mem_ FOREIGN KEY (sender)
        REFERENCES member (mem_id);


ALTER TABLE delivery
    ADD CONSTRAINT FK_delivery_delivery_Man_membe FOREIGN KEY (delivery_Man)
        REFERENCES member (mem_id);

drop table grade CASCADE CONSTRAINT;

CREATE TABLE grade
(
    grade_num        NUMBER          NOT NULL, 
    delivery_Num     NUMBER		     NULL, 
    grade            NUMBER          NULL, 
    grade_content    VARCHAR2(2000)    NULL, 
    grade_date       DATE            NULL, 
    CONSTRAINT GRADE_PK PRIMARY KEY (grade_num)
);


CREATE SEQUENCE grade_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE grade
    ADD CONSTRAINT FK_grade_delivery_Num_delivery FOREIGN KEY (delivery_Num)
        REFERENCES delivery (delivery_num);

drop table payment CASCADE CONSTRAINT;

CREATE TABLE payment
(
    payment_num     NUMBER          NOT NULL, 
    delivery_num    NUMBER          NULL, 
    payment_date    VARCHAR2(20)    NULL, 
    payment_type    VARCHAR2(20)    NULL, 
    point           NUMBER          NULL, 
    CONSTRAINT PAYMENT_PK PRIMARY KEY (payment_num)
);


CREATE SEQUENCE payment_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE payment
    ADD CONSTRAINT FK_payment_delivery_num_delive FOREIGN KEY (delivery_num)
        REFERENCES delivery (delivery_num);

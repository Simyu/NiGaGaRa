package kr.nigagara.teamalpha.delivery;

import java.sql.Date;

public class DeliveryVO {
	private int delivery_num;
	private String sender;
	private String delivery_Man;
	private Date departure_Time;
	private Date arrival_Time;
	private String delivery_State;
	private int goods_Num;
	private String delivery_qr;
	private String receiver_Addr;
	private String receiver_Addr_detail;
	private String sender_Addr;
	private String sender_Addr_detail;
	
	
	public DeliveryVO() {
		// TODO Auto-generated constructor stub
	}

	public DeliveryVO(int delivery_num, String sender, String delivery_Man, Date departure_Time, Date arrival_Time,
			String delivery_State, int goods_Num, String delivery_qr) {
		super();
		this.delivery_num = delivery_num;
		this.sender = sender;
		this.delivery_Man = delivery_Man;
		this.departure_Time = departure_Time;
		this.arrival_Time = arrival_Time;
		this.delivery_State = delivery_State;
		this.goods_Num = goods_Num;
		this.delivery_qr = delivery_qr;
	}

	public String getReceiver_Addr() {
		return receiver_Addr;
	}

	public void setReceiver_Addr(String receiver_Addr) {
		this.receiver_Addr = receiver_Addr;
	}

	public String getReceiver_Addr_detail() {
		return receiver_Addr_detail;
	}

	public void setReceiver_Addr_detail(String receiver_Addr_detail) {
		this.receiver_Addr_detail = receiver_Addr_detail;
	}

	public String getSender_Addr() {
		return sender_Addr;
	}

	public void setSender_Addr(String sender_Addr) {
		this.sender_Addr = sender_Addr;
	}

	public String getSender_Addr_detail() {
		return sender_Addr_detail;
	}

	public void setSender_Addr_detail(String sender_Addr_detail) {
		this.sender_Addr_detail = sender_Addr_detail;
	}

	public int getDelivery_num() {
		return delivery_num;
	}

	public void setDelivery_num(int delivery_num) {
		this.delivery_num = delivery_num;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getDelivery_Man() {
		return delivery_Man;
	}

	public void setDelivery_Man(String delivery_Man) {
		this.delivery_Man = delivery_Man;
	}

	public Date getDeparture_Time() {
		return departure_Time;
	}

	public void setDeparture_Time(Date departure_Time) {
		this.departure_Time = departure_Time;
	}

	public Date getArrival_Time() {
		return arrival_Time;
	}

	public void setArrival_Time(Date arrival_Time) {
		this.arrival_Time = arrival_Time;
	}

	public String getDelivery_State() {
		return delivery_State;
	}

	public void setDelivery_State(String delivery_State) {
		this.delivery_State = delivery_State;
	}

	public int getGoods_Num() {
		return goods_Num;
	}

	public void setGoods_Num(int goods_Num) {
		this.goods_Num = goods_Num;
	}

	public String getDelivery_qr() {
		return delivery_qr;
	}

	public void setDelivery_qr(String delivery_qr) {
		this.delivery_qr = delivery_qr;
	}

	@Override
	public String toString() {
		return "DeliveryVO [delivery_num=" + delivery_num + ", sender=" + sender + ", delivery_Man=" + delivery_Man
				+ ", departure_Time=" + departure_Time + ", arrival_Time=" + arrival_Time + ", delivery_State="
				+ delivery_State + ", goods_Num=" + goods_Num + ", delivery_qr=" + delivery_qr + "]";
	}

}
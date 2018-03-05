package kr.nigagara.teamalpha.delivery;

import java.sql.Date;

public class DeliveryVO {

    private Integer deliveryNum;

    private String sender;

    private String deliveryMan;

    private Date departureTime;

    private Date arrivalTime;

    private String deliveryState;

    private Integer goodsNum;

    private String deliveryQr;
    
    public DeliveryVO() {
		// TODO Auto-generated constructor stub
	}

	public DeliveryVO(Integer deliveryNum, String sender, String deliveryMan, Date departureTime, Date arrivalTime,
			String deliveryState, Integer goodsNum, String deliveryQr) {
		super();
		this.deliveryNum = deliveryNum;
		this.sender = sender;
		this.deliveryMan = deliveryMan;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
		this.deliveryState = deliveryState;
		this.goodsNum = goodsNum;
		this.deliveryQr = deliveryQr;
	}

	public Integer getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(Integer deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getDeliveryMan() {
		return deliveryMan;
	}

	public void setDeliveryMan(String deliveryMan) {
		this.deliveryMan = deliveryMan;
	}

	public Date getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(Date departureTime) {
		this.departureTime = departureTime;
	}

	public Date getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getDeliveryState() {
		return deliveryState;
	}

	public void setDeliveryState(String deliveryState) {
		this.deliveryState = deliveryState;
	}

	public Integer getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}

	public String getDeliveryQr() {
		return deliveryQr;
	}

	public void setDeliveryQr(String deliveryQr) {
		this.deliveryQr = deliveryQr;
	}

	@Override
	public String toString() {
		return "DeliveryVO [deliveryNum=" + deliveryNum + ", sender=" + sender + ", deliveryMan=" + deliveryMan
				+ ", departureTime=" + departureTime + ", arrivalTime=" + arrivalTime + ", deliveryState="
				+ deliveryState + ", goodsNum=" + goodsNum + ", deliveryQr=" + deliveryQr + "]";
	}
    
    
}
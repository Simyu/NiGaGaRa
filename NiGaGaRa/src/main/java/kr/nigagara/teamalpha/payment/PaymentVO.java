package kr.nigagara.teamalpha.payment;

public class PaymentVO {

	private Integer paymentNum;

	private Integer deliveryNum;

	private String paymentDate;

	private String paymentType;

	private Integer point;

	public PaymentVO() {
		// TODO Auto-generated constructor stub
	}

	public PaymentVO(Integer paymentNum, Integer deliveryNum, String paymentDate, String paymentType, Integer point) {
		super();
		this.paymentNum = paymentNum;
		this.deliveryNum = deliveryNum;
		this.paymentDate = paymentDate;
		this.paymentType = paymentType;
		this.point = point;
	}

	public Integer getPaymentNum() {
		return paymentNum;
	}

	public void setPaymentNum(Integer paymentNum) {
		this.paymentNum = paymentNum;
	}

	public Integer getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(Integer deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "PaymentVO [paymentNum=" + paymentNum + ", deliveryNum=" + deliveryNum + ", paymentDate=" + paymentDate
				+ ", paymentType=" + paymentType + ", point=" + point + "]";
	}

}
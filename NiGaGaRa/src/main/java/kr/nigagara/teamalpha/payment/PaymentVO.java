package kr.nigagara.teamalpha.payment;

public class PaymentVO {

	private int payment_num;
	private int delivery_num;
	private String payment_date;
	private String payment_type;
	private int point;

	public PaymentVO() {
		// TODO Auto-generated constructor stub
	}

	public PaymentVO(int payment_num, int delivery_num, String payment_date, String payment_type, int point) {
		super();
		this.payment_num = payment_num;
		this.delivery_num = delivery_num;
		this.payment_date = payment_date;
		this.payment_type = payment_type;
		this.point = point;
	}

	public int getPayment_num() {
		return payment_num;
	}

	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}

	public int getDelivery_num() {
		return delivery_num;
	}

	public void setDelivery_num(int delivery_num) {
		this.delivery_num = delivery_num;
	}

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public String getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "PaymentVO [payment_num=" + payment_num + ", delivery_num=" + delivery_num + ", payment_date="
				+ payment_date + ", payment_type=" + payment_type + ", point=" + point + "]";
	}

}
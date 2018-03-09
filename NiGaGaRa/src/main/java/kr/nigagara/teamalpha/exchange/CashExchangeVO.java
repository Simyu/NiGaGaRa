package kr.nigagara.teamalpha.exchange;

import java.sql.Date;

public class CashExchangeVO {

	private int exchange_num;
	private String mem_id;
	private String exchange_type;
	private Date exchange_date;
	private int point;
	private int cash;

	public CashExchangeVO() {
		// TODO Auto-generated constructor stub
	}

	public CashExchangeVO(int exchange_num, String mem_id, String exchange_type, Date exchange_date, int point,
			int cash) {
		super();
		this.exchange_num = exchange_num;
		this.mem_id = mem_id;
		this.exchange_type = exchange_type;
		this.exchange_date = exchange_date;
		this.point = point;
		this.cash = cash;
	}

	public int getExchange_num() {
		return exchange_num;
	}

	public void setExchange_num(int exchange_num) {
		this.exchange_num = exchange_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getExchange_type() {
		return exchange_type;
	}

	public void setExchange_type(String exchange_type) {
		this.exchange_type = exchange_type;
	}

	public Date getExchange_date() {
		return exchange_date;
	}

	public void setExchange_date(Date exchange_date) {
		this.exchange_date = exchange_date;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	@Override
	public String toString() {
		return "CashExchangeVO [exchange_num=" + exchange_num + ", mem_id=" + mem_id + ", exchange_type="
				+ exchange_type + ", exchange_date=" + exchange_date + ", point=" + point + ", cash=" + cash + "]";
	}

}
package kr.nigagara.teamalpha.exchange;

import java.sql.Date;

public class CashExchangeVO {

    private Integer exchangeNum;

    private String memId;

    private String exchangeType;

    private Date exchangeDate;

    private Integer point;

    private Integer cash;
    
    public CashExchangeVO() {
		// TODO Auto-generated constructor stub
	}

	public CashExchangeVO(Integer exchangeNum, String memId, String exchangeType, Date exchangeDate, Integer point,
			Integer cash) {
		super();
		this.exchangeNum = exchangeNum;
		this.memId = memId;
		this.exchangeType = exchangeType;
		this.exchangeDate = exchangeDate;
		this.point = point;
		this.cash = cash;
	}

	public Integer getExchangeNum() {
		return exchangeNum;
	}

	public void setExchangeNum(Integer exchangeNum) {
		this.exchangeNum = exchangeNum;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getExchangeType() {
		return exchangeType;
	}

	public void setExchangeType(String exchangeType) {
		this.exchangeType = exchangeType;
	}

	public Date getExchangeDate() {
		return exchangeDate;
	}

	public void setExchangeDate(Date exchangeDate) {
		this.exchangeDate = exchangeDate;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Integer getCash() {
		return cash;
	}

	public void setCash(Integer cash) {
		this.cash = cash;
	}

	@Override
	public String toString() {
		return "CashExchangeVO [exchangeNum=" + exchangeNum + ", memId=" + memId + ", exchangeType=" + exchangeType
				+ ", exchangeDate=" + exchangeDate + ", point=" + point + ", cash=" + cash + "]";
	}
    
}
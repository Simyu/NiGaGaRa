package kr.nigagara.teamalpha.exchange;

public interface CashExchangeDAO {

	int insert(String id, String point, String type);
	void pay(String mem_id, String cash);

}

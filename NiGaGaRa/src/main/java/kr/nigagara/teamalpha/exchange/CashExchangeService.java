package kr.nigagara.teamalpha.exchange;

public interface CashExchangeService {

	int insert(String id, String point, String type);
	void pay(String mem_id, String cash);

}

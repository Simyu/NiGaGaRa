package kr.nigagara.teamalpha.exchange;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CashExchangeServiceImpl implements CashExchangeService {

	@Autowired
	CashExchangeDAO dao;

	@Override
	public int insert(String id, String point, String type) {
		return dao.insert(id,point, type);
	}

	@Override
	public void pay(String mem_id, String cash) {
		dao.pay(mem_id, cash);
	}

}

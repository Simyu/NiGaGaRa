package kr.nigagara.teamalpha.exchange;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CashExchangeDAOImpl implements CashExchangeDAO {

	@Autowired
	SqlSession sqlsession;

	@Override
	public int insert(String id, String point, String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("point", point);
		map.put("type", type);
		map.put("id", id);

		return sqlsession.insert("nigagara.exchange.insert", map);
	}

	@Override
	public void pay(String mem_id, String cash) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("cash", cash);
		sqlsession.update("nigagara.exchange.pointMinus", map);
	}

}

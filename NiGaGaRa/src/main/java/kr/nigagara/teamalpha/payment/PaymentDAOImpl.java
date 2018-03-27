package kr.nigagara.teamalpha.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.nigagara.teamalpha.exchange.CashExchangeVO;
import kr.nigagara.teamalpha.member.MemberVO;

@Repository("paymentdao")
public class PaymentDAOImpl implements PaymentDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insert(PaymentVO payment) {
		int main = sqlSession.insert("nigagara.list.insert", payment);
		return main;
	}

	@Override
	public int pay(String mem_id, String cash) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("cash", cash);
		int pay = sqlSession.insert("nigagara.payment.insert", map);
		sqlSession.update("nigagara.payment.totalPoint", map);
		return pay;
	}

	@Override
	public List<MemberVO> pay_user(String mem_id) {
		List<MemberVO> pay_user = sqlSession.selectList("nigagara.payment.user", mem_id);
		return pay_user;
	}

	@Override
	public List<CashExchangeVO> cash_exchangelist(String mem_id) {
		List<CashExchangeVO> cash_exchangelist = sqlSession.selectList("nigagara.payment.cash_exchangelist", mem_id);
		return cash_exchangelist;
	}

	@Override
	public List<PaymentVO> paymentlist(String mem_id) {
		List<PaymentVO> paymentlist = sqlSession.selectList("nigagara.payment.paymentlist", mem_id);
		return paymentlist;
	}
}
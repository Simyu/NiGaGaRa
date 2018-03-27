package kr.nigagara.teamalpha.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.nigagara.teamalpha.exchange.CashExchangeVO;
import kr.nigagara.teamalpha.member.MemberVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	@Qualifier("paymentdao")
	PaymentDAO dao;

	@Override
	public int insert(PaymentVO payment) {
		return dao.insert(payment);
	}

	@Override
	public int pay(String mem_id, String cash) {
		return dao.pay(mem_id, cash);
	}

	@Override
	public List<MemberVO> pay_user(String mem_id) {
		return dao.pay_user(mem_id);
	}

	@Override
	public List<CashExchangeVO> cash_exchangelist(String mem_id) {
		return dao.cash_exchangelist(mem_id);
	}

	@Override
	public List<PaymentVO> paymentlist(String mem_id) {
		return dao.paymentlist(mem_id);
	}
}
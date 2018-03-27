package kr.nigagara.teamalpha.payment;

import java.util.List;

import kr.nigagara.teamalpha.exchange.CashExchangeVO;
import kr.nigagara.teamalpha.member.MemberVO;

public interface PaymentDAO {

	int insert(PaymentVO payment);

	List<MemberVO> pay_user(String mem_id);

	int pay(String mem_id, String cash);

	List<CashExchangeVO> cash_exchangelist(String mem_id);

	List<PaymentVO> paymentlist(String mem_id);
}

package kr.nigagara.teamalpha.payment;

import java.util.List;

public interface PaymentService {
	
	int insert(PaymentVO payment);
	List<PaymentVO> paymentlist(String mem_id);

}

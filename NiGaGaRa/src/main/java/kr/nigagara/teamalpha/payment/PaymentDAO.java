package kr.nigagara.teamalpha.payment;

import java.util.List;

public interface PaymentDAO {
	
	int insert(PaymentVO payment);
	List<PaymentVO> paymentlist(int payment_num);
	
}

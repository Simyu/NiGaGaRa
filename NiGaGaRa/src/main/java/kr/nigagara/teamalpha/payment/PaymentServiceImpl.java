package kr.nigagara.teamalpha.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	public List<PaymentVO> paymentlist(String mem_id) {
		return dao.paymentlist(mem_id);
	}
}
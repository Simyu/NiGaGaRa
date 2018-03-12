package kr.nigagara.teamalpha.payment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("paymentdao")
public class PaymentDAOImpl implements PaymentDAO {
	@Autowired
	SqlSession sqlSession;


	@Override
	public int insert(PaymentVO payment) {
		int main = sqlSession.insert("NiGaGaRa.list.insert", payment);
		return main;
	}

	@Override
	public List<PaymentVO> paymentlist(int payment_num) {
		List<PaymentVO> paymentlist = sqlSession.selectList("NiGaGaRa.payment.list");
		return paymentlist;
	}
}
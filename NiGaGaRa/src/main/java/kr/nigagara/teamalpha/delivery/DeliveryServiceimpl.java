package kr.nigagara.teamalpha.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.nigagara.teamalpha.member.MemberVO;

@Service
public class DeliveryServiceimpl implements DeliveryService {
	@Autowired
	@Qualifier("deliverydao")
	DeliveryDAO dao;

	@Override
	public List<DeliveryVO> list() {

		return dao.list();
	}

	@Override
	public DeliveryVO select(Integer deliveryNum) {

		return dao.select(deliveryNum);
	}

	@Override
	public DeliveryVO changeState(String Goods_Num) {
		return dao.changeState(Goods_Num);
	}

	@Override
	public DeliveryVO stateResult(String Goods_Num) {
		return dao.stateResult(Goods_Num);

	}

	@Override
	public String matchState(String Goods_Num) {
		return dao.matchState(Goods_Num);

	}

	@Override
	public void matchState1(String Goods_Num) {
		dao.matchState1(Goods_Num);

	}

	@Override
	public void matchState2(String Goods_Num) {
		dao.matchState2(Goods_Num);

	}

	@Override
	public int paymentInsert1(DeliveryVO stateResult) {
		return dao.paymentInsert1(stateResult);

	}

	@Override
	public int paymentInsert2(DeliveryVO stateResult) {
		return dao.paymentInsert2(stateResult);

	}

	public int insert(DeliveryVO vo) {
		return dao.insert(vo);
	}
}

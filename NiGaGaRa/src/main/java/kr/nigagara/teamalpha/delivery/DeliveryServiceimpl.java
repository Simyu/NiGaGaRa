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
	public List<DeliveryVO> list(MemberVO memId) {

		return dao.list(memId);
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

}

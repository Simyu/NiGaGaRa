package kr.nigagara.teamalpha.delivery;

import java.util.List;

import kr.nigagara.teamalpha.member.MemberVO;

public interface DeliveryService {
	List<DeliveryVO> list(MemberVO memId);

	DeliveryVO select(Integer deliveryNum);

	DeliveryVO changeState(String Goods_Num);

	DeliveryVO stateResult(String Goods_Num);

	String matchState(String Goods_Num);

	void matchState1(String Goods_Num);

	void matchState2(String Goods_Num);

	int paymentInsert1(DeliveryVO stateResult);

	int paymentInsert2(DeliveryVO stateResult);

	int insert(DeliveryVO vo);
}

package kr.nigagara.teamalpha.evaluation;

import java.util.List;

import kr.nigagara.teamalpha.delivery.DeliveryVO;
import kr.nigagara.teamalpha.member.MemberVO;

public interface EvaluationService {
	void evalInsert(EvaluationVO EvaluationVO);

	List<MemberVO> evalDetail(String goods_Num);

	DeliveryVO changeState(String Goods_Num);

	void avgEval(String delivery_Man);

}

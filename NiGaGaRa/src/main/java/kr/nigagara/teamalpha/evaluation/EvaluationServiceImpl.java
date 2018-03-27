package kr.nigagara.teamalpha.evaluation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.nigagara.teamalpha.delivery.DeliveryVO;
import kr.nigagara.teamalpha.member.MemberVO;

@Service
public class EvaluationServiceImpl implements EvaluationService {
	@Autowired
	@Qualifier("evaldao")
	EvaluationDAO dao;

	@Override
	public List<MemberVO> evalDetail(String goods_Num) {
		return dao.evalDetail(goods_Num);
	}

	@Override
	public void evalInsert(EvaluationVO EvaluationVO) {
		dao.evalInsert(EvaluationVO);
	}

	@Override
	public DeliveryVO changeState(String Goods_Num) {
		return dao.changeState(Goods_Num);
	}

	@Override
	public void avgEval(String delivery_Man) {
		System.out.println("service=>" + delivery_Man);
		dao.avgEval(delivery_Man);

	}
}

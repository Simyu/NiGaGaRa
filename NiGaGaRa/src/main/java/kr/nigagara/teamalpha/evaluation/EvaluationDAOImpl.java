package kr.nigagara.teamalpha.evaluation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.nigagara.teamalpha.delivery.DeliveryVO;
import kr.nigagara.teamalpha.member.MemberVO;

@Repository("evaldao")
public class EvaluationDAOImpl implements EvaluationDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MemberVO> evalDetail(String goods_Num) {
		System.out.println(goods_Num);
		List<MemberVO> evalDetail = sqlSession.selectList("nigagara.evaluation.evalDetail", goods_Num);
		return evalDetail;
	}

	@Override
	public void evalInsert(EvaluationVO EvaluationVO) {
		sqlSession.insert("nigagara.evaluation.evalinsert", EvaluationVO);

	}

	@Override
	public DeliveryVO changeState(String Goods_Num) {
		return sqlSession.selectOne("nigagara.evaluation.changeState",Goods_Num);
	}

	@Override
	public void avgEval(String delivery_Man) {
		System.out.println("service=>"+delivery_Man);
		sqlSession.update("nigagara.evaluation.avgEval",delivery_Man);
		
	}

}

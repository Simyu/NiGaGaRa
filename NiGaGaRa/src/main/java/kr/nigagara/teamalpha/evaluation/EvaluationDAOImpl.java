package kr.nigagara.teamalpha.evaluation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}

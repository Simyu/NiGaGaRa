package kr.nigagara.teamalpha.evaluation;

import java.util.List;

import kr.nigagara.teamalpha.member.MemberVO;

public interface EvaluationDAO {
	void evalInsert(EvaluationVO EvaluationVO);
	List<MemberVO> evalDetail (String goods_Num);
}
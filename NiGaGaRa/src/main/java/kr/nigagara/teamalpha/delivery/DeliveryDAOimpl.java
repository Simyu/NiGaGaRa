package kr.nigagara.teamalpha.delivery;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.nigagara.teamalpha.member.MemberVO;
@Repository("deliverydao")
public class DeliveryDAOimpl implements DeliveryDAO {
@Autowired
SqlSession sqlSession;

	@Override
	public List<DeliveryVO> list(MemberVO memId) {
		
		return sqlSession.selectList("nigagara.delivery.list",memId);
	}

	@Override
	public DeliveryVO select(Integer deliveryNum) {
		return sqlSession.selectOne("nigagara.delivery.select",deliveryNum);
	}

	@Override
	public DeliveryVO changeState(String Goods_Num) {
		return sqlSession.selectOne("nigagara.delivery.changeState",Goods_Num);
	}

	@Override
	public DeliveryVO stateResult(String Goods_Num) {
		return sqlSession.selectOne("nigagara.delivery.stateResult",Goods_Num);
	}
	public int insert(DeliveryVO vo) {
		return sqlSession.insert("nigagara.delivery.insert",vo);
	}

}

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

		return sqlSession.selectList("nigagara.delivery.list", memId);
	}

	@Override
	public DeliveryVO select(Integer deliveryNum) {
		return sqlSession.selectOne("nigagara.delivery.select", deliveryNum);
	}

	@Override
	public DeliveryVO changeState(String Goods_Num) {
		return sqlSession.selectOne("nigagara.delivery.changeState", Goods_Num);

	}

	@Override
	public DeliveryVO stateResult(String Goods_Num) {
		return sqlSession.selectOne("nigagara.delivery.stateResult", Goods_Num);
	}

	@Override
	public String matchState(String Goods_Num) {
		return sqlSession.selectOne("nigagara.delivery.matchState", Goods_Num);
	}

	@Override
	public void matchState1(String Goods_Num) {
		sqlSession.selectOne("nigagara.delivery.matchState1", Goods_Num);
		sqlSession.update("nigagara.delivery.departure", Goods_Num);
	}

	@Override
	public void matchState2(String Goods_Num) {
		sqlSession.selectOne("nigagara.delivery.matchState2", Goods_Num);
		sqlSession.update("nigagara.delivery.arrival", Goods_Num);

	}

	@Override
	public int paymentInsert1(DeliveryVO stateResult) {
		int main = sqlSession.insert("nigagara.delivery.paymentInsert1", stateResult);
		return main;
	}

	@Override
	public int paymentInsert2(DeliveryVO stateResult) {
		int main = sqlSession.insert("nigagara.delivery.paymentInsert2", stateResult);
		return main;
	}

	public int insert(DeliveryVO vo) {
		return sqlSession.insert("nigagara.delivery.insert", vo);
	}
}

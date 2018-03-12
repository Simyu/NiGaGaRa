package kr.nigagara.teamalpha.delivery;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.nigagara.teamalpha.goods.GoodsVO;
import kr.nigagara.teamalpha.member.MemberVO;
@Repository("deliverydao")
public class DeliveryDAOimpl implements DeliveryDAO {
@Autowired
SqlSession sqlSession;

	@Override
	public List<DeliveryVO> list(String delivery_Man) {
		
		return sqlSession.selectList("nigagara.delivery.list",delivery_Man);
	}

}

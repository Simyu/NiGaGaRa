package kr.nigagara.teamalpha.delivery;


import java.util.List;

import kr.nigagara.teamalpha.goods.GoodsVO;
import kr.nigagara.teamalpha.member.MemberVO;

public interface DeliveryDAO {
	List<DeliveryVO> list(String delivery_Man);
	
}

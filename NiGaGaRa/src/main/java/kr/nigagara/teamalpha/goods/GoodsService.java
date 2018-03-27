package kr.nigagara.teamalpha.goods;

import java.util.List;

public interface GoodsService {
	
	List<GoodsVO> requestlist (String login_id);
	int goodsInsert(GoodsVO GoodsVO);
	List<GoodsVO> requestdetail (String goods_Num);
	int requestedit (GoodsVO GoodsVO);

}

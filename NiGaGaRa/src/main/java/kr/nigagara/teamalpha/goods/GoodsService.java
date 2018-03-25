package kr.nigagara.teamalpha.goods;

import java.util.List;

public interface GoodsService {
	
	int goodsInsert(GoodsVO GoodsVO);
	List<GoodsVO> requestlist (String login_id);
	List<GoodsVO> requestdetail (String goods_Num);
	int requestedit (GoodsVO GoodsVO);

}

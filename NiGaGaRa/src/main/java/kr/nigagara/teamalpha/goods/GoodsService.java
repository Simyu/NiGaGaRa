package kr.nigagara.teamalpha.goods;

import java.util.List;

public interface GoodsService {

	void goodsInsert(GoodsVO GoodsVO);

	List<GoodsVO> requestlist();

	List<GoodsVO> requestdetail(String goods_Num);

	int requestedit(GoodsVO GoodsVO);

}

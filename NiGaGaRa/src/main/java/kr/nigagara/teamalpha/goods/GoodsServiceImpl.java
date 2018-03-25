package kr.nigagara.teamalpha.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	@Qualifier("goodsdao")
	GoodsDAO dao;

	@Override
	public int goodsInsert(GoodsVO GoodsVO) {
		return dao.goodsInsert(GoodsVO);
	}

	@Override
	public List<GoodsVO> requestlist() {
		return dao.requestlist();
	}

	@Override
	public List<GoodsVO> requestdetail(String goods_Num) {
		return dao.requestdetail(goods_Num);
	}

	@Override
	public int requestedit(GoodsVO GoodsVO) {
		return dao.requestedit(GoodsVO);

	}
}

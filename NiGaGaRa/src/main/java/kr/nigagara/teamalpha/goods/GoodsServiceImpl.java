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
	public void goodsInsert(GoodsVO GoodsVO) {
		dao.goodsInsert(GoodsVO);
	}

}

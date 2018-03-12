package kr.nigagara.teamalpha.goods;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("goodsdao")
public class GoodsDAOImpl implements GoodsDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void goodsInsert(GoodsVO GoodsVO) {
		sqlSession.insert("nigagara.goods.insert", GoodsVO);
	}

	@Override
	public List<GoodsVO> requestlist() {
		List<GoodsVO> requestlist = sqlSession.selectList("nigagara.goods.requestlist");
		return requestlist;
	}

	@Override
	public List<GoodsVO> requestdetail(String goods_Num) {
		List<GoodsVO> requestdetail = sqlSession.selectList("nigagara.goods.requestdetail", goods_Num);
		return requestdetail;
	}

	@Override
	public int requestedit(GoodsVO GoodsVO) {
		int requestedit = sqlSession.update("nigagara.goods.requestedit", GoodsVO);
		return requestedit;
	}

}

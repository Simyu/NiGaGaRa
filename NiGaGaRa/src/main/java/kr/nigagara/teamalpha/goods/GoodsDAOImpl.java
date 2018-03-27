package kr.nigagara.teamalpha.goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("goodsdao")
public class GoodsDAOImpl implements GoodsDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int goodsInsert(GoodsVO GoodsVO) {
		sqlSession.insert("nigagara.goods.insert", GoodsVO);
		return GoodsVO.getGoods_Num();
	}

	@Override
	public List<GoodsVO> requestlist(String login_id) {
		List<GoodsVO> requestlist = sqlSession.selectList("nigagara.goods.requestlist", login_id);
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

	@Override
	public List<GoodsVO> requestlist_all() {
		List<GoodsVO> requestlist = sqlSession.selectList("nigagara.goods.requestlist_all");
		return requestlist;
	}

	@Override
	public List<GoodsVO> searchList(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GoodsVO> searchList(String tag, String search) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("tag", tag);
		map.put("search", search);
		List<GoodsVO> searchList = sqlSession.selectList("nigagara.goods.dynamicSearch", map);
		System.out.println(searchList);
		return searchList;
	}
}

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

}

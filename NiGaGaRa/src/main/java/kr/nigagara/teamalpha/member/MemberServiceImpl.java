package kr.nigagara.teamalpha.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("memdao")
	MemberDAO dao;

	@Override
	public int insert(MemberVO member) {

		return dao.insert(member);
	}
	@Override
	public MemberVO login(String id, String pass) {
		MemberVO vo = dao.login(id, pass);
		System.out.println("MemberServiceImpl = >" + vo);
		// return dao.login(id, pass);
		return vo;
	}

	@Override
	public MemberVO read(String mem_id) {

		return dao.read(mem_id);
	}

	@Override
	public int update(MemberVO member) {
		return dao.update(member);
	}

	@Override
	public boolean idCheck(String id) {
		if (dao.read(id) != null)
			return true;
		else
			return false;
	}

	@Override
	public int drop(String id) {
		return dao.drop(id);
	}

	@Override
	public List<String> searchid(String mem_email) {
		return dao.searchid(mem_email);
	}

	@Override
	public int updatePass(String id, String email, String temppass) {
		return dao.updatePass(id,email,temppass);
	}

}

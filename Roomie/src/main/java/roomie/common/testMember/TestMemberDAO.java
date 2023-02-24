package roomie.common.testMember;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("testMemberDAO")
public class TestMemberDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 아이디 중복확인, 로그인 기능, 회원정보수정폼
	public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("testMember.selectMemberId", map);
	}
	
}

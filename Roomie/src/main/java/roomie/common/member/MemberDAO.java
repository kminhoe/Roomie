package roomie.common.member;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 이메일 회원가입
	public void insertEmailMember(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("member.insertEmailMember", map);
	}
	
	// 카카오 회원가입
	public void insertKakaoMember(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("member.insertKakaoMember", map);
	} 
	
	// 로그인, 아이디 중복체크
	public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.selectMemberId", map);
	}
	
	// 사용자 이름 중복체크
	public Map<String, Object> selectMemberUser(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.selectMemberUser", map);
	}
	
	//이메일 확인
    public Map<String, Object> emailcheck(String mail) throws Exception{
		return sqlSessionTemplate.selectOne("member.emailcheck",mail);
	} 
 
    //비밀번호 재설정
    public int passwordreset(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.update("member.passwordreset", map);
	}
    
    // 사용자 이름 조회
    public String selectMemberName(String name) throws Exception{
    	return sqlSessionTemplate.selectOne("member.selectMemberName", name);
    }
}

package roomie.common.member;

import java.util.Map;

public interface MemberService {

	/** 메일 전송
     *  @param subject 제목
     *  @param text 내용
     *  @param from 보내는 메일 주소
     *  @param to 받는 메일 주소  **/
    public boolean emailCodeSend(String subject, String text, String from, String to);
    public void insertEmailMember(Map<String, Object> map) throws Exception; // 이메일 회원가입
    public void insertKakaoMember(Map<String, Object> map) throws Exception; // 카카오 회원가입
    public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception; // 로그인, 아이디 중복체크
    public Map<String, Object> selectMemberUser(Map<String, Object> map) throws Exception; // 사용자 이름 중복체크
}

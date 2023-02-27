package roomie.common.testMember;

import java.util.Map;

public interface TestMemberLoginService {
	
	public Map<String, Object> selectMemberId(TestMemberDTO member) throws Exception;

}

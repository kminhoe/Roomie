package roomie.common.testMember;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("testMemberService")
public class TestMemberLoginServiceImpl implements TestMemberLoginService {

	@Resource(name="testMemberDAO")
	private TestMemberDAO testMemberDAO;
	
	@Override
	public Map<String, Object> selectMemberId(TestMemberDTO member) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("MEM_ID", member.getMEM_ID());
		
		return testMemberDAO.selectMemberId(map);
	}
	
	
}

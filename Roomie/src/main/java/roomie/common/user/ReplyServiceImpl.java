package roomie.common.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{

	@Resource(name="replyDAO")
	private ReplyDAO replyDAO;

	@Override
	public List<Map<String, Object>> commentList(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.commentList(map);
	}

	@Override
	public void insertComment(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		replyDAO.insertComment(map);
	}
}

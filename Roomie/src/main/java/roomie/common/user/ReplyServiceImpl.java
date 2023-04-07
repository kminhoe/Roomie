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
	public List<Map<String, Object>> commentList(int idx) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.commentList(idx);
	}
	
	public int insertComment(Map<String,Object>map) throws Exception {
		return replyDAO.insertComment(map);
	}
	
	public int deleteComment(int COM_IDX) throws Exception {
		return replyDAO.deleteComment(COM_IDX);
	}

	@Override
	public int insertReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.insertReply(map);
	}

	@Override
	public Map<String, Object> commentCounter(int idx) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.commentCounter(idx);
	}

	
}

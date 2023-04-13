package roomie.common.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;

	@Override
	public int registerBoard(Map<String, Object> map) throws Exception {
		System.out.println("service:" + map);
		
		int result = boardDAO.register(map);
		
		return result;
	}

	@Override
	public void inserthasg(Map<String, Object> map) throws Exception {
		
		boardDAO.hashinsert(map);		
	}



	@Override
	public List<Map<String, Object>> likeCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.likeCheck(map);
	}

	@Override
	public List<Map<String, Object>> selectBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectBoard(map);
	}

	@Override
	public Map<String, Object> memCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.memCheck(map);
	}

	@Override
	public List<Map<String, Object>> notFriend(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.notFriend(map);
	}

	@Override
	public void insertComment(Map<String, Object> map) throws Exception {
		
		boardDAO.insertComment(map);
		
	}

	@Override
	public List<Map<String, Object>> selectComment() throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectComment();
	}


	
	
	
	
} 

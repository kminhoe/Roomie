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
	public void likeinsert(Map<String, Object> map) throws Exception {
		
		boardDAO.likeinsert(map);
		
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
	
	
	
} 

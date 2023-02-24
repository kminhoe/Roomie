package roomie.common.board;

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
	
}

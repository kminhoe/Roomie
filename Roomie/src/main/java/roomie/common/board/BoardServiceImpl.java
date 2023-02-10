package roomie.common.board;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;

	@Override
	public void registerBoard(Map<String, Object> map) throws Exception {
		
		boardDAO.register(map);
	}
	
}

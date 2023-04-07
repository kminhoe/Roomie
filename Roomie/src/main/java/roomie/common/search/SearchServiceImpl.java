package roomie.common.search;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service
public class SearchServiceImpl implements SearchService {
	
	@Resource(name="searchDAO")
	private SearchDAO searchDAO;

	public List<Map<String, Object>> hashList(String idx) throws Exception {
		// TODO Auto-generated method stub
		return searchDAO.hashList(idx);
	} 

	@Override
	public List<Map<String, Object>> memberList(String idx) throws Exception {
		// TODO Auto-generated method stub
		return searchDAO.memberList(idx);
	}

	@Override
	public void insertKeyword(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		searchDAO.insertKeyword(map);
	}

	@Override
	public List<Map<String, Object>> searchList(int id) throws Exception {
		// TODO Auto-generated method stub
		return searchDAO.searchList(id);
	}

	@Override
	public void searchDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		searchDAO.searchDelete(map);
	}
	

	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return searchDAO.boardList(map);
	}

	@Override
	public Map<String, Object> memCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return searchDAO.memCheck(map);
	}


	
	
	

}

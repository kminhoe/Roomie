package roomie.common.search;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import roomie.common.dao.AbstractDAO;

@Repository("searchDAO")
public class SearchDAO extends AbstractDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> hashList(String id) throws Exception {
		return (List<Map<String, Object>>) selectList("search.hashList");
	}
	
	public List<Map<String, Object>> memberList(String id) throws Exception {
		return (List<Map<String, Object>>) selectList("search.memberList");
	}
	
	public void insertKeyword(Map<String, Object> map) throws Exception {
		 insert("search.insertKeyword", map);
	} 
	
	public List<Map<String, Object>> searchList(int id) throws Exception {
		return (List<Map<String, Object>>) selectList("search.searchList", id);
	}
	
	
	public void searchDelete(Map<String, Object> map) throws Exception {
		 delete("search.searchDelete", map);
	} 
	
	//boardList
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("search.boardList", map);
	}
	
	public Map<String, Object> memCheck(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("search.memCheck", map);
	}
	


}

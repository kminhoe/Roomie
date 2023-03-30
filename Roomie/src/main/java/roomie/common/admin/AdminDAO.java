package roomie.common.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import roomie.common.dao.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> memberSelect(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.memberSelect", map);
	}
	
	public List<Map<String, Object>> memberSelectOne(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>) selectList("admin.memberSelectOne",map);
		}
	
	public int warning(Map<String, Object> map) throws Exception{
		
		return sqlSessionTemplate.update("admin.warning", map);
		}
	
    public int nothing(Map<String, Object> map) throws Exception{
		
		return sqlSessionTemplate.update("admin.nothing", map);
		}
    
   public int lockMember(Map<String, Object> map) throws Exception{
		
		return sqlSessionTemplate.update("admin.lockMember", map);
		}
   
   public int delMember(Map<String, Object> map) throws Exception{
		
		return sqlSessionTemplate.update("admin.delMember", map);
		}
   
   public int changeStatus(Map<String, Object> map) throws Exception{
		
		return sqlSessionTemplate.update("admin.changeStatus", map);
		}
   
   //게시판
   public List<Map<String, Object>> boardSelect() throws Exception {
		return (List<Map<String, Object>>) selectList("admin.boardSelect");
	}
   
   public List<Map<String, Object>> boardSelectOne(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>) selectList("admin.boardSelectOne",map);
		}
   
   public Map<String, Object> boardLike(Map<String, Object> map) throws Exception{
		
		return sqlSessionTemplate.selectOne("admin.boardLike",map);
		}

}

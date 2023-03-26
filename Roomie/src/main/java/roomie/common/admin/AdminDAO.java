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
	
	public Map<String, Object> reportCheck(Map<String, Object> map) throws Exception{
		
		return sqlSessionTemplate.selectOne("admin.reportCheck",map);
		}

}

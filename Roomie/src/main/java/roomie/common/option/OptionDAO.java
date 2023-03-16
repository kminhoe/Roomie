package roomie.common.option;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("optionDAO")
public class OptionDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public Map<String, Object> checkpassword(int idx) throws Exception{
		
		System.out.println("DAO : "+idx);
		
		return sqlSessionTemplate.selectOne("option.checkpassword", idx);
	}
	
	public void changepass(Map<String, Object> map) throws Exception{
		 System.out.println("DAO : " + map);
		sqlSessionTemplate.update("option.changepass", map); 
	}
	
	public void memberDelete(Map<String, Object> map) throws Exception{
		System.out.println("DAO : "+ map);
		sqlSessionTemplate.update("option.memberDelete", map);
	}
	
	public void lockChange(Map<String, Object> map) throws Exception{
		
		sqlSessionTemplate.update("option.blockChange", map);
	}
	
	public Map<String, Object> lockList(int idx) throws Exception{
		
		
		return sqlSessionTemplate.selectOne("option.lockList", idx);
	}
	
	public void updateLock(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("option.updateLock", map);
	}
	
	public void updateOpen(int idx) throws Exception{
		sqlSessionTemplate.update("option.updateOpen", idx);
	}
	

}

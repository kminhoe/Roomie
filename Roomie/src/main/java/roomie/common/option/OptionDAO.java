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
		
		sqlSessionTemplate.update("option.changepass", map); 
	}

}

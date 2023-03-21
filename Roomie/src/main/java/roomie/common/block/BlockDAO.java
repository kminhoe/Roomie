package roomie.common.block;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("blockDAO")
public class BlockDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int blockInsert(Map<String, Object> map) throws Exception{

		return sqlSessionTemplate.insert("block.blockInsert", map);
	}

}

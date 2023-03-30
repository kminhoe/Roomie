package roomie.common.block;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("blockService")
public class BlockServiceImpl implements BlockService {


		
	@Resource(name="blockDAO")
    private BlockDAO blockDAO;
	
	@Override
	public int blockInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return blockDAO.blockInsert(map);
	}
	
	

}

package roomie.common.report;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("reportService")
public class ReportServiceImpl implements ReportService {
	
	@Resource(name="reportDAO")
	private ReportDAO reportDAO;

	@Override
	public int reportInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reportDAO.reportInsert(map);
	}
	
	
	
}

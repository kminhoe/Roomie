package roomie.common.board;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {
	
	@Resource
	private BoardService boardService;
	
	@PostMapping(value="/register.ya")
	public void insertBoard(MultipartFile[] uploadFile) throws Exception{
		/* ModelAndView mv = new ModelAndView("redirect:/roomie/boardList.ya"); */
		
		log.info("update ajax post......");
		
		String uploadFoler ="C:\\upload";
		
		for (MultipartFile multipartFile : uploadFile) {
			
			log.info("----------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: "+ uploadFileName);
			
			File saveFile = new File(uploadFoler, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}
		
//		System.out.println(map);
//		boardService.registerBoard(map);
//		
//		return mv;
	}
	
	@RequestMapping(value="boardList.ya")
	public ModelAndView boardList()throws Exception{
		ModelAndView mv = new ModelAndView("board/boardList");
		
		return mv;
	}

}

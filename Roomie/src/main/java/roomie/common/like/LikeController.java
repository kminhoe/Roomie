package roomie.common.like;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LikeController {
	
	@Resource
	private LikeService likeService;
	
	@RequestMapping(value="/likeBinsert.ya")
	public String likeBinsert(HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
		
		
        System.out.println("like insert : " +map);
		
        Map<String, Object> like = new HashMap<String, Object>();
		
		  like.put("LIKEB_MEM", map.get("idx")); 
		  like.put("LIKEB_BOARD",map.get("board_idx"));
		  
		  likeService.likeBinsert(like);
		 
        
		return "board/boardList"; 
	}
	
	
	@RequestMapping(value="/likeBdelete.ya")
	public String likeBdelete(HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
		
		
        System.out.println("like delete : " +map);
		
		
		 Map<String, Object> like = new HashMap<String, Object>();
		  
		  like.put("LIKEB_MEM", map.get("idx"));
		  like.put("LIKEB_BOARD",map.get("board_idx"));
		  
		   likeService.likeBdelete(like);
		 
		 
        
		return "board/boardList"; 
	}
	
	

}

package roomie.common.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class CommentController {
	
	@Resource(name="replyService")
	private ReplyService replyService; 
	
	// 댓글 리스트
		@RequestMapping(value="/selectComment.ya")
		@ResponseBody
		public ModelAndView selectComment(@RequestParam Map<String,Object> map) throws Exception {
			ModelAndView mv =new ModelAndView("profile/profile");
			return mv;
		}
		
		// 댓글 작성
		@RequestMapping(value="/insertComment.ya", method= {RequestMethod.POST})
		@ResponseBody
		public ModelAndView insertComment(@RequestParam Map<String, Object> map) throws Exception {
			ModelAndView mv = new ModelAndView("profile/profile");
			
			replyService.insertComment(map);
			System.out.println(map);
			
			return mv;
		}
//		
//		@RequestMapping(value = "/updatecomment.da", method= RequestMethod.POST)
//		@ResponseBody
//		public Map<String,Object> updateComment(@RequestBody Map<String, Object> map) throws Exception{
//			Map<String, Object> result = new HashMap<>();
//			
//			
//			try {
//				freeTalkService.updateComment(map);
//				result.put("status", "OK");
//			}catch(Exception e) {
//				e.printStackTrace();
//				result.put("status", "fail");
//			}
//			return result;
//		}
//		
//		@RequestMapping(value = "/deletecomment.da", method = RequestMethod.POST)
//		@ResponseBody
//		public Map<String, Object> deleteComment(@RequestParam("COM_IDX") int COM_IDX) throws Exception{
//			Map<String, Object> result = new HashMap<>();
//			
//			try {
//				freeTalkService.deleteComment(COM_IDX);
//				result.put("status", "OK");
//			}catch(Exception e) {
//				e.printStackTrace();
//				result.put("status", "fail");
//			}
//			
//			return result;
//			
//			
//		}

}

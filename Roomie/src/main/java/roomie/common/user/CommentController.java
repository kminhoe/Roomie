package roomie.common.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class CommentController {
	
	@Resource(name="replyService")
	private ReplyService replyService; 
	
	@RequestMapping(value="/selectComment.ya")
	@ResponseBody
	public List<Map<String,Object>> selectComment(Model model, @RequestParam(value="idx", required = false) int idx) throws Exception {
		
		List<Map<String,Object>> CommentMap = replyService.commentList(idx);
		Map<String,Object> commentCounter = replyService.commentCounter(idx);
		
		model.addAttribute("comment", CommentMap);
		model.addAttribute("counter", commentCounter);
		
		
		System.out.println(CommentMap);
		System.out.println(commentCounter);
		
		return CommentMap;
	}
	
	
	@RequestMapping(value="/insertComment.ya", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> insertComment(@RequestBody Map<String,Object> commentMap, HttpSession session) throws Exception {
		
		Map<String,Object> modifier = new HashMap<String,Object>();
		
		System.out.println("commentMap: " + commentMap);
		
		modifier.put("COM_IDX", commentMap.get("COM_IDX"));
		modifier.put("COM_ARTNO", commentMap.get("COM_ARTNO"));
		modifier.put("COM_WRITER", commentMap.get("COM_WRITER"));
		modifier.put("COM_CONT", commentMap.get("COM_CONT"));
		modifier.put("COM_REF", commentMap.get("COM_REF"));
		modifier.put("COM_STEP", commentMap.get("COM_STEP"));
		modifier.put("COM_LEVEL", commentMap.get("COM_LEVEL"));
		
		
		
		System.out.println("modifier map: " + modifier);
		
		
		replyService.insertComment(modifier);
			
		return commentMap;
		
	}
	
	@RequestMapping(value="/insertReReply.ya", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> insertReReply(@RequestBody Map<String,Object> commentMap, HttpSession session) throws Exception {
		
		Map<String,Object> modifier = new HashMap<String,Object>();
		
		System.out.println(" reply commentMap: " + commentMap);
		
		modifier.put("COM_IDX", commentMap.get("COM_IDX"));
		modifier.put("COM_ARTNO", commentMap.get("COM_ARTNO"));
		modifier.put("COM_WRITER", commentMap.get("COM_WRITER"));
		modifier.put("COM_CONT", commentMap.get("COM_CONT"));
		modifier.put("COM_REF", commentMap.get("COM_REF"));
		modifier.put("COM_STEP", ((int)commentMap.get("COM_STEP")+1));
		modifier.put("COM_LEVEL", ((int)commentMap.get("COM_LEVEL")+1));
		
		System.out.println(" reply modifier map: " + modifier);
		
		
		replyService.insertReply(modifier);
			
		return modifier;
		
	}
	
	
	
	@RequestMapping(value="/deleteComment.ya", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteComment(@RequestParam("COM_IDX") int COM_IDX) throws Exception {
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		replyService.deleteComment(COM_IDX);
		
		return result;
		
	}
	
}

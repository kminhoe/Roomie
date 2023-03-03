package roomie.common.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	@Resource(name="userService")
	private UserService userService;
	
	String base_path = "";
	String base_path2 = "";
	
	
	@RequestMapping(value="userProfile.ya", method=RequestMethod.GET)
	public ModelAndView userProfile(@RequestParam Map<String, Object> map, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView("/profile/profile");
		HttpSession session = req.getSession();
		mv.addObject("session", session.getAttribute("MEM_ID"));
		map.put("BO_MEM", map.get("mem_idx"));
		System.out.println(map);
		System.out.println("session: " + session.getAttribute("MEM_ID"));
		
		//member profile
		Map<String,Object> mapper = (HashMap<String,Object>)userService.userProfile(map);
		mv.addObject("user", mapper);
		
		//followers
		Map<String,Object> follower = new HashMap<String,Object>();
		follower.put("FRI_MEM", mapper.get("MEM_ID"));
		Map<String,Object> followerresult = userService.userFollower(follower);
		List<Map<String,Object>> followerList = userService.userFollowerList(follower);
		System.out.println("follower: " +follower);
		mv.addObject("follow", followerresult);
		mv.addObject("followerList", followerList);
		
		//following
		Map<String,Object> following = new HashMap<String,Object>();
		following.put("FOLLOWING", mapper.get("MEM_ID"));
		Map<String,Object> followingResult = userService.userFollowing(following);
		List<Map<String,Object>> followingList = userService.userFollowingList(following);
		mv.addObject("following", followingResult);
		mv.addObject("followingList", followingList);
		
		//boardCount
		Map<String,Object> board = userService.userBoard(map);
		board.put("BO_MEM", map.get("mem_idx"));
		mv.addObject("board", board);
		List<Map<String,Object>> boardList = userService.userBoardList(board);
		System.out.println(board);
		mv.addObject("boardList", boardList);
		return mv;
		
		
		
	}
	
	@RequestMapping("userModify.ya")
	public ModelAndView userModify(@RequestParam Map<String,Object>map, HttpServletRequest req, MultipartHttpServletRequest image) throws Exception {
		//HttpSession session = req.getSession();
		Integer mem_idx = Integer.parseInt((String)map.get("MEM_IDX"));
		System.out.println(map.get("MEM_IDX"));
		ModelAndView mv = new ModelAndView("redirect:/userProfile.ya?MEM_IDX=" + mem_idx);
		userService.userModify(map);
		return mv;
	}
	
	@RequestMapping(value="userModifyAjax.ya", method=RequestMethod.POST)
	public ModelAndView userModifyAjaxPOST(@RequestParam Map<String,Object>map, HttpServletRequest req) throws Exception {
		//Integer mem_idx = Integer.parseInt((String)map.get("MEM_IDX"));
		ModelAndView mv = new ModelAndView("/profile/profile");
		System.out.println(map);
		Map<String, Object> modifier = new HashMap<String,Object>();
		
		modifier.put("MEM_IDX", map.get("MEM_IDX"));
		modifier.put("MEM_ID", map.get("MEM_ID"));
		modifier.put("MEM_NAME", map.get("MEM_NAME"));
		modifier.put("MEM_CONT", map.get("MEM_CONT"));
		modifier.put("MEM_MBTI", map.get("MEM_MBTI"));
		
		userService.userModify(modifier);
		
//		HttpSession session = req.getSession();
//		
//		String path = session.getServletContext().getRealPath("/");
		
		
		return mv;
	}
	
	
	//Put all the code from service!!!!
	@ResponseBody
	@RequestMapping(value = "/uploadImage.ya" , method=RequestMethod.POST ,produces = "application/text; charset=utf8")
	public ModelAndView uploadImage(@RequestParam Map<String,Object> map, HttpServletRequest req) throws Exception {
		
		ModelAndView mv = new ModelAndView("/profile/profile");
		System.out.println(req.getParameter(""));
		System.out.println("Upload map: "+ map);
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)req;
		//req 로 넘어오는 데이터를 MultipartHttpServletRequest 로 변령을 해준다
		MultipartFile file = multipartHttpServletRequest.getFile("uploadFile");
		//이제 여기에서 앞에서 보낸 formData 의 key 값을 적어주면 해당 파일을 뽑아 올 수 있는 것이다 
		System.out.println(file.getOriginalFilename());
		
		System.out.println("Upload Map: " + file);
		String originalFilename = file.getOriginalFilename();
		long fileSize = file.getSize();
		byte[] data = file.getBytes();
		mkDir(req);
		
		FileOutputStream fos = new FileOutputStream(base_path + "/" + originalFilename);
		fos.write(file.getBytes());
		fos.close();
		System.out.println("file name: " + originalFilename);
		System.out.println("file size: " +fileSize);
		System.out.println("data: "+ data);
		
		System.out.println(map.get("MEM_IDX"));
		
		Map<String,Object> modifier = new HashMap<String,Object>();
		modifier.put("MEM_MEDIA", file.getOriginalFilename());
		modifier.put("MEM_IDX", map.get("MEM_IDX"));
		
		
		userService.uploadUserImg(modifier);
		
		
		return mv;
	}
	
	@RequestMapping(value="/userModifyMusic.ya")
	public ModelAndView openSpotify(@RequestParam Map<String,Object>map) throws Exception {
		ModelAndView mv = new ModelAndView("/profile/profile");
		System.out.println("Music Map: "+ map);
		Map<String, Object> modifier = new HashMap<String,Object>();
		
		modifier.put("MEM_IDX", map.get("MEM_IDX"));
		modifier.put("MEM_MUSIC", map.get("MEM_MUSIC"));
		
		
		userService.userModifyMusic(modifier);
		
		return mv;
	}
	
	@RequestMapping(value="/userFollow.ya")
	public ModelAndView userFollow(@RequestParam Map<String,Object>map, HttpServletRequest req)throws Exception{
		ModelAndView mv = new ModelAndView("/profile/profile");
		HttpSession session = req.getSession();
		map.put("FRI_MEM", session);
		
		Map<String,Object> mapper = new HashMap<String,Object>();
		mapper.put("FRI_MEM", session.getAttribute("MEM_ID"));
		mapper.put("FOLLOWING", map.get("FOLLOWING"));
		mapper.put("ISFOLLOW", "F");
		System.out.println("follow" + mapper);
		userService.follow(mapper);
		
		return mv;
	}
	
	@RequestMapping(value="/userUnFollow.ya")
	public ModelAndView userUnFollow(@RequestParam Map<String,Object>map, HttpServletRequest req)throws Exception{
		ModelAndView mv = new ModelAndView("/profile/profile");
		HttpSession session = req.getSession();
		map.put("FRI_MEM", session);
		
		Map<String,Object> mapper = new HashMap<String,Object>();
		
		mapper.put("FRI_MEM", session.getAttribute("MEM_ID"));
		mapper.put("FOLLOWING", map.get("FOLLOWING"));
		mapper.put("ISFOLLOW", "U");
		System.out.println("unfollow: " + mapper);
		userService.unFollow(mapper);
		return mv;
	}
	
	@RequestMapping(value="/userFollowing.ya")
	public ModelAndView userFollowing(@RequestParam Map<String,Object>map)throws Exception{
		ModelAndView mv = new ModelAndView("/profile/profile");
		return mv;
	}
	


	
	
	public void mkDir(HttpServletRequest req) throws IOException{
		
		
		HttpSession session = req.getSession();
		
		
		base_path2 = "/Users/gjy/git/Roomie/yeong-jun/Roomie/src/main/webapp/resources/upload/";
		base_path = session.getServletContext().getRealPath("/");

		
		System.out.println(base_path);
		
		File folder = new File(base_path);
		
		if(!folder.exists()) {
			folder.mkdir();
			System.out.println("folder created");
		} else {
			System.out.println("folder already exists");
		}
		
	}
	
	

}































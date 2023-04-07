package roomie.common.board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
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

import lombok.extern.log4j.Log4j;
import roomie.common.like.LikeService;

@Controller
@Log4j
public class BoardController {
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private LikeService likeService;
	
	@PostMapping(value="/register.ya", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> insertBoard(MultipartFile[] uploadFile, HttpSession session) throws Exception{
//		 ModelAndView mv = new ModelAndView("redirect:/boardList.ya"); 
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		log.info("update ajax post......");
		
		System.out.println("이거니?"+uploadFile);		
		String uploadFolder = session.getServletContext().getRealPath("/resources/files/board/");		
		System.out.println("경로 : " + uploadFolder);
		
		//String uploadFolderPath = getFolder();
		//다운로드받을 폴더 생성
		File uploadPath = new File(uploadFolder);
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		for (MultipartFile multipartFile : uploadFile) {
			
			log.info("----------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
		
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			System.out.println(uploadFileName);
			
			//IE일때 파일경로 수정
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: "+ uploadFileName);

			
			long dt = System.currentTimeMillis();
			
			System.out.println("데이터tostring : " +dt);

			
			uploadFileName = dt + "_" + uploadFileName;
			map.put("BO_MEDIA", uploadFileName);
			
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				
				multipartFile.transferTo(saveFile);

				
				if(Files.probeContentType(saveFile.toPath()).startsWith("image")) {
					map.put("BO_MEDIATYPE", "image");
			
						
				}else if(Files.probeContentType(saveFile.toPath()).startsWith("video")) {
					map.put("BO_MEDIATYPE", "video");
				}

				System.out.println(map);
				list.add(map);
				/* boardService.registerBoard(map); */
				System.out.println(list);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	

	
	@GetMapping("/display.ya")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String BO_MEDIA){
		log.info("BO_MEDIA:" + BO_MEDIA);
		
		File file = new File("c:\\upload\\" + BO_MEDIA);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping(value="/boardInsert.ya", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<ModelAndView> insertboard(HttpSession session, MultipartHttpServletRequest request, 
			@RequestParam Map<String, Object> map, String cidx) throws Exception {
		Map<String, Object> hm = new HashMap<>();
		ModelAndView mv = new ModelAndView("redirect:/roomie/boardList.ya");
		System.out.println("받았니? : " + request);
		System.out.println("받았니? : " + map);
		
		
		map.put("BO_MEM", Integer.parseInt(String.valueOf(session.getAttribute("MEM_IDX"))));
		
		boardService.registerBoard(map);
		
		if(map.get("BO_IDX") != null) {
			System.out.println("이건 먼데?" + map.get("BO_IDX"));
		
//		Integer idx = Integer.parseInt(String.valueOf(map.get("BO_IDX")));
		
			hm.put("HASH_BOARD", map.get("BO_IDX"));
		
			String hash = (String)map.get("BO_HASH");		
		
			System.out.println("확인 # 안나눔 : " + hash);
		
			StringTokenizer shop = new StringTokenizer(hash, "#");
			if(shop.hasMoreTokens()) {
				while(shop.hasMoreTokens()) {
					hm.put("HASH_KEYWORD", "#"+shop.nextToken());
			
					boardService.inserthasg(hm);
					System.out.println(hm);
				}
			}	
		}else {
			System.out.println(map.get("BO_IDX"));
		}
		mv.addObject("create", boardService.createContent(cidx));
		
		
		return ResponseEntity.ok(mv);
		
	}
	
	@RequestMapping(value="/boardList.ya")
	public ModelAndView boardList(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView("board/boardList");
		
		System.out.println("세션 확인 : " + session.getAttribute("MEM_IDX"));
		
		int idx1 = Integer.parseInt(String.valueOf(session.getAttribute("MEM_IDX")));
		
		//좋아요 확인
		Map<String, Object> map = new HashMap<>();
		

		map.put("LIKEB_MEM", session.getAttribute("MEM_IDX"));

		map.put("LIKEB_MEM", idx1);


		List<Map<String, Object>> like = boardService.likeCheck(map);
		
		System.out.println(like);
		
		mv.addObject("LIKEB", like);
		
		//like board 배열에 담기
		List<Integer> list1 = new ArrayList<Integer>();
				
		for(int i=0; i < like.size(); i++) {
			
			list1.add(i, Integer.parseInt(String.valueOf(like.get(i).get("LIKEB_BOARD"))));
			
		}
		
		System.out.println(list1);
		
		int idx = Integer.parseInt(String.valueOf(session.getAttribute("MEM_IDX")));
		
		//게시물 리스트
		
		Map<String, Object> fri = new HashMap<>();
		
		fri.put("MEM_IDX", idx);
		
		//나의 ID 구하기
		Map<String, Object> mem_id = boardService.memCheck(fri);
		
		String id = (String) mem_id.get("MEM_ID");
		
		System.out.println("회원 아이디 구하기" + id);
		
		
		Map<String, Object> fri_id = new HashMap<>();
		
		 fri_id.put("MEM_ID", id);
		
			
		 List<Map<String, Object>> board = boardService.selectBoard(fri_id);
			  
		 System.out.println(board);
			 
			  
		 mv.addObject("boardList", board);
			 
		 
		
		//본인 확인
		Map<String, Object> mem = new HashMap<>();
		
		mem.put("MEM_IDX", idx);
		
		Map<String, Object> member = boardService.memCheck(mem);
		
		mv.addObject("MEMBER", member);
		
		//좋아요 카운트
		

		
		
		
		return mv; 
	}
	
	

}

package roomie.common.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class AdminController {
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping(value="/adminMember.ya")
	public ModelAndView adminMember(HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView("admin/admin_m");
		
		//멤버 리스트
		Map<String, Object> mem = new HashMap<String, Object>();
		mem.put("x", "x");
		List<Map<String, Object>> list = adminService.memberSelect(mem);
		
		System.out.println(list);
		
		mv.addObject("member", list);
		
		

		return mv; 
	}
	

	//페이지 이동을 위한 데이터 받는 메소드
	@RequestMapping(value="/adminMemberC.ya")
	public ModelAndView adminMemberC(@RequestParam Map<String, Object> map)throws Exception{
		
		ModelAndView mv = new ModelAndView("admin/admin_m_d");
		
		int idx = Integer.parseInt(String.valueOf(map.get("mem_idx")));
		
		mv.addObject("mem_idx", idx);
		

		return mv; 
	}
	
	//회원 디테일로 이동하는 진짜 메소드
	@RequestMapping(value="/adminMemberD.ya")
	public ModelAndView adminMemberD(HttpServletRequest request, HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
		
		ModelAndView mv = new ModelAndView("admin/admin_m_d");
		
		int idx = Integer.parseInt(String.valueOf(request.getParameter("mem_idx")));
		
		//멤버 리스트
		Map<String, Object> mem = new HashMap<String, Object>();
		mem.put("MEM_IDX", idx);
		List<Map<String, Object>> list = adminService.memberSelectOne(mem);
				
		System.out.println("여기 확인 " + list.get(0));
				
		mv.addObject("MEMBER", list.get(0));
		mv.addObject("REPORT", list);
		
		int count1 = 0;
		int count2 = 0;
		
		//경고처리 수 구하기
		for(int i=0 ; i < list.size(); i++) {
			
			System.out.println("확인용 " + list.get(i).get("REP_STATUS"));
			
			if(list.get(i).get("REP_STATUS").equals("경고처리")) {
				
				count1++;
				
			}
		}
		
		//경고처리 5회 이상일 시 잠금 처리
		Map<String, Object> lock = new HashMap<String, Object>();
		
		if(count1 >= 5) {
			
			lock.put("MEM_IDX", idx);
			
			adminService.lockMember(lock);
			
		}
		
		//처리완료 수 구하기
		for(int i=0 ; i < list.size(); i++) {
					
			System.out.println("확인용 " + list.get(i).get("REP_STATUS"));
					
			if(list.get(i).get("REP_STATUS").equals("처리완료")) {
						
			count2++;
						
			}
		}
				
		//처리완료 10개 이상이면 탈퇴처리		
		Map<String, Object> complete = new HashMap<String, Object>();
				
			if(count2 >= 10) {
					
				complete.put("MEM_IDX", idx);
					
				adminService.delMember(complete);
					
		}
		
		mv.addObject("count1", count1);
		mv.addObject("count2", count2);

		return mv; 
	}
	
	//회원 신고 메소드 - 경고처리
	@RequestMapping(value="/warning.ya")
	public ModelAndView reportMember(HttpSession session, @RequestParam(value="rep_idx[]") ArrayList<Integer> rep_idx)throws Exception{
		
		ModelAndView mv = new ModelAndView("admin/admin_m_d");
		Map<String, Object> rep = new HashMap<String, Object>();
		
		System.out.println(rep_idx);
		
		System.out.println(rep_idx.size());
		
		for(int i=0; i < rep_idx.size() ; i++) {
			
		    rep.put("REP_IDX", rep_idx.get(i));
			
			adminService.warning(rep);
			
			
		}
		
	

		return mv; 
	}
	
	
	//회원 신고 메소드 - 해당없음
		@RequestMapping(value="/nothing.ya")
		public ModelAndView nothing(HttpSession session, @RequestParam(value="rep_idx[]") ArrayList<Integer> rep_idx)throws Exception{
			
			ModelAndView mv = new ModelAndView("admin/admin_m_d");
			
			Map<String, Object> rep = new HashMap<String, Object>();
			
			System.out.println(rep_idx);
			
			System.out.println(rep_idx.size());
			
			for(int i=0; i < rep_idx.size() ; i++) {
				
			    rep.put("REP_IDX", rep_idx.get(i));
				
				adminService.nothing(rep);
				
				
			}

			return mv; 
		}
	
		//회원 상태 변경
		@RequestMapping(value="/changeStatus.ya")
		public ModelAndView changeStatus(HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
			
			ModelAndView mv = new ModelAndView("admin/admin_m_d");
			
			Map<String, Object> change = new HashMap<String, Object>();
			
			change.put("MEM_IDX", Integer.parseInt(String.valueOf(map.get("mem_idx"))));
			
			System.out.println("데이터 확인 : " + map);
			
			//정상
			if(map.get("status").equals("0")) {
				adminService.changeStatus(change);				
			}
			
			//잠금
			if(map.get("status").equals("1")) {
				adminService.lockMember(change);
			}
			
			//강제탈퇴
			if(map.get("status").equals("2")) {
				adminService.delMember(change);
			}
			

			return mv; 
		}
	
		
		
		//어드민 멤버 검색
		@RequestMapping(value="/adminMemberS.ya")
		public ModelAndView adminMemberS(@RequestParam Map<String, Object> map)throws Exception{
			
			ModelAndView mv = new ModelAndView("redirect:/adminMember.ya");
			
            System.out.println(map);
			

			return mv; 
		}
		
		
		
	//게시판 관리@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value="/adminBoard.ya")
	public ModelAndView adminBoard(HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
		
		ModelAndView mv = new ModelAndView("admin/admin_b");

		
		List<Map<String, Object>> list = adminService.boardSelect();
		
		mv.addObject("BOARD", list);

		return mv; 
	}
	
	
	
	//페이지 이동을 위한 데이터 받는 메소드
		@RequestMapping(value="/adminBoardC.ya")
		public ModelAndView adminBoardC(@RequestParam Map<String, Object> map)throws Exception{
			
			ModelAndView mv = new ModelAndView("admin/admin_b_d");
			
			int idx = Integer.parseInt(String.valueOf(map.get("bo_idx")));
			
			mv.addObject("bo_idx", idx);
			

			return mv; 
		}
		
		//게시판 디테일로 이동하는 진짜 메소드
		@RequestMapping(value="/adminBoardD.ya")
		public ModelAndView adminBoardD(HttpServletRequest request, HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
			
			ModelAndView mv = new ModelAndView("admin/admin_b_d");
			
			int idx = Integer.parseInt(String.valueOf(request.getParameter("bo_idx")));
			
			System.out.println(idx);
			
			//게시판 리스트-선택
			Map<String, Object> board = new HashMap<String, Object>();
			board.put("BO_IDX", idx);
			List<Map<String, Object>> list = adminService.boardSelectOne(board);
			
			//좋아요 수
			Map<String, Object> like = adminService.boardLike(board);
			
			System.out.println(like);
			System.out.println(list);
			
			mv.addObject("BOARD", list.get(0));
			mv.addObject("REPORT", list);
			mv.addObject("COUNT", list.size());
			mv.addObject("LIKE", like);
			


			return mv; 
		}
	
	
	
	@RequestMapping(value="/adminComment.ya")
	public ModelAndView adminComment(HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
		
		ModelAndView mv = new ModelAndView("admin/admin_c");

		return mv; 
	}
	
}

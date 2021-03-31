package com.ic.myapp2;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.MyConstant;
import dao.BoardDao;
import util.Paging;
import vo.BoardVo;
import vo.MemberVo;

@Controller
@RequestMapping("/board")
public class BoardController {

	//확인사항 : BoardController생성(자동/수동 유무)
	//           수동 : <context:annotation-config/>
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
	BoardDao board_dao;

	public BoardDao getBoard_dao() {
		return board_dao;
	}

	public void setBoard_dao(BoardDao board_dao) {
		this.board_dao = board_dao;
	}
	
	//	/board/list.do
	//	/board/list.do?search=name&search_text=길동
	//	/board/list.do?page=2
	//	/board/list.do?page=2&search=name&search_text=길동	
	//	cf)Map으로 Parameter를 받을 경우 : @RequestParam Map mapParam
	
	@RequestMapping("/list.do")
	public String list(Integer page, String search, String search_text, Model model) {
		
		int nowPage = 1; //별다른 상황이 없으면 1페이지를 보여줘라
		if(page!=null) nowPage = page;
		
		//	start/end 계산
		int start = (nowPage-1) * MyConstant.Board.BLOCK_LIST + 1;
		int end	  = start + MyConstant.Board.BLOCK_LIST - 1;
		
		//검색에 대한 param
		if(search==null || search.isEmpty())search="all"; 
		
		//검색조건 + 페이지 조건
		Map map = new HashedMap(); //board.xml에서 map과 인자들의 값이 같아야 한다
		map.put("start", start);
		map.put("end", end);
		
		if(!search.equals("all")) {
			if(search.equals("name")) {
				map.put("name", search_text);	
			}else if(search.equals("subject")) {
				map.put("subject", search_text);
			}else if(search.equals("content")) {
				map.put("content", search_text);
			}else if(search.equals("name_subject_content")) {
				map.put("name", search_text);
				map.put("subject", search_text);
				map.put("content", search_text);
			}	
		}
		
		List<BoardVo> list = board_dao.selectList(map);
		
		//전체행수 구하기
		int rowTotal = board_dao.selectRowTotal(map); //50개 게시물에서 조건에 맞는 30개를 페이징 처리
		
		//검색필터
		String filter = String.format("search=%s&search_text=%s", search, search_text);
		
		//페이지 메뉴 만들기
		String pageMenu = Paging.getPaging("list.do", nowPage, rowTotal, MyConstant.Board.BLOCK_LIST, MyConstant.Board.BLOCK_PAGE);
		//System.out.println(pageMenu);
		
		//session show정보 삭제
		session.removeAttribute("show");
				
		//model통해서 DispatcherServlet에게 Data전달
		//결과적으로 request binding
		model.addAttribute("list",list);
		model.addAttribute("pageMenu", pageMenu);
		
		return "board/board_list";
	}
	
	//상세보기
	@RequestMapping("/view.do")
	public String view(int b_idx,Model model) {
		//  /board/view.do?b_idx=1
		
		BoardVo vo = board_dao.selectOne(b_idx);
		
		//해당게시물을 봤냐?(세션에 show라는 변수가 있냐?)
	    Object bShow = session.getAttribute("show");
		
	    if(bShow==null) {
			//조회수 증가(DML: insert,delete,update 결과값 int(처리된행수))
			int res = board_dao.update_readhit(b_idx);
			
			session.setAttribute("show", true);
	    }
	    
		// 결과적으로 request binding
		model.addAttribute("vo", vo);
		
		return "board/board_view";
	}
	
	//새글쓰기 폼띄우기
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		return "board/board_insert_form";
	}
	
	//새글쓰기
	@RequestMapping("/insert.do")
	public String insert(BoardVo vo) {
		// /board/insert.do?b_subject=제목&b_content=내용
		
		String b_content = vo.getB_content()
				             .replaceAll("\r\n", "<br>");
		vo.setB_content(b_content);
		
		//IP구하기
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		//세션에서 입력사용자 정보 구하기
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		//로그인 세션 만료시...
		if(user==null) {
			return "redirect:../member/login_form.do";
		}
		
		//유저 idx/name넣는다
		vo.setM_idx(user.getM_idx());
		vo.setM_name(user.getM_name());
		
		//DB Insert
		int res = board_dao.insert(vo);
				
		
		return "redirect:list.do";
	}
	
	
	
	//답글쓰기 폼띄우기
	@RequestMapping("/reply_form.do")
	public String reply_form(int b_idx) {
		
		return "board/board_reply_form";
	}
	
	//board/reply.do?b_idx=7&page=3&b_subject=잘들어가나&b_content=aaaa
	@RequestMapping("/reply.do")
	public  String reply(BoardVo vo, int page, Model model) {
		
		//textarea : \r\n -> html : <br>
		String b_content = vo.getB_content().replaceAll("\r\n", "<br>");
		vo.setB_content(b_content);
		
		//IP구하기
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		//세션에서 입력사용자 정보 구하기
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		//로그인 세션 만료시...
		if(user==null) {
		return "redirect:../member/login_form.do";
		}
		
		//유저 idx/name넣는다
		vo.setM_idx(user.getM_idx());
		vo.setM_name(user.getM_name());
		
		
		//기준글 정보 얻어온다
		BoardVo baseVo = board_dao.selectOne(vo.getB_idx());
		
		//기준글 보다 step이 큰 게시물의 step을 1씩 증가(답글이 들어갈 자리마련)
		int res = board_dao.update_step(baseVo);
		
		//답글의 정보를 설정(ref = base_ref   step=base_step + 1   depth = base_depth + 1)
		vo.setRef(baseVo.getRef());
		vo.setStep(baseVo.getStep()+1);
		vo.setDepth(baseVo.getDepth()+1);
		
		res = board_dao.reply(vo);		
		
		model.addAttribute("page", page);//redirect:list.do의 Query(parameter)로 이용된다
		
		return "redirect:list.do";
	}
	
	
	//삭제
	@RequestMapping("/delete.do")
	public String delete(int b_idx, int page, String search, String search_text, Model model) {
		// /board/delete.do?b_idx=3&page=4&search=subject&search_text=1등
		
		int res = board_dao.delete(b_idx);
		
		//1. Model을 통한 데이터는 누구한테 전달될까?		=>DispatcherServlet
		//2. 전달받은 누구는 현재 데이터를 어떻게 처리할까?	=>redirect: page Query로 사용
		//													list.do?page=3
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text", search_text);
		
		return "redirect:list.do"; //return "redirect:list.do" + page;
	}
	
	//수정폼 쓰기 띄우기
	@RequestMapping("/modify_form.do")
	public String modify_form(int b_idx, Model model) {
		
		//수정할 게시물 1건 얻어오기
		BoardVo vo = board_dao.selectOne(b_idx);
		
		//<br> -> \r\n
		String b_content = vo.getB_content().replaceAll("<br>", "\r\n");
		vo.setB_content(b_content);
		
		model.addAttribute("vo", vo);
		
		return "board/board_modify_form";
	}
	
	//수정하기
	@RequestMapping("/modify.do")
	public String modify(BoardVo vo, int page, String search, String search_text, Model model) {
		// /board/modify.do?b_idx=2&b_subject=제목&b_content=내용&page=2&search=name&search_text=길동
		
		String b_content = vo.getB_content().replaceAll("\r\n", "<br>");
		vo.setB_content(b_content);
		
		//IP구하기
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		//세션에서 입력사용자 정보 구하기
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		//로그인 세션 만료시...
		if(user==null) {
			model.addAttribute("reason", "invalid_session");
			return "redirect:../member/login_form.do";
		}	
		
		//유저 idx/name 넣는다
		//vo.setM_idx(user.getM_idx());
		//vo.setM_name(user.getM_name());
		
		//DB update
		int res = board_dao.update(vo);
		
		//수정 후 query로 전달된 페이를 유지하기 위함.
		model.addAttribute("b_idx", vo.getB_idx());
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text", search_text);
	
		return "redirect:list.do";
	}
}

package com.ic.myproject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/list.do")			
	public String list(Integer page, Model model) {
		
		int nowPage = 1;
		
		if(page!=null) nowPage = page;
		
		int start = (nowPage - 1) * MyConstant.Board.BLOCK_LIST + 1;
		
		int end = nowPage * MyConstant.Board.BLOCK_LIST;
		
		Map map = new HashMap();
		
		map.put("start", start);
		
		map.put("end", end);
				
		model.addAttribute("map", map);
		
		List<BoardVo> list = board_dao.selectList(map);
		
		int rowTotal = board_dao.selectRowTotal(map);
		
		String pageMenu = Paging.getPaging("list.do", nowPage, rowTotal, 
				MyConstant.Board.BLOCK_LIST, MyConstant.Board.BLOCK_PAGE);
		
		model.addAttribute("list", list);
		
		model.addAttribute("pageMenu", pageMenu);
		
		session.removeAttribute("show");
		
		return "board/board_list";
	}
	
	@RequestMapping("/view.do")
	public String view(int b_idx, Model model) {
		
		BoardVo vo = board_dao.selectOne(b_idx);
		
		Object bShow = session.getAttribute("show");
		
		if(bShow==null) {
			int res = board_dao.update_readhit(b_idx);
			session.setAttribute("show", true);
		}
		
		model.addAttribute("vo", vo);
		
		return "board/board_view";
	}
	
	
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		
	
		return "board/board_insert_form";
	}
	
	@RequestMapping("/insert.do")
	public String insert(BoardVo vo) {
		
		String b_ip = request.getRemoteAddr();
		
		vo.setB_ip(b_ip);
		
		MemberVo user = (MemberVo)session.getAttribute("user");
		
		//로그인세션 만료시
		if(user==null) {
			return "redirect:../member/login_form.do";
		}
		
		vo.setM_idx(user.getM_idx());
		
		vo.setM_nickname(user.getM_nickname());
		
		vo.setB_content(vo.getB_content().replaceAll("\r\n", "<br>"));
		
		board_dao.insert(vo);
		
		
		
		return "redirect:list.do";
	}
	
	
	@RequestMapping("/modify_form.do")
	public String modify_form(int b_idx, Model model) {
		
		BoardVo vo = board_dao.selectOne(b_idx);
		
		model.addAttribute("vo", vo);
		
		return "board/board_modify_form";
		
	}
	
	@RequestMapping("/modify.do")
	public String modify(BoardVo vo,int page,Model model ) {
		
		String b_ip = request.getRemoteAddr();
		
		vo.setB_ip(b_ip);
		
		MemberVo user = (MemberVo)session.getAttribute("user");
		
		//로그인세션 만료시
		if(user==null) {
			return "redirect:../member/login_form.do";
		}
		
		vo.setM_idx(user.getM_idx());
		
		vo.setM_nickname(user.getM_nickname());
		
		vo.setB_content(vo.getB_content().replaceAll("\r\n", "<br>"));
		
		board_dao.update(vo);
		
		model.addAttribute("b_idx", vo.getB_idx());
		
		model.addAttribute("page", page);
		
		return "redirect:view.do";
		
		
	}
	
	@RequestMapping("/like.do")
	public String like(int b_idx, int page, Model model) {
		
		board_dao.update_like(b_idx);
		
		model.addAttribute("page", page);		
		
		return "redirect:view.do?b_idx=" + b_idx;
	}
	
	
	@RequestMapping("/delete.do")
	public String delete(int b_idx, int page, Model model) {
		
		board_dao.delete(b_idx);
		
		model.addAttribute("page", page);
		
		return "redirect:list.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

package com.ic.myproject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDao;
import vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	MemberDao member_dao;

	public MemberDao getMember_dao() {
		return member_dao;
	}

	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
	}
	
	
	
	@RequestMapping("/member/list.do")
	public String list(Model model) {
		
		List<MemberVo> list = member_dao.selectList();
		
		model.addAttribute("list", list);
		
		return "member/member_list";
	}
	
	@RequestMapping("/member/insert_form.do")
	public String insert_form() {
		
		return "member/member_insert_form";
	}
	
	
	@RequestMapping(value="/member/check_id.do", produces="text/json;charset=utf-8;")
	@ResponseBody
	public String check_id(String m_id) {
		
		MemberVo vo = member_dao.selectOne(m_id);
		
		boolean bResult = (vo==null);
		
		String json = String.format("{\"result\":%b}", bResult);
		
		return json;
	}
	
	@RequestMapping("/member/insert.do")
	public String insert(MemberVo vo) {
		
		member_dao.insert(vo);
		
		return "redirect:/home.do";
	}
	
	@RequestMapping("/member/delete.do")
	public String delete(int m_idx) {
		
		member_dao.delete(m_idx);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/member/login_form.do")
	public String login_form(int loc, Model model) {
		
		model.addAttribute("loc", loc);
		
		return "member/member_login_form";
	}
	
	@RequestMapping("/member/login.do")
	public String login(String m_id, String m_pwd, String url,int loc, Model model) {
		
		MemberVo user = member_dao.selectOne(m_id);
		
		//아이디가 틀린경우
		if(user==null) {
			
			//정리 : Model을 통한 데이터는 DispatcherServlet에게 전달
			//용도 : forward로 반환되면 request binding
			//		 redirect로 반환되면 query로 사용된다
			model.addAttribute("reason","fail_id");
			model.addAttribute("url",url);
			return "redirect:login_form.do";
			//				 login_form.do?reason=fail_id	<= DispatcherServlet이 한다.
		}
		//비밀번호가 틀린경우
		if(!m_pwd.equals(user.getM_pwd())) {
			model.addAttribute("reason","fail_pwd");
			model.addAttribute("url",url);
			return "redirect:login_form.do";
		}
		
		session.setAttribute("user", user);
		
		if(url==null || url.isEmpty()) {
			return "redirect:../home.do";
		}
		
		if(loc==0) {
			return "redirect:../home.do";
		}
		
		if(loc==1) {
			return "redirect:../board/list.do";
		}
		
		return "redirect:"+url;
	}
	
	@RequestMapping("/member/logout.do")
	public String logout(int loc, Model model) {
		
		
		session.removeAttribute("user");
		
		if(loc==0) {
			return "redirect:../home.do";
		}
		
		if(loc==1) {
			return "redirect:../board/list.do";
		}
		
		return "redirect:../home.do";
	}
	
	@RequestMapping("/member/modify_form.do")
	public String modify_form(int m_idx, Model model) {
		
		MemberVo vo = member_dao.selectOne(m_idx);
		
		model.addAttribute("vo", vo);
		
		return "member/member_modify_form";
		
	}
	
	@RequestMapping("/member/modify.do")
	public String modify(MemberVo vo) {
		
		member_dao.update(vo);
		
		return "redirect:home.do";
	}
	
	
	
	
	
	
	
}

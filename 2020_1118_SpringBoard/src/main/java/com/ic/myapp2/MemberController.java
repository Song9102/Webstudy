package com.ic.myapp2;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDao;
import vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;

	MemberDao member_dao;

	public MemberDao getMember_dao() {
		return member_dao;
	}

	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
	}
	
	// 전체 페이지
	@RequestMapping("member/list.do")
	public String list(Model model) {
			
		List<MemberVo> list = member_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "member/member_list";
	}
	
	// 로그인 폼 띄우기
	@RequestMapping("/member/login_form.do")
	public String login_form() {
	
		return "member/member_login_form";
	}
	
	
	// 로그인 하기
	@RequestMapping("/member/login.do")
	public String login(String m_id, String m_pwd, String url, Model model) {

		// m_id에 해당되는 회원정보 1건을 얻어오기
		MemberVo user = member_dao.selectOne(m_id);

		// Model을 통한 데이터는 DispatcherServlet에게 전달
		// 용도 1  : forward로 반환하면 request binding
		// 용도 2 : redirect로 반환하면 query로 사용함
		
		// 아이디가 틀리면 로그인폼.do로 이동
		if (user == null) {
			model.addAttribute("reason", "fail_id");
			model.addAttribute("url", url);
			return "redirect:login_form.do";  // login_form.do?reason=fail_id =>DispatcherServlet이 알아서 붙힘
		}

		// 비밀번호가 틀린경우
		if (user.getM_pwd().equals(m_pwd) == false) {
			model.addAttribute("reason","fail_pwd");
			model.addAttribute("url", url);
			return "redirect:login_form.do";
		}

		// 2. session Binding 연결
		session.setAttribute("user", user);
		
		if(url==null || url.isEmpty()) {
			//메인페이지로 이동 => /board/list.do
			return "redirect:../board/list.do";
		}
		//url이 있다면 url로 이동해라
		return "redirect:" + url;
	}
	
	
	//로그 아웃
	@RequestMapping("/member/logout.do")
	public String logout(Model model){
		// 로그아웃 : 세션에서 User 정보를 삭제
		session.removeAttribute("user");
		
		
		return "redirect:../board/list.do";
	}
	
	
	@RequestMapping(value="/member/check_id.do", produces="text/json; charset=utf-8;")
	@ResponseBody
	public String check_id(String m_id, Model model) {
		
	
		// 2. param 수신
		//String m_id = request.getParameter("m_id");
		// 3. DB 확인& 얻어오기
		MemberVo vo = member_dao.selectOne(m_id);

		// 4. 체크아이디 == 아이디 확인
		boolean bResult = (vo == null);

		// 5. 응답처리
		String json = String.format("{\"result\":%b}", bResult);


		return json;
	}
	
	
	// 입력폼 띄우기
	@RequestMapping("/member/insert_form.do")
		public String insert_form() {
		
			return "member/member_insert_form";	
		}
	
	// 입력폼 띄우기2
	@RequestMapping("/member/insert_form2.do")
		public String insert_form2() {
		
			return "member/member_insert_form2";	
		}
	
		// 입력
		@RequestMapping("/member/insert.do")
		public String insert(MemberVo vo,Model model) {


			String m_ip = request.getRemoteAddr();
			vo.setM_ip(m_ip);
			
			int res = member_dao.insert(vo);

			return "redirect:list.do";
		}
	
	//삭제
	@RequestMapping("/member/delete.do")
	public String delete(int m_idx){
		
		int del = member_dao.delete(m_idx);

		return"redirect:list.do";
	}
	
	// 수정 폼 띄우기
	@RequestMapping("/member/modify_form.do")
	public String modify_form(int m_idx,Model model) {

		// idx에 해당하는 객체 1개 얻어오기
		MemberVo vo = member_dao.selectOne(m_idx);

		model.addAttribute("vo",vo);

		return "member/member_modify_form";
	}
	
	
	// 수정
	@RequestMapping("/member/modify.do")
	public String modify(MemberVo vo, Model model) {
		
		String m_ip=request.getRemoteAddr();
		vo.setM_ip(m_ip);
		
		int mod = member_dao.update(vo);
		
		model.addAttribute("vo",vo);

		return"redirect:list.do";
	}
	
	
	
}
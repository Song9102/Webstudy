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
	
	// ��ü ������
	@RequestMapping("member/list.do")
	public String list(Model model) {
			
		List<MemberVo> list = member_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "member/member_list";
	}
	
	// �α��� �� ����
	@RequestMapping("/member/login_form.do")
	public String login_form() {
	
		return "member/member_login_form";
	}
	
	
	// �α��� �ϱ�
	@RequestMapping("/member/login.do")
	public String login(String m_id, String m_pwd, String url, Model model) {

		// m_id�� �ش�Ǵ� ȸ������ 1���� ������
		MemberVo user = member_dao.selectOne(m_id);

		// Model�� ���� �����ʹ� DispatcherServlet���� ����
		// �뵵 1  : forward�� ��ȯ�ϸ� request binding
		// �뵵 2 : redirect�� ��ȯ�ϸ� query�� �����
		
		// ���̵� Ʋ���� �α�����.do�� �̵�
		if (user == null) {
			model.addAttribute("reason", "fail_id");
			model.addAttribute("url", url);
			return "redirect:login_form.do";  // login_form.do?reason=fail_id =>DispatcherServlet�� �˾Ƽ� ����
		}

		// ��й�ȣ�� Ʋ�����
		if (user.getM_pwd().equals(m_pwd) == false) {
			model.addAttribute("reason","fail_pwd");
			model.addAttribute("url", url);
			return "redirect:login_form.do";
		}

		// 2. session Binding ����
		session.setAttribute("user", user);
		
		if(url==null || url.isEmpty()) {
			//������������ �̵� => /board/list.do
			return "redirect:../board/list.do";
		}
		//url�� �ִٸ� url�� �̵��ض�
		return "redirect:" + url;
	}
	
	
	//�α� �ƿ�
	@RequestMapping("/member/logout.do")
	public String logout(Model model){
		// �α׾ƿ� : ���ǿ��� User ������ ����
		session.removeAttribute("user");
		
		
		return "redirect:../board/list.do";
	}
	
	
	@RequestMapping(value="/member/check_id.do", produces="text/json; charset=utf-8;")
	@ResponseBody
	public String check_id(String m_id, Model model) {
		
	
		// 2. param ����
		//String m_id = request.getParameter("m_id");
		// 3. DB Ȯ��& ������
		MemberVo vo = member_dao.selectOne(m_id);

		// 4. üũ���̵� == ���̵� Ȯ��
		boolean bResult = (vo == null);

		// 5. ����ó��
		String json = String.format("{\"result\":%b}", bResult);


		return json;
	}
	
	
	// �Է��� ����
	@RequestMapping("/member/insert_form.do")
		public String insert_form() {
		
			return "member/member_insert_form";	
		}
	
	// �Է��� ����2
	@RequestMapping("/member/insert_form2.do")
		public String insert_form2() {
		
			return "member/member_insert_form2";	
		}
	
		// �Է�
		@RequestMapping("/member/insert.do")
		public String insert(MemberVo vo,Model model) {


			String m_ip = request.getRemoteAddr();
			vo.setM_ip(m_ip);
			
			int res = member_dao.insert(vo);

			return "redirect:list.do";
		}
	
	//����
	@RequestMapping("/member/delete.do")
	public String delete(int m_idx){
		
		int del = member_dao.delete(m_idx);

		return"redirect:list.do";
	}
	
	// ���� �� ����
	@RequestMapping("/member/modify_form.do")
	public String modify_form(int m_idx,Model model) {

		// idx�� �ش��ϴ� ��ü 1�� ������
		MemberVo vo = member_dao.selectOne(m_idx);

		model.addAttribute("vo",vo);

		return "member/member_modify_form";
	}
	
	
	// ����
	@RequestMapping("/member/modify.do")
	public String modify(MemberVo vo, Model model) {
		
		String m_ip=request.getRemoteAddr();
		vo.setM_ip(m_ip);
		
		int mod = member_dao.update(vo);
		
		model.addAttribute("vo",vo);

		return"redirect:list.do";
	}
	
	
	
}
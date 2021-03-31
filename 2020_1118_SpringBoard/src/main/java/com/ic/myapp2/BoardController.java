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

	//Ȯ�λ��� : BoardController����(�ڵ�/���� ����)
	//           ���� : <context:annotation-config/>
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
	//	/board/list.do?search=name&search_text=�浿
	//	/board/list.do?page=2
	//	/board/list.do?page=2&search=name&search_text=�浿	
	//	cf)Map���� Parameter�� ���� ��� : @RequestParam Map mapParam
	
	@RequestMapping("/list.do")
	public String list(Integer page, String search, String search_text, Model model) {
		
		int nowPage = 1; //���ٸ� ��Ȳ�� ������ 1�������� �������
		if(page!=null) nowPage = page;
		
		//	start/end ���
		int start = (nowPage-1) * MyConstant.Board.BLOCK_LIST + 1;
		int end	  = start + MyConstant.Board.BLOCK_LIST - 1;
		
		//�˻��� ���� param
		if(search==null || search.isEmpty())search="all"; 
		
		//�˻����� + ������ ����
		Map map = new HashedMap(); //board.xml���� map�� ���ڵ��� ���� ���ƾ� �Ѵ�
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
		
		//��ü��� ���ϱ�
		int rowTotal = board_dao.selectRowTotal(map); //50�� �Խù����� ���ǿ� �´� 30���� ����¡ ó��
		
		//�˻�����
		String filter = String.format("search=%s&search_text=%s", search, search_text);
		
		//������ �޴� �����
		String pageMenu = Paging.getPaging("list.do", nowPage, rowTotal, MyConstant.Board.BLOCK_LIST, MyConstant.Board.BLOCK_PAGE);
		//System.out.println(pageMenu);
		
		//session show���� ����
		session.removeAttribute("show");
				
		//model���ؼ� DispatcherServlet���� Data����
		//��������� request binding
		model.addAttribute("list",list);
		model.addAttribute("pageMenu", pageMenu);
		
		return "board/board_list";
	}
	
	//�󼼺���
	@RequestMapping("/view.do")
	public String view(int b_idx,Model model) {
		//  /board/view.do?b_idx=1
		
		BoardVo vo = board_dao.selectOne(b_idx);
		
		//�ش�Խù��� �ó�?(���ǿ� show��� ������ �ֳ�?)
	    Object bShow = session.getAttribute("show");
		
	    if(bShow==null) {
			//��ȸ�� ����(DML: insert,delete,update ����� int(ó�������))
			int res = board_dao.update_readhit(b_idx);
			
			session.setAttribute("show", true);
	    }
	    
		// ��������� request binding
		model.addAttribute("vo", vo);
		
		return "board/board_view";
	}
	
	//���۾��� ������
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		return "board/board_insert_form";
	}
	
	//���۾���
	@RequestMapping("/insert.do")
	public String insert(BoardVo vo) {
		// /board/insert.do?b_subject=����&b_content=����
		
		String b_content = vo.getB_content()
				             .replaceAll("\r\n", "<br>");
		vo.setB_content(b_content);
		
		//IP���ϱ�
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		//���ǿ��� �Է»���� ���� ���ϱ�
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		//�α��� ���� �����...
		if(user==null) {
			return "redirect:../member/login_form.do";
		}
		
		//���� idx/name�ִ´�
		vo.setM_idx(user.getM_idx());
		vo.setM_name(user.getM_name());
		
		//DB Insert
		int res = board_dao.insert(vo);
				
		
		return "redirect:list.do";
	}
	
	
	
	//��۾��� ������
	@RequestMapping("/reply_form.do")
	public String reply_form(int b_idx) {
		
		return "board/board_reply_form";
	}
	
	//board/reply.do?b_idx=7&page=3&b_subject=�ߵ���&b_content=aaaa
	@RequestMapping("/reply.do")
	public  String reply(BoardVo vo, int page, Model model) {
		
		//textarea : \r\n -> html : <br>
		String b_content = vo.getB_content().replaceAll("\r\n", "<br>");
		vo.setB_content(b_content);
		
		//IP���ϱ�
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		//���ǿ��� �Է»���� ���� ���ϱ�
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		//�α��� ���� �����...
		if(user==null) {
		return "redirect:../member/login_form.do";
		}
		
		//���� idx/name�ִ´�
		vo.setM_idx(user.getM_idx());
		vo.setM_name(user.getM_name());
		
		
		//���ر� ���� ���´�
		BoardVo baseVo = board_dao.selectOne(vo.getB_idx());
		
		//���ر� ���� step�� ū �Խù��� step�� 1�� ����(����� �� �ڸ�����)
		int res = board_dao.update_step(baseVo);
		
		//����� ������ ����(ref = base_ref   step=base_step + 1   depth = base_depth + 1)
		vo.setRef(baseVo.getRef());
		vo.setStep(baseVo.getStep()+1);
		vo.setDepth(baseVo.getDepth()+1);
		
		res = board_dao.reply(vo);		
		
		model.addAttribute("page", page);//redirect:list.do�� Query(parameter)�� �̿�ȴ�
		
		return "redirect:list.do";
	}
	
	
	//����
	@RequestMapping("/delete.do")
	public String delete(int b_idx, int page, String search, String search_text, Model model) {
		// /board/delete.do?b_idx=3&page=4&search=subject&search_text=1��
		
		int res = board_dao.delete(b_idx);
		
		//1. Model�� ���� �����ʹ� �������� ���޵ɱ�?		=>DispatcherServlet
		//2. ���޹��� ������ ���� �����͸� ��� ó���ұ�?	=>redirect: page Query�� ���
		//													list.do?page=3
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text", search_text);
		
		return "redirect:list.do"; //return "redirect:list.do" + page;
	}
	
	//������ ���� ����
	@RequestMapping("/modify_form.do")
	public String modify_form(int b_idx, Model model) {
		
		//������ �Խù� 1�� ������
		BoardVo vo = board_dao.selectOne(b_idx);
		
		//<br> -> \r\n
		String b_content = vo.getB_content().replaceAll("<br>", "\r\n");
		vo.setB_content(b_content);
		
		model.addAttribute("vo", vo);
		
		return "board/board_modify_form";
	}
	
	//�����ϱ�
	@RequestMapping("/modify.do")
	public String modify(BoardVo vo, int page, String search, String search_text, Model model) {
		// /board/modify.do?b_idx=2&b_subject=����&b_content=����&page=2&search=name&search_text=�浿
		
		String b_content = vo.getB_content().replaceAll("\r\n", "<br>");
		vo.setB_content(b_content);
		
		//IP���ϱ�
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		//���ǿ��� �Է»���� ���� ���ϱ�
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		//�α��� ���� �����...
		if(user==null) {
			model.addAttribute("reason", "invalid_session");
			return "redirect:../member/login_form.do";
		}	
		
		//���� idx/name �ִ´�
		//vo.setM_idx(user.getM_idx());
		//vo.setM_name(user.getM_name());
		
		//DB update
		int res = board_dao.update(vo);
		
		//���� �� query�� ���޵� ���̸� �����ϱ� ����.
		model.addAttribute("b_idx", vo.getB_idx());
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text", search_text);
	
		return "redirect:list.do";
	}
}

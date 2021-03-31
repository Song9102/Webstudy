package com.ic.tx;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ProductService;
import vo.ProductVo;

@Controller
public class ProductController {

	ProductService product_service;
		
	public ProductService getProduct_service() {
		return product_service;
	}

	public void setProduct_service(ProductService product_service) {
		this.product_service = product_service;
	}

	

	@RequestMapping("/product/list.do")
	public String list(Model model) {
		
		//�԰�/���/��� ��� ��������
		Map map = product_service.selectList();
		
		//Model�� ���� request binding
		model.addAttribute("map", map);
		
		return "product/product_list";
	}
	
	//�԰���	//insert_in.do?name=TV&cnt=10
	@RequestMapping("/product/insert_in.do")
	public String insert_in(ProductVo vo) {
		
		try {
			
			int res = product_service.insert_in(vo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
		
		
		return "redirect:list.do";
	}
	
	//�԰����	delete_in.do?idx=10
		@RequestMapping("/product/delete_in.do")
		public String delete_in(int idx, Model model) {
			
			try {
				//�԰����(����)
				int res = product_service.delete_in(idx);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				String message = e.getMessage();
				//Model �뵵 : Query's Parameter�� ���
				model.addAttribute("error", message);
			}
			
			return "redirect:list.do";
		}
	
	//�����	insert_out.do?name=TV&cnt=10
	@RequestMapping("/product/insert_out.do")
	public String insert_out(ProductVo vo, Model model) {
	
		try {
			
			int res = product_service.insert_out(vo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			String message = e.getMessage();
			//Model �뵵 : Query's Parameter�� ���
			model.addAttribute("error", message);
			// list.do?error=remain_not
			// list.do?error=remain_lack
			
		}
		
		return "redirect:list.do";
	}
	
	
	
}

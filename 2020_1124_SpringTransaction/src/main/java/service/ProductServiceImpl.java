package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import dao.ProductDao;
import vo.ProductVo;

public class ProductServiceImpl implements ProductService {

	ProductDao product_in_dao;
	ProductDao product_out_dao;
	ProductDao product_remain_dao;
	ProductDao delete_in_dao;
	
	public ProductDao getDelete_in_dao() {
		return delete_in_dao;
	}

	public void setDelete_in_dao(ProductDao delete_in_dao) {
		this.delete_in_dao = delete_in_dao;
	}

	public ProductDao getProduct_in_dao() {
		return product_in_dao;
	}

	public void setProduct_in_dao(ProductDao product_in_dao) {
		this.product_in_dao = product_in_dao;
	}

	public ProductDao getProduct_out_dao() {
		return product_out_dao;
	}

	public void setProduct_out_dao(ProductDao product_out_dao) {
		this.product_out_dao = product_out_dao;
	}

	public ProductDao getProduct_remain_dao() {
		return product_remain_dao;
	}

	public void setProduct_remain_dao(ProductDao product_remain_dao) {
		this.product_remain_dao = product_remain_dao;
	}

	
	@Override
	public Map selectList() {
		// TODO Auto-generated method stub
		
		//입고 목록
		List<ProductVo> in_list = product_in_dao.selectList();
		//출고 목록
		List<ProductVo> out_list = product_out_dao.selectList();
		//재고 목록
		List<ProductVo> remain_list = product_remain_dao.selectList();		
		
		Map map = new HashMap();
		map.put("in_list", in_list);
		map.put("out_list", out_list);
		map.put("remain_list", remain_list);
		
		return map;
	}

	@Override
	public int insert_in(ProductVo vo) throws Exception {
		// TODO Auto-generated method stub
		
		//입고등록
		int res = product_in_dao.insert(vo);
		
		//재고등록/수정
		//현재 입고 상품이 재고 테이블에 있는지 확인
		ProductVo remainVo = product_remain_dao.selectOne(vo.getName());
		if(remainVo==null) {
			//재고 테이블에 등록정보가 없으면 추가
			res = product_remain_dao.insert(vo);
		}else {
			//재고 테이블에 등록정보가 있으면 수정
			//재고량 = 현 재고량 + 입고량
			int cnt = remainVo.getCnt() + vo.getCnt();
			remainVo.setCnt(cnt);
			res = product_remain_dao.update(remainVo);
		}
		
		return res;
	}
	
	@Override
	public int delete_in(int idx) throws Exception {
		// TODO Auto-generated method stub
		
		//입고 취소된 VO
		ProductVo inVo = product_in_dao.selectOne(idx);
		
		//입고 취소
		int res = product_in_dao.delete(idx);
		
		//재고 정보를 얻어오기
		ProductVo remainVo = product_remain_dao.selectOne(inVo.getName());
		
		if(inVo.getCnt() > remainVo.getCnt()) {
			//수량부족 정보 전송
			throw new Exception("remain_lack");	
			
		}
		
		int cnt = remainVo.getCnt() - inVo.getCnt();
		remainVo.setCnt(cnt);
		
		res = product_remain_dao.update(remainVo);
		
		
		
		return res;
	}

	@Override
	public int insert_out(ProductVo vo) throws Exception {
		// TODO Auto-generated method stub
		
		// 출고등록
		int res = product_out_dao.insert(vo);
		
		//출고 상품정보를 얻어오기
		ProductVo remainVo = product_remain_dao.selectOne(vo.getName());
		
		if(remainVo==null) {//출고한 상품이 재고 테이블에 없는 경우
			
			//내부에서 예외를 던지면 => Spring txManager에 의해서 rollback처리 된다
			throw new Exception("remain_not");
		}
		
		//재고량이 부족할 경우
		//	출고량 > 재고량
		if(vo.getCnt() > remainVo.getCnt()) {
			throw new Exception("remain_lack");	
		}
		
		//재고량 = 현재 재고량 - 출고량
		int cnt = remainVo.getCnt() - vo.getCnt();
		remainVo.setCnt(cnt);
		
		//재고량 수정(update)
		res = product_remain_dao.update(remainVo);
		
		return res;
	}

	

}

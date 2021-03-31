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
		
		//�԰� ���
		List<ProductVo> in_list = product_in_dao.selectList();
		//��� ���
		List<ProductVo> out_list = product_out_dao.selectList();
		//��� ���
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
		
		//�԰���
		int res = product_in_dao.insert(vo);
		
		//�����/����
		//���� �԰� ��ǰ�� ��� ���̺� �ִ��� Ȯ��
		ProductVo remainVo = product_remain_dao.selectOne(vo.getName());
		if(remainVo==null) {
			//��� ���̺� ��������� ������ �߰�
			res = product_remain_dao.insert(vo);
		}else {
			//��� ���̺� ��������� ������ ����
			//��� = �� ��� + �԰�
			int cnt = remainVo.getCnt() + vo.getCnt();
			remainVo.setCnt(cnt);
			res = product_remain_dao.update(remainVo);
		}
		
		return res;
	}
	
	@Override
	public int delete_in(int idx) throws Exception {
		// TODO Auto-generated method stub
		
		//�԰� ��ҵ� VO
		ProductVo inVo = product_in_dao.selectOne(idx);
		
		//�԰� ���
		int res = product_in_dao.delete(idx);
		
		//��� ������ ������
		ProductVo remainVo = product_remain_dao.selectOne(inVo.getName());
		
		if(inVo.getCnt() > remainVo.getCnt()) {
			//�������� ���� ����
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
		
		// �����
		int res = product_out_dao.insert(vo);
		
		//��� ��ǰ������ ������
		ProductVo remainVo = product_remain_dao.selectOne(vo.getName());
		
		if(remainVo==null) {//����� ��ǰ�� ��� ���̺� ���� ���
			
			//���ο��� ���ܸ� ������ => Spring txManager�� ���ؼ� rollbackó�� �ȴ�
			throw new Exception("remain_not");
		}
		
		//����� ������ ���
		//	��� > ���
		if(vo.getCnt() > remainVo.getCnt()) {
			throw new Exception("remain_lack");	
		}
		
		//��� = ���� ��� - ���
		int cnt = remainVo.getCnt() - vo.getCnt();
		remainVo.setCnt(cnt);
		
		//��� ����(update)
		res = product_remain_dao.update(remainVo);
		
		return res;
	}

	

}

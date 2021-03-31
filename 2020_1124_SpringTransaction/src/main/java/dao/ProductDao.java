package dao;

import java.util.List;

import vo.ProductVo;

public interface ProductDao {

	List<ProductVo>  selectList();
	ProductVo        selectOne(String name);
	int              insert(ProductVo vo);
	int              update(ProductVo vo);
	
	ProductVo        selectOne(int idx);
	int				 delete(int idx);
	
}

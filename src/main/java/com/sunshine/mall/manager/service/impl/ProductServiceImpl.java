package com.sunshine.mall.manager.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sunshine.mall.manager.bean.T_Product;
import com.sunshine.mall.manager.mapper.ProductMapper;
import com.sunshine.mall.manager.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Override
	public void saveProduct(T_Product product, List<String> filenamelist) {
		productMapper.insertProduct(product);
		Integer product_id = product.getId();
		productMapper.insertProductImageByProductId(product_id,filenamelist);
	}
}

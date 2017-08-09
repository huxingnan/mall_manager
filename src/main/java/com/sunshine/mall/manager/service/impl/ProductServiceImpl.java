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
	public void saveProduct(T_Product product) {
		productMapper.insertProduct(product);
	}

	@Override
	public void saveProductImageById(Integer product_id, List<String> filenamelist) {
		// TODO Auto-generated method stub
		productMapper.insertProductImageByProductId(product_id,filenamelist);
	}

}

package com.sunshine.mall.manager.service;

import java.util.List;

import com.sunshine.mall.manager.bean.T_Product;

public interface ProductService {

	void saveProduct(T_Product product);

	void saveProductImageById(Integer product_id, List<String> filenamelist);

}

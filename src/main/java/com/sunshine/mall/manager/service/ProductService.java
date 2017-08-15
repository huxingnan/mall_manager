package com.sunshine.mall.manager.service;

import java.util.List;

import com.sunshine.mall.manager.bean.T_Product;

public interface ProductService {

	/**
	 * 保存产品到数据库  保存产品图片 到数据库 
	 * @param product 产品
	 * @param filenamelist 
	 */
	void saveProduct(T_Product product, List<String> filenamelist);

	List<T_Product> getSpuInfoAll();


}

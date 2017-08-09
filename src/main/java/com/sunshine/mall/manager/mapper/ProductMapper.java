package com.sunshine.mall.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sunshine.mall.manager.bean.T_Product;

public interface ProductMapper {

	void insertProduct(T_Product product);

	void insertProductImageByProductId(@Param("product_id")Integer product_id, @Param("filenamelist")List<String> filenamelist);
	
}

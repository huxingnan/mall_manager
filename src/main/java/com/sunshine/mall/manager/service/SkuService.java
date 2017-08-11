package com.sunshine.mall.manager.service;

import java.util.List;

import com.sunshine.mall.manager.bean.Model_T_Attr;
import com.sunshine.mall.manager.bean.Model_T_Sku_Attr_Value;
import com.sunshine.mall.manager.bean.T_Product;

public interface SkuService {

	List<Model_T_Attr> getAttrByClassNumber2(Integer class_number_2);

	List<T_Product> getProductByClassNumber2AndBrandId(T_Product spu);

	void saveSkuInfo(Model_T_Sku_Attr_Value sku_Attr_Value);

}

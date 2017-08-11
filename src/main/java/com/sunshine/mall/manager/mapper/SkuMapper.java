package com.sunshine.mall.manager.mapper;

import java.util.List;

import com.sunshine.mall.manager.bean.Model_T_Attr;
import com.sunshine.mall.manager.bean.Model_T_Sku_Attr_Value;
import com.sunshine.mall.manager.bean.T_Product;

public interface SkuMapper {

	List<Model_T_Attr> selectAttrByClassNumber2(Integer class_number_2);

	List<T_Product> selectProductByClassNumber2AndBrandId(T_Product spu);

	void insertSku(Model_T_Sku_Attr_Value sku_Attr_Value);

}

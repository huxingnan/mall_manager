package com.sunshine.mall.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sunshine.mall.manager.bean.Model_Attr_Value_For_Sku;
import com.sunshine.mall.manager.bean.Model_T_Attr;
import com.sunshine.mall.manager.bean.Model_T_Sku_Attr_Value;
import com.sunshine.mall.manager.bean.T_Product;

public interface SkuMapper {

	List<Model_T_Attr> selectAttrByClassNumber2(Integer class_number_2);

	List<T_Product> selectProductByClassNumber2AndBrandId(T_Product spu);

	void insertSku(Model_T_Sku_Attr_Value sku_Attr_Value);

	void insertSku_Attr_Value(@Param("sku_id") Integer sku_id,@Param("product_id")Integer product_id, @Param("sku_Attr_Value_list")List<Model_Attr_Value_For_Sku> sku_Attr_Value_list);

}

package com.sunshine.mall.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunshine.mall.manager.bean.Model_T_Attr;
import com.sunshine.mall.manager.bean.Model_T_Sku_Attr_Value;
import com.sunshine.mall.manager.bean.T_Product;
import com.sunshine.mall.manager.mapper.SkuMapper;
import com.sunshine.mall.manager.service.SkuService;

@Service
public class SkuServiceImpl implements SkuService {

	@Autowired
	private SkuMapper skuMapper;
	
	@Override
	public List<Model_T_Attr> getAttrByClassNumber2(Integer class_number_2) {
		return skuMapper.selectAttrByClassNumber2(class_number_2);
	}

	@Override
	public List<T_Product> getProductByClassNumber2AndBrandId(T_Product spu) {
		return skuMapper.selectProductByClassNumber2AndBrandId(spu);
	}

	@Override
	public void saveSkuInfo(Model_T_Sku_Attr_Value sku_Attr_Value) {
		// TODO Auto-generated method stub
		
		skuMapper.insertSku(sku_Attr_Value);
		
	}

}

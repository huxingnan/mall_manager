package com.sunshine.mall.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sunshine.mall.manager.bean.Model_T_Attr;
import com.sunshine.mall.manager.bean.Model_T_Sku_Attr_Value;
import com.sunshine.mall.manager.bean.T_Product;
import com.sunshine.mall.manager.service.SkuService;
import com.sunshine.mall.manager.util.MyStringUtil;

@Controller
@RequestMapping("/sku")
public class SkuController {

	@Autowired
	private SkuService skuService;
	
	@RequestMapping("/sku_main")
	public String toMain() {
		return "/sku/sku_main";
	}
	
	@ResponseBody
	@RequestMapping("/getAttrByClassNumber2")
	public Object getAttrByClassNumber2(Integer class_number_2) {
		
		List<Model_T_Attr> attrList = skuService.getAttrByClassNumber2(class_number_2);
		
		return attrList;
	}
	
	@ResponseBody
	@RequestMapping("/getProductByClassNumber2AndBrandId")
	public Object getProductByClassNumber2AndBrandId(T_Product spu) {
		List<T_Product> spuList = skuService.getProductByClassNumber2AndBrandId(spu);
		return spuList;
	}
	
	@RequestMapping("/saveSkuInfo")
	public ModelAndView saveSkuInfo(Model_T_Sku_Attr_Value Sku_Attr_Value) {
      skuService.saveSkuInfo(Sku_Attr_Value);
      return MyStringUtil.WrappAndURLEncodingModel("sku/sku_main.do", "SKU商品库存管理", "redirect:/main.do");
	}
	
}

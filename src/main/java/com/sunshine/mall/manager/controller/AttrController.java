package com.sunshine.mall.manager.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sunshine.mall.manager.bean.Model_Attr_Value_List;
import com.sunshine.mall.manager.bean.Model_T_Attr;
import com.sunshine.mall.manager.service.AttrService;
import com.sunshine.mall.manager.util.MyStringUtil;

@Controller
@RequestMapping("/attr")
public class AttrController {
	
	@Autowired
	private AttrService attrService;
	
	@RequestMapping("/attr_main")
	public String goAttrMain() {
		return "/attr/attr_main";
	}
	
	@RequestMapping("/attr_add")
	public String goAttrAdd(Integer class_number_2,String class_name_2,ModelMap map) {
		map.put("class_number_2", class_number_2);
		map.put("class_name_2", class_name_2);
		return "/attr/attr_add";
	}
	
	@RequestMapping("/do_add_attr")
	public ModelAndView do_add_attr(Model_Attr_Value_List attr_value_model) {
		attrService.saveAttr(attr_value_model);
		return MyStringUtil.WrappAndURLEncodingModel("attr/attr_main.do", "商品属性信息管理", "redirect:/main.do");
	}
	
	@ResponseBody
	@RequestMapping("/query_attr_by_class_number2_and_attr_name")
	public Object query_attr_by_class_number2_and_attr_name(Integer class_number_2,String attr_name) {
		Model_T_Attr  model_attr=attrService.query_attr_by_class_number2_and_attr_name(class_number_2,attr_name);
		//System.out.println();
		if(model_attr == null) {
			return "{\"success\":true}";
		}
		return model_attr;
	}
	
	
}

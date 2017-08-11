package com.sunshine.mall.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sunshine.mall.manager.bean.Model_Attr_Value_List;
import com.sunshine.mall.manager.service.AttrService;

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
		ModelAndView view=new ModelAndView("redirect:/attr/attr_main.do");
		view.addObject("success", "保存成功");
		return view;
	}
	
	
}

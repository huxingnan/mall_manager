package com.sunshine.mall.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attr")
public class AttrController {
  
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
}

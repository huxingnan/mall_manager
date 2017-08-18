package com.sunshine.mall.manager.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunshine.mall.manager.bean.Model_Source;
import com.sunshine.mall.manager.service.IndexService;

@Controller
public class IndexController {

	@Autowired
	IndexService indexService ;
	
	@RequestMapping("/main")
	 public String toIndex(ModelMap map,HttpServletRequest request) {
		String path = request.getParameter("path");
		String title = request.getParameter("title");
		map.put("path", path);
		map.put("title", title);
		if("".equals(path) || path == null) {
			map.put("path", "0");
		}
		 return "main";
	 }
	@ResponseBody
	@RequestMapping("/main_getwest")
	public Object getWest() {
		List<Model_Source> list=indexService.getMainWest();
		return list;
	}
	
}

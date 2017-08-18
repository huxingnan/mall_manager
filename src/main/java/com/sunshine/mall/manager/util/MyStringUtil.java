package com.sunshine.mall.manager.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

public class MyStringUtil {
	
	public static String getFileSuffix(MultipartFile file) {
		String filename=file.getOriginalFilename();
		int index=filename.lastIndexOf(".");
		return filename.substring(index);
	}
	
	
	public static ModelAndView WrappAndURLEncodingModel(String path,String title,String redirect)  {
		ModelAndView view = new ModelAndView(redirect);
		view.addObject("path", path);
		try {
			title=URLEncoder.encode(title, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		view.addObject("title", title);
		return view;
	}
}

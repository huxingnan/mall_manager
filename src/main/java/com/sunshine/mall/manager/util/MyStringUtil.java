package com.sunshine.mall.manager.util;

import org.springframework.web.multipart.MultipartFile;

public class MyStringUtil {
	
	public static String getFileSuffix(MultipartFile file) {
		String filename=file.getOriginalFilename();
		int index=filename.lastIndexOf(".");
		return filename.substring(index);
	}
	
}

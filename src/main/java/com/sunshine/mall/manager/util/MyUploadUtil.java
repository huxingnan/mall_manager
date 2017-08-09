package com.sunshine.mall.manager.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;


public class MyUploadUtil {
	
	public static List<String> saveFile(MultipartFile[] files) {
		
		List<String> filenamelist = new ArrayList<String>();
		
		for(int i = 0 ; i < files.length;i++){
			if(files[i].getSize() == 0 || files[i].getOriginalFilename() == null) {
				continue;
			}
			String suffix = MyStringUtil.getFileSuffix(files[i]);
			String savePath  = MyPropertieUtil.getSavePath();
			String imageName=System.currentTimeMillis()+suffix;
			File fileRealPath = new File(savePath,imageName);
			try {
				files[i].transferTo(fileRealPath);
			} catch (IOException e) {
				e.printStackTrace();
			}
			filenamelist.add(imageName);
		}
		return filenamelist;
	}
	
}

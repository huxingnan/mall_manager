package com.sunshine.mall.manager.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MyPropertieUtil {

	private static Properties properties = new Properties();

	public static String getSavePath() {
		InputStream inStream = null;
		inStream = MyPropertieUtil.class
				.getResourceAsStream("/uploadpath.properties");
		String path = "";
		try {
			properties.load(inStream);
			String path_type = properties.getProperty("path_type");
			path = properties.getProperty(path_type);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (inStream != null) {
				try {
					inStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return path;
	}
}

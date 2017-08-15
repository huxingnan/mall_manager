package com.sunshine.mall.manager.service;

import java.util.List;

import com.sunshine.mall.manager.bean.Model_Attr_Value_List;
import com.sunshine.mall.manager.bean.Model_T_Attr;

public interface AttrService {
   
	void saveAttr(Model_Attr_Value_List attr_value_model);

	Model_T_Attr query_attr_by_class_number2_and_attr_name(Integer class_number_2, String attr_name);
   
}

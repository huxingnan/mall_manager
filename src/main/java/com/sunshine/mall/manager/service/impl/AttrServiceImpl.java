package com.sunshine.mall.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sunshine.mall.manager.bean.Model_Attr_Value_List;
import com.sunshine.mall.manager.bean.Model_T_Attr;
import com.sunshine.mall.manager.bean.Object_T_Attr;
import com.sunshine.mall.manager.mapper.AttrMapper;
import com.sunshine.mall.manager.service.AttrService;

@Service
public class AttrServiceImpl implements AttrService {
	
	@Autowired
	private AttrMapper attrMapper;

	@Override
	public void saveAttr(Model_Attr_Value_List attr_value_model) {
		//attr_value_model.get
		List<Object_T_Attr> object_T_Attr_List = attr_value_model.getObject_T_Attr_List();
		Map map = new HashMap();
		Integer class_number_2 = attr_value_model.getClass_number_2();
		String class_name_2 = attr_value_model.getClass_name_2();
		for (Object_T_Attr object_T_Attr : object_T_Attr_List) {
			map.put("id", 0);
			map.put("class_number_2",class_number_2);
			map.put("attr_name", object_T_Attr.getAttr_name());
			attrMapper.insertAttr(map);
			Integer attr_id = (Integer)map.get("id");
			int size = object_T_Attr.getT_Attr_Value_list().size();
			System.out.println(size);
			attrMapper.insertAttrValue( object_T_Attr.getT_Attr_Value_list(),attr_id);
		}
	}

	@Override
	public Model_T_Attr query_attr_by_class_number2_and_attr_name(Integer class_number_2, String attr_name) {
		// TODO Auto-generated method stub
		return attrMapper.select_attr_by_class_number2_and_attr_name(class_number_2,attr_name);
	}

}

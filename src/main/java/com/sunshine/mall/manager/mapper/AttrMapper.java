package com.sunshine.mall.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sunshine.mall.manager.bean.T_Attr_Value;

public interface AttrMapper {

	void insertAttr(Map map);

	void insertAttrValue(@Param("t_Attr_Value_list")  List<T_Attr_Value> t_Attr_Value_list, @Param("attr_id") Integer attr_id);
	
}

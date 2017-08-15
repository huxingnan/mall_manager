package com.sunshine.mall.manager.bean;

import java.util.List;

public class Model_T_Attr extends T_Attr {

	private List<T_Attr_Value> attrValueList ;
	//<input name="attrValueList[0].attr_value" value="3" />

	public List<T_Attr_Value> getAttrValueList() {
		return attrValueList;
	}

	public void setAttrValueList(List<T_Attr_Value> attrValueList) {
		this.attrValueList = attrValueList;
	}
	
	
}

package com.sunshine.mall.manager.bean;

public class T_Attr {

	private Integer Id;
	private String attr_name;
	private Integer enabled;
	private Integer class_number_2;
	private String create_time;
	
	
	
	@Override
	public String toString() {
		return "T_Attr [Id=" + Id + ", attr_name=" + attr_name + ", enabled=" + enabled + ", class_number_2="
				+ class_number_2 + ", create_time=" + create_time + "]";
	}
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getAttr_name() {
		return attr_name;
	}
	public void setAttr_name(String attr_name) {
		this.attr_name = attr_name;
	}
	public Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}
	public Integer getClass_number_2() {
		return class_number_2;
	}
	public void setClass_number_2(Integer class_number_2) {
		this.class_number_2 = class_number_2;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	
	

}

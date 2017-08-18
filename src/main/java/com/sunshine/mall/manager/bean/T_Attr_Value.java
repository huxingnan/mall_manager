package com.sunshine.mall.manager.bean;



public class T_Attr_Value {
	/**
	 * 
	 */
	private Integer Id;
	/**
	 * 
	 */
	private String attr_value;
	/**
	 * 
	 */
	private String enabled;
	
	private Integer attr_id;
	
	private String attr_value_name;
	
	private String create_time;
	
	@Override
	public String toString() {
		return "T_Attr_Value [Id=" + Id + ", attr_value=" + attr_value + ", enabled=" + enabled + ", attr_id=" + attr_id
				+ ", attr_value_name=" + attr_value_name + ", create_time=" + create_time + "]";
	}
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getAttr_value() {
		return attr_value;
	}
	public void setAttr_value(String attr_value) {
		this.attr_value = attr_value;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public Integer getAttr_id() {
		return attr_id;
	}
	public void setAttr_id(Integer attr_id) {
		this.attr_id = attr_id;
	}
	public String getAttr_value_name() {
		return attr_value_name;
	}
	public void setAttr_value_name(String attr_value_name) {
		this.attr_value_name = attr_value_name;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
}

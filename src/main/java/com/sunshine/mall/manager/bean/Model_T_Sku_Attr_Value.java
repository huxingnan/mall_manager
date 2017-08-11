package com.sunshine.mall.manager.bean;

import java.math.BigDecimal;
import java.util.List;

public class Model_T_Sku_Attr_Value {
	
	private Integer Id;
	private Integer product_id;
	private Integer product_amount;
	private BigDecimal  price;
	private String sku_name;
	private List<Model_Attr_Value_For_Sku> sku_Attr_Value_list;
	
	/*
class_number_1:8
class_number_2:17
brand_id:2
product_id:18
sku_name:联想金刚狼游戏本（i7 750Gb  4G IPS）
product_amount:1000
price:4000.00
sku_Attr_Value_list[0].attr_name_id:8
sku_Attr_Value_list[1].attr_name_id:9
sku_Attr_Value_list[2].attr_name_id:10
sku_Attr_Value_list[0].attr_value_id:30
sku_Attr_Value_list[1].attr_value_id:32
sku_Attr_Value_list[2].attr_value_id:35
	 */
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public Integer getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(Integer product_amount) {
		this.product_amount = product_amount;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getSku_name() {
		return sku_name;
	}
	public void setSku_name(String sku_name) {
		this.sku_name = sku_name;
	}
	public List<Model_Attr_Value_For_Sku> getSku_Attr_Value_list() {
		return sku_Attr_Value_list;
	}
	public void setSku_Attr_Value_list(List<Model_Attr_Value_For_Sku> sku_Attr_Value_list) {
		this.sku_Attr_Value_list = sku_Attr_Value_list;
	}
}

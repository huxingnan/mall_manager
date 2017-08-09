package com.sunshine.mall.manager.bean;

public class T_Product {

    private Integer Id;
	private String product_name;
	private String product_image;
	private Integer class_number_1;
	private Integer class_number_2;
	private Integer brand_id;
	private String product_description;
	
	
	
	
	@Override
	public String toString() {
		return "T_Product [Id=" + Id + ", product_name=" + product_name + ", product_image=" + product_image
				+ ", class_number_1=" + class_number_1 + ", class_number_2=" + class_number_2 + ", brand_id=" + brand_id
				+ ", product_description=" + product_description + "]";
	}
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public Integer getClass_number_1() {
		return class_number_1;
	}
	public void setClass_number_1(Integer class_number_1) {
		this.class_number_1 = class_number_1;
	}
	public Integer getClass_number_2() {
		return class_number_2;
	}
	public void setClass_number_2(Integer class_number_2) {
		this.class_number_2 = class_number_2;
	}
	public Integer getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(Integer brand_id) {
		this.brand_id = brand_id;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	
	
	

}

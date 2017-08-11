package com.sunshine.mall.manager.bean;

public class T_Sku {

	private Integer Id;
	private Integer product_id;
	private Integer product_amount;
	private String  price;
	private Integer sku_name;
	private Integer sku_sales;
	private Integer address;
	
	
	
	
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Integer getSku_name() {
		return sku_name;
	}
	public void setSku_name(Integer sku_name) {
		this.sku_name = sku_name;
	}
	public Integer getSku_sales() {
		return sku_sales;
	}
	public void setSku_sales(Integer sku_sales) {
		this.sku_sales = sku_sales;
	}
	public Integer getAddress() {
		return address;
	}
	public void setAddress(Integer address) {
		this.address = address;
	}
}

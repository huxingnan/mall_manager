package com.sunshine.mall.manager.bean;

import java.util.List;

public class Model_Source {
   private Integer id;
   private String index_name;
   private String url;
   private Integer pid;
   private List<Object_Source> childrenList;
   
   
   
@Override
public String toString() {
	return "Model_Source [id=" + id + ", index_name=" + index_name + ", url=" + url + ", childrenList=" + childrenList
			+ "]";
}


public Integer getPid() {
	return pid;
}


public void setPid(Integer pid) {
	this.pid = pid;
}


public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getIndex_name() {
	return index_name;
}
public void setIndex_name(String index_name) {
	this.index_name = index_name;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public List<Object_Source> getChildrenList() {
	return childrenList;
}
public void setChildrenList(List<Object_Source> childrenList) {
	this.childrenList = childrenList;
}
   
   
}

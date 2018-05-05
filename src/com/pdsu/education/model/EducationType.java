package com.pdsu.education.model;

public class EducationType {
   private Integer id;
   private String name;
   private String updateTime;
   
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getUpdateTime() {
	return updateTime;
}
public void setUpdateTime(String updateTime) {
	this.updateTime = updateTime;
}
@Override
public String toString() {
	return "EducationType [id=" + id + ", name=" + name + ", updateTime=" + updateTime + "]";
}
}

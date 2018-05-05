package com.pdsu.education.model;

public class AgeRange {
	private Integer id;
	private Integer startAge;
	private Integer endAge;
	private String name;
	private String updateTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStartAge() {
		return startAge;
	}
	public void setStartAge(Integer startAge) {
		this.startAge = startAge;
	}
	public Integer getEndAge() {
		return endAge;
	}
	public void setEndAge(Integer endAge) {
		this.endAge = endAge;
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
		return "AgeRange [id=" + id + ", startAge=" + startAge + ", endAge=" + endAge + ", name=" + name
				+ ", updateTime=" + updateTime + "]";
	}
}

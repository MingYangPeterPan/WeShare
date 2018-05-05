package com.pdsu.education.model;

public class Video {
	
	private Integer id;
	private String title;
	private String discripe;
	private String image;
	private String video;
	private Integer contentTypeId;
	private String updateTime;
	private Integer age;
	private Integer contentType;
	
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Integer getContentType() {
		return contentType;
	}
	public String getDiscripe() {
		return discripe;
	}
	public void setDiscripe(String discripe) {
		this.discripe = discripe;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public void setContentType(Integer contentType) {
		this.contentType = contentType;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime.substring(0, updateTime.length()-2);
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getContentTypeId() {
		return contentTypeId;
	}
	public void setContentTypeId(Integer contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "News [title=" + title + ", image=" + image + ", content=" + discripe
				+ "]";
	}
}

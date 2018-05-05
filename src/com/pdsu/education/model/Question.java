package com.pdsu.education.model;

import java.util.List;

/**
 * Question model class
 */
public class Question {

    private Integer id;
    private String title;
    private String content;
    private String image;
    private Integer userId;
    private String userName;
    private String userImage;
    private String updateTime;
    private Integer answersCount;
    private List<Answer> answers;
    
    
	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public Integer getAnswersCount() {
		if(answers !=null) {
			return answers.size();
		} else {
			return 0;
		}
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public void setAnswersCount(Integer answersCount) {
		this.answersCount = answersCount;
	}
	public List<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", content=" + content + ", image=" + image + ", userId="
				+ userId + ", updateTime=" + updateTime +",userImage="+ userImage + "]";
	}
}

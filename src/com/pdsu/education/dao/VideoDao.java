package com.pdsu.education.dao;

import java.util.List;

import com.pdsu.education.model.Child;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
import com.pdsu.education.model.Video;

public interface VideoDao {
	public void createVideo(Video video );
	public List<Video> queryAllVideo(Pagination pagination,Integer rangeId,Integer typeId);
	public Integer getVideoCount(String keyword,Integer rangeId,Integer typeId);
	public Integer getContentTypeId(Integer age, Integer type);
	public Video getVideoById(Integer videoId);
	public List<Video> queryHotVideo(User user, Child child);
	public List<Video> getVideosByType(User user, Child child,Integer typeId);
}

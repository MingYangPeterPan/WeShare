package com.pdsu.education.service;

import java.util.List;

import com.pdsu.education.model.Child;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
import com.pdsu.education.model.Video;

public interface VideoService {

	public void saveVideo(Video video);
	public List<Video> getVideoList(Pagination pagination,Integer rangeId,Integer typeId);
	public Video FindVideoById(Integer videoId);
	public List<Video> getHotVideo(User user, Child child);
	public List<Video> FindVideosByType(User user, Child child,Integer typeId);
	
}

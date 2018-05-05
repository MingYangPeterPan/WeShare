package com.pdsu.education.service.impl;

import java.util.List;

import com.pdsu.education.dao.VideoDao;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
import com.pdsu.education.model.Video;
import com.pdsu.education.service.VideoService;

public class VideoServiceImpl implements VideoService {
	
	private VideoDao videoDao;

    public void setVideoDao(VideoDao videoDao) {
        this.videoDao = videoDao;
    }
	
    @Override
    public void saveVideo(Video video) {
    	videoDao.createVideo(video);
    }

	@Override
	public List<Video> getVideoList(Pagination pagination,Integer rangeId,Integer typeId) {
		List<Video> videoList = videoDao.queryAllVideo(pagination,rangeId,typeId);
		return videoList;
	}

	@Override
	public Video FindVideoById(Integer videoId) {
		Video video = videoDao.getVideoById(videoId);
		return video;
	}

	@Override
	public List<Video> getHotVideo(User user, Child child) {
		return videoDao.queryHotVideo(user, child);
	}

	@Override
	public List<Video> FindVideosByType(User user, Child child, Integer typeId) {
		return videoDao.getVideosByType(user, child, typeId);
	}
}

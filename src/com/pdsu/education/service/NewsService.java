package com.pdsu.education.service;

import java.util.List;

import com.pdsu.education.model.Child;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;

public interface NewsService {

	public void saveNews(News news);
	public List<News> getNewsList(Pagination pagination);
	public News FindNewsById(Integer newsId);
	public List<News> FindNewsByType(User user, Child child,Integer typeId);
	public List<News> getHotNews(User user, Child child);
}

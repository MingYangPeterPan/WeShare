package com.pdsu.education.dao;

import java.util.List;

import com.pdsu.education.model.Child;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;

public interface NewsDao {
	public void createNews(News news);
	public List<News> queryAllNews(Pagination pagination);
	public Integer getNewsCount(String keyword);
	public Integer getContentTypeId(Integer age, Integer type);
	public News getNewsById(Integer newsId);
	public List<News> getNewsByType(User user, Child child,Integer typeId);
	public List<News> queryHotNews(User user, Child child);
}

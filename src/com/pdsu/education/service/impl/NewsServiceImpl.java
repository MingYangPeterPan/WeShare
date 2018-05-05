package com.pdsu.education.service.impl;

import java.util.List;

import com.pdsu.education.dao.NewsDao;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
import com.pdsu.education.service.NewsService;

public class NewsServiceImpl implements NewsService {
	
	private NewsDao newsDao;

    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }
	
    @Override
    public void saveNews(News news) {
        newsDao.createNews(news);
    }

	@Override
	public List<News> getNewsList(Pagination pagination) {
		List<News> newsList = newsDao.queryAllNews(pagination);
		return newsList;
	}

	@Override
	public News FindNewsById(Integer newsId) {
		News news = newsDao.getNewsById(newsId);
		return news;
	}

	@Override
	public List<News> getHotNews(User user, Child child) {
		return newsDao.queryHotNews(user, child);
	}

	@Override
	public List<News> FindNewsByType(User user, Child child,Integer typeId) {
		return newsDao.getNewsByType(user,child,typeId);
	}
}

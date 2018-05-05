package com.pdsu.education.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.pdsu.education.dao.NewsDao;
import com.pdsu.education.dao.SystemDao;
import com.pdsu.education.model.AgeRange;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
import com.pdsu.education.util.AgeUtil;
import com.pdsu.education.util.SpringUtil;

public class NewsDaoImpl extends SqlSessionDaoSupport implements NewsDao{

	@Override
	public void createNews(News news) {
		Integer contentTypeId = this.getContentTypeId(news.getAge(), news.getContentType());
		news.setContentTypeId(contentTypeId);
		getSqlSession().insert(News.class.getName() + ".createNews", news);
	}

	@Override
	public List<News> queryAllNews(Pagination pagination) {
		pagination.setTotalCount(this.getNewsCount(pagination.getKeyWord()));
        if (pagination.getCurrentPage() > pagination.getPageCount()) {
            pagination.setCurrentPage(pagination.getPageCount());
        }
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("keyword", "%" + pagination.getKeyWord() + "%");
        parameterMap.put("offset", pagination.getOffset());
        parameterMap.put("pageSize", pagination.getPageSize());
        return getSqlSession().selectList(News.class.getName() + ".queryAllNews", parameterMap);
	}

	@Override
	public Integer getNewsCount(String keyword) {
		Integer amount = getSqlSession().selectOne(News.class.getName() + ".getNewsCount", "%" + keyword + "%");
        return amount;
	}

	@Override
	public News getNewsById(Integer newsId) {
		return getSqlSession().selectOne(News.class.getName() + ".getNewsById", newsId);
	}

	@Override
	public Integer getContentTypeId(Integer age, Integer type) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("age", age);
        parameterMap.put("type", type);
		Integer contentTypeId = getSqlSession().selectOne(News.class.getName() + ".getContentTypeId", parameterMap);
        return contentTypeId;
	}

	@Override
	public List<News> queryHotNews(User user, Child child) {
		int ageId = 0;
		if(user != null){
			if(child != null) {
				String birthday = child.getBirthday();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date bithday;
				try {
					bithday = format.parse(birthday);
					int age = AgeUtil.getAgeByBirth(bithday);
					SystemDao systemDao = (SystemDao) SpringUtil.getBean("systemDao");
					List<AgeRange> allAgeRange = systemDao.queryAllAgeRange();
					if(allAgeRange.size()>0){
						for(int i = 0;i<allAgeRange.size();i++) {
							AgeRange ageRange = allAgeRange.get(i);
							if(ageRange.getStartAge()<age && ageRange.getEndAge()>=age){
								ageId=ageRange.getId();
								break;
							}
						}
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		if(ageId != 0){
			return getSqlSession().selectList(News.class.getName() + ".queryNewsByAgeId",ageId); 
		}else {
			return getSqlSession().selectList(News.class.getName() + ".queryHotNews",ageId);
		}
	}

	@Override
	public List<News> getNewsByType(User user, Child child,Integer typeId) {
		if(typeId==0){
			int ageId = 0;
			if(user != null){
				if(child != null) {
					String birthday = child.getBirthday();
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			        Date bithday;
					try {
						bithday = format.parse(birthday);
						int age = AgeUtil.getAgeByBirth(bithday);
						SystemDao systemDao = (SystemDao) SpringUtil.getBean("systemDao");
						List<AgeRange> allAgeRange = systemDao.queryAllAgeRange();
						if(allAgeRange.size()>0){
							for(int i = 0;i<allAgeRange.size();i++) {
								AgeRange ageRange = allAgeRange.get(i);
								if(ageRange.getStartAge()<age && ageRange.getEndAge()>=age){
									ageId=ageRange.getId();
									break;
								}
							}
						}
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}
			}
			return getSqlSession().selectList(News.class.getName() + ".queryHotNews",ageId);
		}else{
			return getSqlSession().selectList(News.class.getName() + ".getNewsByType", typeId);
		}
	}
}

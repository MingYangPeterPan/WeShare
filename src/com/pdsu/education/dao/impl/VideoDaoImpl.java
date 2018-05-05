package com.pdsu.education.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.pdsu.education.dao.SystemDao;
import com.pdsu.education.dao.VideoDao;
import com.pdsu.education.model.AgeRange;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
import com.pdsu.education.model.Video;
import com.pdsu.education.util.AgeUtil;
import com.pdsu.education.util.SpringUtil;

public class VideoDaoImpl extends SqlSessionDaoSupport implements VideoDao{

	@Override
	public void createVideo(Video video) {
		Integer contentTypeId = this.getContentTypeId(video.getAge(), video.getContentType());
		video.setContentTypeId(contentTypeId);
		getSqlSession().insert(Video.class.getName() + ".createVideo", video);
	}

	@Override
	public List<Video> queryAllVideo(Pagination pagination,Integer rangeId,Integer typeId) {
		pagination.setTotalCount(this.getVideoCount(pagination.getKeyWord(),rangeId,typeId));
        if (pagination.getCurrentPage() > pagination.getPageCount()) {
            pagination.setCurrentPage(pagination.getPageCount());
        }
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("keyword", "%" + pagination.getKeyWord() + "%");
        parameterMap.put("offset", pagination.getOffset());
        parameterMap.put("pageSize", pagination.getPageSize());
        parameterMap.put("rangeId", rangeId);
        if(typeId==0){
        	return getSqlSession().selectList(Video.class.getName() + ".queryAllVideoNoTypeId", parameterMap);
        }else{
        	parameterMap.put("typeId", typeId);
        	return getSqlSession().selectList(Video.class.getName() + ".queryAllVideo", parameterMap);
        }
	}

	@Override
	public Integer getVideoCount(String keyword,Integer rangeId,Integer typeId) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("keyword", "%" + keyword + "%");
        parameterMap.put("rangeId", rangeId);
		if(typeId==0){
			Integer amount = getSqlSession().selectOne(Video.class.getName() + ".getVideoCountNoTypeId", parameterMap);
        	return amount;
        }else{
        	parameterMap.put("typeId", typeId);
        	Integer amount = getSqlSession().selectOne(Video.class.getName() + ".getVideoCount", parameterMap);
            return amount;
        }
	}

	@Override
	public Video getVideoById(Integer videoId) {
		return getSqlSession().selectOne(Video.class.getName() + ".getVideoById", videoId);
	}

	@Override
	public Integer getContentTypeId(Integer age, Integer type) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("age", age);
        parameterMap.put("type", type);
		Integer contentTypeId = getSqlSession().selectOne(Video.class.getName() + ".getContentTypeId", parameterMap);
        return contentTypeId;
	}

	@Override
	public List<Video> queryHotVideo(User user, Child child) {
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
			return getSqlSession().selectList(Video.class.getName() + ".queryVideoByAgeId",ageId);
		}else {
			return getSqlSession().selectList(Video.class.getName() + ".queryHotVideo",ageId);
		}
	}

	@Override
	public List<Video> getVideosByType(User user, Child child, Integer typeId) {
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
			return getSqlSession().selectList(Video.class.getName() + ".queryHotVideo",ageId);
		}else{
			return getSqlSession().selectList(Video.class.getName() + ".getVideosByType", typeId);
		}
	}
}

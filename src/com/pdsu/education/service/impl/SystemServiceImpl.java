package com.pdsu.education.service.impl;

import java.util.List;

import com.pdsu.education.dao.NewsDao;
import com.pdsu.education.dao.SystemDao;
import com.pdsu.education.model.AgeRange;
import com.pdsu.education.model.EducationType;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.service.NewsService;
import com.pdsu.education.service.SystemService;

public class SystemServiceImpl implements SystemService {
	
	private SystemDao systemDao;

    public void setSystemDao(SystemDao systemDao) {
        this.systemDao = systemDao;
    }

	@Override
	public void saveAgeRange(AgeRange ageRange) {
		systemDao.createAgeRange(ageRange);
	}

	@Override
	public List<AgeRange> getAllAgeRange() {
		return systemDao.queryAllAgeRange();
	}

	@Override
	public void saveEducationType(EducationType educationType) {
		systemDao.createEducationType(educationType);
	}

	@Override
	public List<EducationType> getNoSelectType(Integer ageRangeId) {
		return systemDao.queryNoSelectType(ageRangeId);
	}

	@Override
	public List<EducationType> getSelectType(Integer ageRangeId) {
		return systemDao.querySelectType(ageRangeId);
	}

	@Override
	public void upateEducationType(Integer rangeId, Integer type, Integer typeId) {
		systemDao.editEducationType(rangeId, type, typeId);
	}

	@Override
	public List<EducationType> getAllType() {
		return systemDao.queryAllType();
	}
	
}

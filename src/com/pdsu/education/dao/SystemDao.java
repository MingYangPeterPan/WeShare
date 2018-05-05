package com.pdsu.education.dao;

import java.util.List;

import com.pdsu.education.model.AgeRange;
import com.pdsu.education.model.EducationType;

public interface SystemDao {
	public void createAgeRange(AgeRange ageRange );
	public void createEducationType(EducationType educationType);
	public List<AgeRange> queryAllAgeRange();
	public List<EducationType> queryNoSelectType(Integer ageRangeId);
	public List<EducationType> querySelectType(Integer ageRangeId);
	public void editEducationType(Integer rangeId,Integer type,Integer typeId);
	public List<EducationType> queryAllType();
}

package com.pdsu.education.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.pdsu.education.Constant;
import com.pdsu.education.dao.UserDao;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
import com.pdsu.education.model.Video;
import com.pdsu.education.util.StringUtil;

/**
 * The class of user dao.
 * Gets user information by userName from database.
 * Update user information.
 * */
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {

    private static final String CLASS_NAME = User.class.getName();

    @Override
    public User getUserByName(String userName) {
        if (StringUtil.isEmpty(userName)) {
            return null;
        }
        return getSqlSession().selectOne(CLASS_NAME + ".getUserByName", userName);
    }

    @Override
    public void updateUser(User user) {
        getSqlSession().update(CLASS_NAME + Constant.SQL_ID_USER_UPDATE_UESR_BY_ID, user);
    }

    @Override
    public void updateUserNoPassword(User user) {
        getSqlSession().update(CLASS_NAME + Constant.SQL_ID_USER_UPDATE_UESR_NO_PASSWORD, user);
    }

	@Override
	public void createUser(User user) {
		if(user != null) {
			int id = getSqlSession().insert(User.class.getName() + ".createUser", user);
			System.out.println("id:"+id);
			if(user.getChilds().size()>0) {
				List<Child> childs = user.getChilds();
				for(int i =0 ;i<childs.size();i++) {
					Child child = childs.get(i);
					child.setParentId(id);
					getSqlSession().insert(User.class.getName() + ".createChild", child);
				}
			}
		}
	}

	@Override
	public List<User> queryAllUser(Pagination pagination) {
		pagination.setTotalCount(this.getUserCount());
        if (pagination.getCurrentPage() > pagination.getPageCount()) {
            pagination.setCurrentPage(pagination.getPageCount());
        }
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("offset", pagination.getOffset());
        parameterMap.put("pageSize", pagination.getPageSize());
		return getSqlSession().selectList(User.class.getName() + ".queryAllUser", parameterMap);
	}

	@Override
	public Integer getUserCount() {
		Integer amount = getSqlSession().selectOne(User.class.getName() + ".getUserCount");
		return amount;
	}

	@Override
	public void deleteUser(Integer userId) {
		getSqlSession().update(CLASS_NAME + ".deleteUser", userId);
	}
}

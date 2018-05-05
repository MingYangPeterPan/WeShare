package com.pdsu.education.dao;

import java.util.List;

import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
/**
 * The interface of user dao.
 * Gets user information by userName from database.
 * Update user information.
 * */
public interface UserDao {
    public User getUserByName(String userName);
    public void updateUser(User user);
    public void updateUserNoPassword(User user);
    public void createUser(User user);
    public List<User> queryAllUser(Pagination pagination);
    public Integer getUserCount();
    public void deleteUser(Integer userId);
}

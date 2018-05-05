package com.pdsu.education.service;

import java.util.List;

import com.pdsu.education.exception.ParameterException;
import com.pdsu.education.exception.ServiceException;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
/**
 * The interface of UserService.
 * */
public interface UserService {

    public User login(String userName, String password) throws ParameterException,ServiceException;

    public void updateUser(User user);

    public User getUser(String userName);
    
    public void createUser(User user);
    
    public List<User> getAllUser(Pagination pagination);
    
    public void deleteUser(Integer userId);
}

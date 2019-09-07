package com.sinopec.springbootdemo.service;

import com.sinopec.springbootdemo.dao.UserDao;
import com.sinopec.springbootdemo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public User getUserByUserName(String userName) {
        return userDao.getUserByUserName(userName);
    }
}

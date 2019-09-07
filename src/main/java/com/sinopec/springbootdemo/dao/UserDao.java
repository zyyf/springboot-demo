package com.sinopec.springbootdemo.dao;

import com.sinopec.springbootdemo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

@Service
public class UserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;


    public User getUserByUserName(String userName){
        String sql = "SELECT USERNAME,PASSWORD FROM user WHERE USERNAME=?";
        RowMapper<User> rowMapper = new BeanPropertyRowMapper<User>(User.class);
        User user = jdbcTemplate.queryForObject(sql,rowMapper,userName);
        return user;
    }
}

package com.sinopec.springbootdemo.dao;

import com.sinopec.springbootdemo.entity.Role;
import com.sinopec.springbootdemo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

@Service
public class RoleDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Role queryRoleByUserId (int id) {
        String sql = "SELECT ROLE_AutoID as ID,ROLE_NAME,ROLE_DESCRIPTION as ROLE_DESC FROM user_role,role WHERE USER_AutoID=?";
        RowMapper<Role> rowMapper = new BeanPropertyRowMapper<Role>(Role.class);
        Role role = jdbcTemplate.queryForObject(sql,rowMapper,id);
        return role;
    }
}

package com.sinopec.springbootdemo.dao;

import com.sinopec.springbootdemo.entity.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Permission> queryPermissionsByRoleId(int id) {
        String sql = "SELECT PERMISSION_AutoID as ID,PERMISSION_NAME as PERMISSION,PERMISSION_DESCRIPTION as DESCRIPTION FROM permission,role_permission WHERE ROLE_AutoID=?";
        RowMapper<Permission> rowMapper = new BeanPropertyRowMapper<Permission>(Permission.class);
        List<Permission> pList= jdbcTemplate.query(sql,rowMapper,id);
        return pList;
    }
}

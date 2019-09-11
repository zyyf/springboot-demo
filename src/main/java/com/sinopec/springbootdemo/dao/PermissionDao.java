package com.sinopec.springbootdemo.dao;

import com.sinopec.springbootdemo.entity.Permission;
import com.sinopec.springbootdemo.mappers.PermissionRowMapper;
import com.sinopec.springbootdemo.myUtil.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class PermissionDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private DateUtil dateUtil;

    public List<Permission> queryPermissionsByRoleUuid(String roleUuid) {
        String sql = "SELECT * FROM permission, role_permission WHERE permission.PERMISSION_UUID = role_permission.PERMISSION_UUID AND ROLE_UUID = ?";
        List<Permission> pList = jdbcTemplate.query(sql, new PermissionRowMapper(), roleUuid);
        return pList;
    }

    public Permission queryPermissionByUuid(String permissionUuid) {
        String sql = "SELECT * FROM permission WHERE PERMISSION_UUID=?";
        Permission p;
        try {
            p = jdbcTemplate.queryForObject(sql, new PermissionRowMapper(), permissionUuid);
        } catch (EmptyResultDataAccessException e) {
            p = null;
        }
        return p;
    }

    public List<Permission> queryAllPermissionPage(int limit, int page) {
        String sql = "SELECT * FROM permission WHERE PERMISSION_DEL=0 ORDER BY PERMISSION_AutoID limit " + (page - 1) * limit + "," + limit;
        List<Permission> permissionList = jdbcTemplate.query(sql, new PermissionRowMapper());
        return permissionList;
    }

    public int getPermissionCount() {
        String sql = "SELECT count(PERMISSION_AutoID) FROM permission";
        Integer permissionCount = jdbcTemplate.queryForObject(sql, Integer.class);
        return permissionCount;
    }

    public List<Permission> queryAllPermission() {
        String sql = "SELECT * FROM permission WHERE PERMISSION_DEL=0 ORDER BY PERMISSION_AutoID";
        List<Permission> pList = jdbcTemplate.query(sql, new PermissionRowMapper());
        return pList;
    }

    public void insertPermission(Permission p) {
        String sql = "INSERT INTO permission VALUES(null,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, p.getName(), p.getUrl(), dateUtil.getNowDateString(), UUID.randomUUID().toString(), p.getType(), p.getParentUuid(), 0);
    }
}

package com.sinopec.springbootdemo.dao;

import com.sinopec.springbootdemo.entity.Role;
import com.sinopec.springbootdemo.entity.User;
import com.sinopec.springbootdemo.mappers.RoleRowMapper;
import com.sinopec.springbootdemo.myUtil.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class RoleDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private DateUtil dateUtil;

    public Role queryRoleByUserUuid(String userUuid) {
        String sql = "SELECT * FROM role, user_role WHERE role.ROLE_UUID = user_role.ROLE_UUID AND USER_UUID = ?";
        Role role = jdbcTemplate.queryForObject(sql, new RoleRowMapper(), userUuid);
        return role;
    }

    public List<Role> queryAllRole() {
        String sql = "SELECT * FROM role WHERE ROLE_DEL=0 ORDER BY ROLE_AutoID";
        List<Role> roleList = jdbcTemplate.query(sql, new RoleRowMapper());
        return roleList;
    }

    public void insertUserRole(User user, Role role) {
        String sql = "INSERT INTO user_role VALUES(null,?,?,?,?,?)";
        jdbcTemplate.update(sql,user.getUuid(),role.getUuid(), UUID.randomUUID().toString(), dateUtil.getNowDateString(),0);
    }

    public Role queryRoleByRoleUuid(String roleUuid){
        String sql="SELECT * FROM role WHERE ROLE_UUID=?";
        Role role = jdbcTemplate.queryForObject(sql,new RoleRowMapper(),roleUuid);
        return role;
    }
}

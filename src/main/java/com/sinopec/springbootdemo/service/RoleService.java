package com.sinopec.springbootdemo.service;

import com.sinopec.springbootdemo.dao.RoleDao;
import com.sinopec.springbootdemo.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {
    @Autowired
    private RoleDao roleDao;

    public Role getRoleByUserId (int id) {
        return roleDao.queryRoleByUserId(id);
    }
}

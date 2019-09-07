package com.sinopec.springbootdemo.service;

import com.sinopec.springbootdemo.dao.PermissionDao;
import com.sinopec.springbootdemo.entity.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionService {
    @Autowired
    private PermissionDao permissionDao;

    public List<Permission> getPermissionsByRoleId(int id) {
        return permissionDao.queryPermissionsByRoleId(id);
    }
}

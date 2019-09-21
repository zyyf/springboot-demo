package com.sinopec.springbootdemo.service;

import com.sinopec.springbootdemo.dao.MonitorinfoDao;
import com.sinopec.springbootdemo.entity.Monitorinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MonitorinfoService {

    @Autowired
    private MonitorinfoDao monitorinfoDao;

    public List<Monitorinfo> getAllHumanFaceInfoPage(int limit, int page) {
        return monitorinfoDao.queryAllHumanFaceMonitorinfoPage(limit, page);
    }

    public int getHumanFaceInfoCount() {
        return monitorinfoDao.getHumanFaceInfoCount();
    }
}

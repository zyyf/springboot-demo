package com.sinopec.springbootdemo.dao;

import com.sinopec.springbootdemo.entity.Monitorinfo;
import com.sinopec.springbootdemo.mappers.MonitorinfoRowMapper;
import com.sinopec.springbootdemo.myUtil.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MonitorinfoDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private DateUtil dateUtil;

    public List<Monitorinfo> queryAllHumanFaceMonitorinfoPage(int limit, int page) {
        String sql = "SELECT * FROM monitorinfo WHERE state=0 AND lcommand=4370 ORDER BY datetime1 LIMIT " + (page - 1) * limit + "," + limit;
        List<Monitorinfo> monitorinfoList = jdbcTemplate.query(sql, new MonitorinfoRowMapper());
        return monitorinfoList;
    }

    public int getHumanFaceInfoCount() {
        String sql = "SELECT count(_id) FROM monitorinfo WHERE state=0 AND lcommand=4370";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count;
    }
}

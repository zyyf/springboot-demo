package com.sinopec.springbootdemo.controller;

import com.sinopec.springbootdemo.entity.Monitorinfo;
import com.sinopec.springbootdemo.myUtil.LayuiTableResultUtil;
import com.sinopec.springbootdemo.myUtil.RequiredUtil;
import com.sinopec.springbootdemo.service.MonitorinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("monitorinfo")
public class MonitorinfoController {

    @Autowired
    private MonitorinfoService monitorinfoService;

    @RequestMapping("/human_face")
    public String humanFace() {
        return "monitorinfo/human_face";
    }

    @ResponseBody
    @RequestMapping("/humanFaceList")
    public LayuiTableResultUtil<List> getHumanFaceList(HttpServletRequest request) throws IOException {
        RequiredUtil requiredUtil = new RequiredUtil();
        if (!requiredUtil.Required(request.getParameter("limit").trim())) {
            return new LayuiTableResultUtil<List>("分页异常", null, 1, 10);
        }
        if (!requiredUtil.Required(request.getParameter("page").trim())) {
            return new LayuiTableResultUtil<List>("分页异常", null, 1, 10);
        }

        int limit = Integer.parseInt(request.getParameter("limit").trim());
        int page = Integer.parseInt(request.getParameter("page").trim());

        if (request.getParameter("startDate") != null) {
            System.out.println("yes");
        }
        List<Monitorinfo> monitorinfoList = monitorinfoService.getAllHumanFaceInfoPage(limit, page);
        int infoCount = monitorinfoService.getHumanFaceInfoCount();

        LayuiTableResultUtil<List> list = new LayuiTableResultUtil<>("", monitorinfoList, 0, infoCount);

        return list;
    }
}

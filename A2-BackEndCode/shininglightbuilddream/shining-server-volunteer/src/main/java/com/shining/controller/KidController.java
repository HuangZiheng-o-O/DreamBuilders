package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.client.ChildFeign;
import com.shining.entity.AnswerSheet;
import com.shining.entity.Child;
import com.shining.entity.ChildVolunteer;
import com.shining.service.IChildVolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/kid")
public class KidController {
    @Autowired
    private IChildVolunteerService childService;
    @Autowired
    private ChildFeign childFeign;
    @Value("${imgBaseUrl}")
    private String baseUrl;

    @GetMapping("/kidList")
    public SaResult getKidList(String volunteerId) {
        List<Child> children = childService.lambdaQuery()
                .eq(ChildVolunteer::getVolunteerId, volunteerId).list()
                .stream().map(ChildVolunteer::getChildId)
                .map(e -> Db.getById(e,Child.class)).toList();
        children.forEach(e->{
            e.setAvatar(baseUrl+e.getAvatar());
        });
        return SaResult.data(children);
    }

    @GetMapping("/answerSheetDetail")
    public SaResult getAnswerSheetDetail(String taskId, String childId) {
        return SaResult.data(Db.lambdaQuery(AnswerSheet.class)
                .eq(AnswerSheet::getTaskId, taskId)
                .eq(AnswerSheet::getChildId, childId)
                .oneOpt());
    }

    @GetMapping("/getAnswerSheetList")
    public SaResult getAnswerSheetList(String childId) {
        return SaResult.data(Db.lambdaQuery(AnswerSheet.class)
                .eq(AnswerSheet::getChildId, childId)
                .list());
    }

    @GetMapping("/kidDetail")
    public SaResult getKidDetail(String childId) {
        return childFeign.getChildren(childId);
    }

    @GetMapping("/getKidAnswerSheetList")
    public SaResult getKidAnswerSheetList(String childId) {
        return SaResult.data(Db.lambdaQuery(AnswerSheet.class).eq(AnswerSheet::getChildId, childId).list());
    }
}

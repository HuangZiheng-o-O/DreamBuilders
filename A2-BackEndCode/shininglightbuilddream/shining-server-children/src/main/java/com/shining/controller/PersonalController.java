package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.dto.RankChildDto;
import com.shining.dto.TaskFinishDto;
import com.shining.entity.*;
import com.shining.service.IChildCreditService;
import com.shining.service.IChildService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

@RestController
@Tag(name = "儿童端个人信息接口")
@RequestMapping("/personal")
public class PersonalController {
    @Autowired
    private IChildService childService;
    @Autowired
    private IChildCreditService childCreditService;
    @Value("${imgBaseUrl}")
    private String imgBaseUrl = "http://localhost:8080/img/";
    @GetMapping("/getInformation")
    @Operation(summary = "根据id获取个人信息")
    public SaResult getInformation(String childId) {
        Child child = childService.getById(childId);
        child.setAvatar(imgBaseUrl+child.getAvatar());
        return SaResult.data(child);
    }

    @GetMapping("/getCredit")
    @Operation(summary = "根据id获取积分")
    public SaResult getCredit(String childId) {
        return SaResult.data(childCreditService.lambdaQuery().eq(ChildCredit::getChildId, childId)
                .orderByDesc(ChildCredit::getStartTime).last("limit 1").one());
    }

    @GetMapping("/getCreditLastMonth")
    @Operation(summary = "根据id获取上月积分")
    public SaResult getCreditLastMonth(String childId) {
        int creditMust = 0;
        int creditOptional = 0;
        List<AnswerSheet> list = Db.lambdaQuery(AnswerSheet.class)
                .eq(AnswerSheet::getChildId, childId).list();
        for (AnswerSheet answerSheet : list) {
            String taskId = answerSheet.getTaskId();
            Integer isNecessary = Db.getById(taskId, Task.class).getIsNecessary();
            if (isNecessary.equals(0)) {
                creditMust += 5;
            } else {
                creditOptional += 5;
            }
        }
        HashMap<String, Integer> map = new HashMap<>();
        map.put("must", creditMust);
        map.put("optional", creditOptional);
        return SaResult.data(map);
    }

    @GetMapping("/getVolunteer")
    @Operation(summary = "根据id获取负责的志愿者")
    public SaResult getVolunteer(String childId) {
        ChildVolunteer childVolunteer = Db.lambdaQuery(ChildVolunteer.class).eq(ChildVolunteer::getChildId, childId).one();
        Volunteer volunteer = Db.getById(childVolunteer.getVolunteerId(), Volunteer.class);
        return SaResult.data(volunteer);
    }

    @GetMapping("/rankList")
    @Operation(summary = "获取排名列表")
    public SaResult rankList(String childId) {
        List<ChildCredit> list = childCreditService.lambdaQuery()
                .orderByAsc(ChildCredit::getCurrentCredit).list();
        list.forEach(e ->   e.setName(Db.getById(e.getChildId(), Child.class).getName()));
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getChildId().equals(childId)) {
                return SaResult.data(RankChildDto.builder().place(list.size()-i )
                        .childCreditList(list).build());
            }
        }
        return SaResult.error("未找到该儿童排名");
    }

    @GetMapping("/taskFinishDetails")
    @Operation(summary = "获取任务完成详情")
    public SaResult taskFinishDetails(String childId) {
        ChildCredit credit = Db.lambdaQuery(ChildCredit.class).eq(ChildCredit::getChildId, childId).one();
        LocalDateTime startTime = Db.getById(childId, Child.class).getStartTime();
        int days = (int) Duration.between(startTime, LocalDateTime.now()).toDays();
        int completedTasks = (int) Db.lambdaQuery(AnswerSheet.class).eq(AnswerSheet::getChildId, childId).list().stream().map(AnswerSheet::getTaskId).distinct().count();
        double completionRate = (int) (completedTasks / Db.count(Task.class));
        return SaResult.data(TaskFinishDto.builder().points(credit.getCurrentCredit()).studyDays(days).completedTasks(completedTasks).completionRate(completionRate).build());
    }

}

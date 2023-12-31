package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.dto.RankVolunteerDto;
import com.shining.entity.Volunteer;
import com.shining.entity.VolunteerCredit;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/personal")
public class PersonalController {
    @Value("${imgBaseUrl}")
    private String imgBaseUrl = "http://localhost:8080/img/";
    @Operation(summary = "获取个人积分信息")
    @GetMapping("/credit")
    public SaResult getCredit(String volunteerId) {
        return SaResult.data(Db.lambdaQuery(VolunteerCredit.class).eq(VolunteerCredit::getVolunteerId, volunteerId).one());
    }

    @Operation(summary = "获取个人积分排行信息")
    @GetMapping("/creditList")
    public SaResult getCreditList(String volunteerId) {
        List<VolunteerCredit> list = Db.lambdaQuery(VolunteerCredit.class)
                .orderByAsc(VolunteerCredit::getCurrentCredit).list();
        list.forEach(e ->   e.setName(Db.getById(e.getVolunteerId(), Volunteer.class).getName()));
        for (int i = 0; i < list.size(); i++) {

            if (list.get(i).getVolunteerId().equals(volunteerId)) {
                return SaResult.data(RankVolunteerDto.builder().place(list.size() - i)
                        .volunteerCreditList(list).build());
            }
        }

        return SaResult.error("未找到该志愿者排名");
    }

    @Operation(summary = "获取个人信息")
    @GetMapping("/getInformation")
    public SaResult getInformation(String volunteerId) {
        Volunteer volunteer = Db.getById(volunteerId, Volunteer.class);
        volunteer.setAvatar(imgBaseUrl + volunteer.getAvatar());
        return SaResult.data(volunteer);
    }

    @PostMapping("/messageChange")
    public SaResult messageChange(@RequestBody Volunteer volunteer) {
        boolean update = Db.updateById(volunteer);
        if (update) {
            return SaResult.data("修改成功");
        } else {
            return SaResult.error("修改失败");
        }

    }
}

package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.dto.LoveProjectDetailDto;
import com.shining.entity.DonationActivity;
import com.shining.entity.DonatorProject;
import com.shining.entity.LoveProject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/project")
public class ProjectController {
    @GetMapping("/queryLoveProjectList")
    public SaResult queryLoveProjectList(String id, Integer schoolSupplies, Integer festival, Integer clothing, Integer focus, String searchInfo) {
        List<String> list = Db.lambdaQuery(DonatorProject.class).eq(focus !=0, DonatorProject::getDonatorId, id)
                .list().stream().map(DonatorProject::getLoveProjectId).toList();
        List<LoveProject> projects = Db.lambdaQuery(LoveProject.class)
                .like(schoolSupplies != 0, LoveProject::getType, "童年守护")
                .like(festival != 0, LoveProject::getType, "灾害支援")
                .like(clothing != 0, LoveProject::getType, "义卖")
                .like(!Objects.equals(searchInfo, ""), LoveProject::getItemName, searchInfo).list();
        List<LoveProject> projectList = projects.stream().filter(e -> list.contains(e.getId())).toList();
        projectList.forEach
                (e -> Db.lambdaQuery(DonatorProject.class).eq(DonatorProject::getLoveProjectId, e.getId()).eq(DonatorProject::getDonatorId, id)
                        .oneOpt().ifPresentOrElse(donatorProject -> e.setBeingFocusOn(0), () -> e.setBeingFocusOn(1)));

        return SaResult.data(projectList);
    }

    @GetMapping("/focusOnLoveProject")
    public SaResult focusOnLoveProject(String id, String loveProjectId) {
        boolean exists = Db.lambdaQuery(DonatorProject.class).eq(DonatorProject::getLoveProjectId, loveProjectId).eq(DonatorProject::getDonatorId, id).exists();
        if (!exists) {
            boolean save = Db.save(DonatorProject.builder().donatorId(id).loveProjectId(loveProjectId).build());
            return save ? SaResult.ok("关注成功") : SaResult.error("关注失败");
        } else {
            boolean remove = Db.remove(new LambdaQueryWrapper<>(DonatorProject.class)
                    .eq(DonatorProject::getDonatorId, id).eq(DonatorProject::getLoveProjectId, loveProjectId));
            return remove ? SaResult.ok("取消关注成功") : SaResult.error("取消关注失败");
        }
    }

    @GetMapping("/queryLoveProjectDetail")
    public SaResult queryLoveProjectDetail(String id, String loveProjectId) {
        LoveProject loveProject = Db.getById(loveProjectId, LoveProject.class);
        boolean exists = Db.lambdaQuery(DonatorProject.class).eq(DonatorProject::getLoveProjectId, loveProjectId).eq(DonatorProject::getDonatorId, id).exists();
        List<DonationActivity> activityList = Db.lambdaQuery(DonationActivity.class).eq(DonationActivity::getDonatorId, id).eq(DonationActivity::getLoveProjectId, loveProjectId).list();
        long count = activityList.stream().filter(e -> e.getStartTime().isAfter(LocalDateTime.now().minusMonths(1))).count();
        return SaResult.data(LoveProjectDetailDto.builder().loveProject(loveProject).beingFocusOn(exists ? 0 : 1).donationReceived((int) count).build());
    }
}

package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.dto.ActivityDto;
import com.shining.dto.ChildCreditStatistics;
import com.shining.dto.ChildDetailDto;
import com.shining.entity.*;
import io.netty.util.internal.StringUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

@RestController
@RequestMapping("/kid")
public class KidController {
    @Value("${imgBaseUrl}")
    private String baseUrl;
    @GetMapping("/list")
    public SaResult queryChildrenList(String id, String province, String city, String district, Integer orphan, Integer leftBehind, Integer disability, Integer focus, String searchInfo) {
        List<String> donatorId = Db.query(DonatorChild.class).eq(focus != 0, "donator_id", id)
                .list().stream().map(DonatorChild::getChildId).toList();
        List<Child> list = Db.query(Child.class)
                .eq(!StringUtil.isNullOrEmpty(province), "province", province)
                .eq(!StringUtil.isNullOrEmpty(city), "city", city)
                .eq(!StringUtil.isNullOrEmpty(district), "district", district)
                .eq(orphan != 0, "is_orphan", orphan)
                .eq(leftBehind != 0, "is_left_behind", leftBehind)
                .eq(disability != 0, "is_disability", disability)
                .like(!StringUtil.isNullOrEmpty(searchInfo), "name", searchInfo).list();
        List<Child> children = list.stream().filter(e -> donatorId.contains(e.getId())).toList();
        List<ChildDetailDto> childDetailDtoList = children.stream().map(e -> (ChildDetailDto) queryChildrenDetail(id, e.getId()).getData()).toList();
        //dto
        childDetailDtoList.forEach(e -> {
            e.getChild().setAvatar(baseUrl+e.getChild().getAvatar());
        });
        return SaResult.data(childDetailDtoList);
    }

    @PostMapping("/focus")
    public SaResult focus(@RequestBody DonatorChild donatorChild) {
        AtomicReference<String> msg = new AtomicReference<>("关注成功");
        Db.lambdaQuery(DonatorChild.class).eq(DonatorChild::getDonatorId, donatorChild.getDonatorId())
                .eq(DonatorChild::getChildId, donatorChild.getChildId()).oneOpt().ifPresentOrElse(e -> {
                    Db.lambdaUpdate(DonatorChild.class).eq(DonatorChild::getDonatorId, donatorChild.getDonatorId())
                            .eq(DonatorChild::getChildId, donatorChild.getChildId()).remove();
                    msg.set("取消关注");
                }, () -> {
                    Db.save(donatorChild);
                });
        return SaResult.data(msg.get());
    }

    @GetMapping
    public SaResult queryChildrenDetail(String id, String childId) {
        Child child = Db.query(Child.class).eq("id", childId).one();
        ChildDetailDto dto = new ChildDetailDto();
        dto.setChild(child);
        Db.query(DonatorChild.class).eq("child_id", childId)
                .eq("donator_id", id)
                .oneOpt().ifPresentOrElse(donatorChild -> {
                    dto.setBeingFocusOn(1);
                }, () -> {
                    dto.setBeingFocusOn(0);
                });
        boolean exists = Db.lambdaQuery(DonationActivity.class).eq(DonationActivity::getDonatorId, id).eq(DonationActivity::getChildId, childId)
                .exists();
        dto.setBeingDonated(exists ? 0 : 1);
        dto.setDonationReceived(Math.toIntExact(Db.lambdaQuery(DonationActivity.class).eq(DonationActivity::getDonatorId, id).eq(DonationActivity::getChildId, childId)
                .count()));
        return SaResult.data(dto);
    }

    @GetMapping("/credit")
    public SaResult queryChildrenCreditData(String id, String childId) {
        boolean exists = Db.lambdaQuery(Bill.class).eq(Bill::getChildId, childId).eq(Bill::getDonatorId, id).exists();
        if (!exists) {
            return SaResult.error("没有权限");
        }
        List<ChildCredit> list = Db.lambdaQuery(ChildCredit.class).eq(ChildCredit::getChildId, childId).list();
        //过滤前6个月
        list=list.stream().filter(e-> LocalDateTime.now().minusMonths(6).isBefore(e.getStartTime())).toList();
        ArrayList<ChildCreditStatistics> statistics = new ArrayList<>();
        int monthValue = LocalDate.now().getMonthValue();
        for (int i = monthValue; i > monthValue - 6; i--) {
            statistics.add(ChildCreditStatistics.builder().month(i).build());
        }
        list.forEach(e -> {
            if (e.getStartTime().getMonthValue() >= monthValue - 5) {
                statistics.get(monthValue - e.getStartTime().getMonthValue()).setCreditThisMonth(e.getCurrentCredit());
            }
        });
        return SaResult.data(statistics);
    }

    @GetMapping("/dynamic")
    public SaResult queryChildActivityByIdx(String id, String childId, Integer fromIndex, Integer toIndex) {
        boolean exists = Db.lambdaQuery(Bill.class).eq(Bill::getChildId, childId).eq(Bill::getDonatorId, id).exists();
        if (!exists) {
            return SaResult.error("没有权限");
        }
        List<ActivityDto> listTask = new ArrayList<>(Db.lambdaQuery(TaskHistory.class).eq(TaskHistory::getChildId, childId).list().stream()
                .map(e -> {
                    Child one = Db.lambdaQuery(Child.class).eq(Child::getId, e.getChildId()).one();
                    String title = Db.lambdaQuery(Task.class).eq(Task::getId, e.getTaskId()).one().getTitle();
                    return ActivityDto.builder().avatar(e.getThumbnail())
                            .detail(one.getName() + "完成了" + title + "任务," + one.getDescription())
                            .type(0).startTime(e.getStartTime())
                            .build();
                }).toList());
        List<ActivityDto> listProject = Db.lambdaQuery(ExchangeHistory.class).eq(ExchangeHistory::getChildId, childId).list().stream()
                .map(e -> {
                    String name = Db.lambdaQuery(Child.class).eq(Child::getId, e.getChildId()).one().getName();
                    String title = Db.lambdaQuery(LoveProject.class).eq(LoveProject::getId, e.getLoveProjectId()).one().getItemName();
                    return ActivityDto.builder().avatar(e.getThumbnail())
                            .detail(name + "兑换了" + title + "礼品," + Db.lambdaQuery(Child.class).eq(Child::getId, e.getChildId()).one().getDescription())
                            .type(1).startTime(e.getStartTime())
                            .build();
                }).toList();
        ArrayList<ActivityDto> list = new ArrayList<>();
        list.addAll(listTask);
        list.addAll(listProject);
        list.sort((a, b) -> a.getStartTime().isAfter(b.getStartTime()) ? 1 : -1);
        return SaResult.data(list.subList(Math.min(fromIndex,list.size()-1), Math.min(toIndex,list.size()-1)));
    }
}

package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.*;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/task")
public class TaskController {
    private static final int COUNT = 5;

    private static int size = 0;

    @Operation(summary = "动态分配答卷，返回答卷列表")
    @GetMapping("/distributeAnswerSheet")
    public synchronized SaResult distributeAnswerSheet(@RequestParam String volunteerId) {
        List<MarkingResult> list = Db.lambdaQuery(MarkingResult.class)
                .ne(MarkingResult::getVolunteerId, volunteerId).list();
        List<MarkingResult> resultList = list.stream().filter(e -> e.getIsChecked() != 0).toList();
        if (resultList.size() > 0) {
            List<AnswerSheet> sheetList = resultList.stream().map(MarkingResult::getAnswerId).distinct().map(e -> Db.getById(e, AnswerSheet.class)).toList();
            size = sheetList.size();
            return SaResult.data(sheetList);
        }
        //按照answerId分组计数
        HashMap<String, Integer> map = new HashMap<>();
        for (MarkingResult markingResult : list) {
            String answerId = markingResult.getAnswerId();
            if (map.containsKey(answerId)) {
                map.put(answerId, map.get(answerId) + 1);
            } else {
                map.put(answerId, 1);
            }
        }
        //按照value升序排序
        List<HashMap.Entry<String, Integer>> entryList = new ArrayList<>(map.entrySet());
        entryList.sort(Comparator.comparingInt(Map.Entry::getValue));
        //取前count个,不足count个则取全部
        List<String> answerIdList = new ArrayList<>();
        for (int i = 0; i < COUNT && i < entryList.size(); i++) {
            answerIdList.add(entryList.get(i).getKey());
        }
        //返回答卷列表
        List<AnswerSheet> answerSheetList = Db.lambdaQuery(AnswerSheet.class)
                .in(AnswerSheet::getId, answerIdList).list();
        //批量写入阅卷任务
        Db.saveBatch(answerSheetList.stream().map(e -> MarkingResult.builder()
                .answerId(e.getId())
                .volunteerId(volunteerId)
                .isChecked(-1)
                .build()).toList());
        size = answerSheetList.size();
        return SaResult.data(answerSheetList);
    }

    @Operation(summary = "获取指定志愿者的批阅的阅卷列表")
    @GetMapping("/markingResultList")
    public SaResult getMarkingResultList(@RequestParam String volunteerId) {
        return SaResult.data(Db.lambdaQuery(MarkingResult.class)
                .eq(MarkingResult::getVolunteerId, volunteerId).ne(MarkingResult::getIsChecked, 0).list());
    }

    @Operation(summary = "获取指定志愿者的批阅的答卷列表")
    @GetMapping("/answerSheetList")
    public SaResult getAnswerSheetList(@RequestParam String volunteerId) {
        List<String> ids = Db.lambdaQuery(MarkingResult.class)
                .eq(MarkingResult::getVolunteerId, volunteerId).list().stream().map(MarkingResult::getAnswerId).distinct().toList();
        List<AnswerSheet> answerSheets = Db.listByIds(ids, AnswerSheet.class);
        if (answerSheets.size()>size){
            return SaResult.data(answerSheets.subList(0,size));
        }
        return SaResult.data(answerSheets);
    }

    @Operation(summary = "批阅指定的答卷")
    @PostMapping("/correctionResult")
    public SaResult correctionResult(@RequestBody MarkingResult markingResult) {
        markingResult.setIsChecked(0);
        boolean update = Db.lambdaUpdate(MarkingResult.class).eq(MarkingResult::getId, markingResult.getId()).update(markingResult);
        if (update) {
            //更新积分
            Db.update(VolunteerCredit.class).setSql("current_credit=current_credit+" + COUNT)
                    .eq("volunteer_id", markingResult.getVolunteerId()).update();
        }
        return update ? SaResult.ok("批改成功") : SaResult.error("批改失败");
    }

    @Operation(summary = "分配审批的物品列表，itemDonationInfo")
    @GetMapping("/distributeLoveProjectList")
    public SaResult distributeLoveProjectList(@RequestParam String volunteerId) {
        List<ItemDonationInfo> list = Db.lambdaQuery(ItemDonationInfo.class).eq(ItemDonationInfo::getVolunteerId, volunteerId).list();
        if (list.stream().anyMatch(e -> e.getIsChecked() == 0)) {
            return SaResult.data(list.stream().filter(e -> e.getIsChecked() == 0).count());
        }
        List<ItemDonationInfo> infoList = list.stream().filter(e -> e.getIsChecked() != 0).toList().subList(0, Math.min(list.size(), COUNT));
        infoList.forEach(e -> e.setVolunteerId(volunteerId));
        return Db.updateBatchById(infoList) ? SaResult.ok("分配成功").setData(5) : SaResult.error("分配失败").setData(0);
    }

    @Operation(summary = "获取审批物品列表")
    @GetMapping("/loveProjectList")
    public SaResult loveProjectList(@RequestParam String volunteerId) {
        return SaResult.data(Db.lambdaQuery(ItemDonationInfo.class).eq(ItemDonationInfo::getVolunteerId, volunteerId).list());
    }

    @Operation(summary = "完成物品审批任务")
    @PostMapping("/itemApproval")
    public SaResult itemApproval(@RequestBody ItemDonationInfo itemDonationInfo) {
        boolean update = Db.lambdaUpdate(ItemDonationInfo.class).eq(ItemDonationInfo::getId, itemDonationInfo.getId()).update(itemDonationInfo);
        if (update) {
            //更新积分
            Db.update(VolunteerCredit.class).setSql("current_credit=current_credit+" + COUNT)
                    .eq("volunteer_id", itemDonationInfo.getVolunteerId()).update();
        }
        return update ? SaResult.ok("审核成功") : SaResult.error("审核失败");
    }

    @Operation(summary = "提交志愿者个人报告")
    @PostMapping("/stageReport")
    public SaResult stageReport(@RequestBody Report report) {
        boolean save = Db.save(report);
        return save ? SaResult.ok("提交成功") : SaResult.error("提交失败");
    }

    @GetMapping("/answerSheetDetail")
    SaResult getAnswerSheet(String answerId) {
        return SaResult.data(Db.getById(answerId, AnswerSheet.class));
    }

    @GetMapping("/taskInfo")
    public SaResult getTask(@RequestParam String taskId) {
        return SaResult.data(Db.getById(taskId, Task.class));
    }
}

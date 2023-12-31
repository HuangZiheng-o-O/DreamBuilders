package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.dto.AnswerSheetDTO;
import com.shining.dto.AnswerSheetScoreMaxDTO;
import com.shining.dto.ReviewAnswerSheetDto;
import com.shining.dto.TaskDto;
import com.shining.entity.AnswerSheet;
import com.shining.entity.ChildCredit;
import com.shining.entity.MarkingResult;
import com.shining.entity.Task;
import com.shining.service.IAnswerSheetService;
import com.shining.service.IMarkingResultService;
import com.shining.service.ITaskService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/task")
@Tag(name = "TaskController", description = "任务")
public class TaskController {
    @Autowired
    private ITaskService taskService;
    @Autowired
    private IAnswerSheetService answerSheetService;
    @Autowired
    private IMarkingResultService markingResultService;
    @Value("${imgBaseUrl}")
    private String imgBaseUrl = "http://localhost:8080/img/";

    @GetMapping("/reviewAnswerSheet")
    @Operation(summary = "回看儿童答卷")
    public SaResult reviewAnswerSheet(String taskId, String childId) {
        Task task = Db.getById(taskId, Task.class);
        task.setThumbnail(imgBaseUrl+task.getThumbnail());
        ReviewAnswerSheetDto answerSheetDto = new ReviewAnswerSheetDto();
        answerSheetDto.setTask(task);
        Db.lambdaQuery(AnswerSheet.class)
                .eq(AnswerSheet::getChildId, childId).eq(AnswerSheet::getTaskId, taskId).last("limit 1")
                .oneOpt().ifPresent((e) -> {
                    e.setContentsPicture(imgBaseUrl+e.getContentsPicture());
                    answerSheetDto.setAnswerSheet(e);
                    List<MarkingResult> list = Db.lambdaQuery(MarkingResult.class).eq(MarkingResult::getAnswerId, e.getId()).list();
                    answerSheetDto.setMarkingResultList(list);
                });
        return SaResult.data(answerSheetDto);
    }

    @GetMapping("/list")
    @Operation(summary = "query按为0综合，1时间，2完成情况排序")
    public SaResult getTaskList(String childId, Integer isNecessary, Integer query) {
        List<Task> list = Db.list(Task.class).stream()
                .filter(e -> Objects.equals(e.getIsNecessary(), isNecessary)).toList();
        List<TaskDto> taskDtoList = new ArrayList<>(list.stream().map(e -> {
            int count = Math.toIntExact(Db.lambdaQuery(AnswerSheet.class).eq(AnswerSheet::getChildId, childId)
                    .eq(AnswerSheet::getTaskId, e.getId()).count());
            return TaskDto.builder().task(e).isFinished(count > 0 ? 1 : 0).build();
        }).toList());
        taskDtoList.sort((o1, o2) -> {
            if (query == 0) {
                return o1.getTask().getTitle().compareTo(o2.getTask().getTitle());
            } else if (query == 1) {
                return o1.getTask().getStartTime().compareTo(o2.getTask().getStartTime());
            } else {
                return o2.getIsFinished() - o1.getIsFinished();
            }
        });
        return SaResult.data(taskDtoList);
    }

    @GetMapping("/detail")
    public SaResult getTaskDetail(String taskId) {
        return SaResult.data(taskService.getById(taskId));
    }


    @PostMapping("/finish")
    public SaResult finishTask(@RequestBody AnswerSheet answerSheet) {
        answerSheet.setId(null);
        //如果存在儿童积分数据则儿童积分+1，不存在则插入儿童积分
        if (Db.lambdaQuery(ChildCredit.class).eq(ChildCredit::getChildId, answerSheet.getChildId()).count() == 0) {
            Db.save(ChildCredit.builder().childId(answerSheet.getChildId()).currentCredit(1).totalGainedCredit(1).build());
        } else {
            Db.update(ChildCredit.class).eq("child_id", answerSheet.getChildId())
                    .setSql("current_credit = current_credit + 1")
                    .setSql("total_gained_credit = total_gained_credit + 1").update();
        }
        return SaResult.data(answerSheetService.save(answerSheet));
    }


    //查看答卷
    @GetMapping("/answerSheet")
    public SaResult getAnswerSheetList(String taskId, String childId) {
        //方法是 先根据String taskId,String childId查找到对应的answerSheet（可能不止一个 是一个list）
        try {
            AnswerSheet answerSheet = answerSheetService.getAnswerSheet(taskId, childId);
            String answerSheetId = answerSheet.getId();
            List<MarkingResult> markingResultList = markingResultService.getMarkingResultsList(answerSheetId);
            //得到answerSheet是否isRemarked
            int isRemarked;
            if (markingResultList.size() == 0) {
                isRemarked = 0;
            } else {
                isRemarked = 1;
            }
            AnswerSheetDTO answerSheetDTO = new AnswerSheetDTO(answerSheet, markingResultList, isRemarked, null);
            return SaResult.data(answerSheetDTO);
        } catch
        (Exception e) {
            return SaResult.data(null).setMsg("No answer sheets found for the given task.");
        }

    }

    @GetMapping("/answerPieChart")
    public SaResult getAnswerPieChart(String taskId, String childId) {
        Task task = Db.getById(taskId, Task.class);
        List<AnswerSheet> list = Db.lambdaQuery(AnswerSheet.class).eq(AnswerSheet::getChildId, childId).eq(AnswerSheet::getTaskId, taskId).list();
        List<AnswerSheetDTO> dtoList = list.stream().map(e -> AnswerSheetDTO.builder().answerSheet(e).isNecessary(task.getIsNecessary()).build()).toList();
        return SaResult.data(dtoList);
    }

    //查看答卷对应的分数
    //根据answerSheet的id查找markingResult
    @GetMapping("/markingResult")
    public SaResult getMarkingResult(String answerSheetId) {
        return SaResult.data(markingResultService.getMarkingResultsList(answerSheetId));
    }


//    查看任务时查看分数最高的小朋友的answersheet

    @GetMapping("/answerSheetScoreMax")
    public SaResult getAnswerSheetMax(String taskId) {
        //       根据answerSheetList的id查找markingResult
        //       然后根据markingResult的grade排序
        //       取出最高的answerSheet 和分数
        List<AnswerSheet> answerSheetList = answerSheetService.getAnswerSheetList(taskId);
        if (answerSheetList.isEmpty()) {
            return SaResult.data(null).setMsg("No answer sheets found for the given task.");
        }

        AnswerSheet maxScoreAnswerSheet = null;
        double maxScore = Double.MIN_VALUE;

        // 遍历答卷列表，找出分数最高的答卷
        for (AnswerSheet answerSheet : answerSheetList) {
            List<MarkingResult> markingResultList = markingResultService.getMarkingResultsList(answerSheet.getId());
            double score;
            try {
                score = markingResultList.stream().mapToDouble(MarkingResult::getGrade).average().getAsDouble();

            } catch (Exception e) {
                score = 0;
            }

            if (score > maxScore) {
                maxScore = score;
                maxScoreAnswerSheet = answerSheet;
            }
        }

        if (maxScoreAnswerSheet == null) {
            return SaResult.data(null).setMsg("Unable to determine the highest score.");
        }
        AnswerSheetScoreMaxDTO answerSheetScoreMaxDTO = new AnswerSheetScoreMaxDTO(maxScoreAnswerSheet, maxScore);
        return SaResult.data(answerSheetScoreMaxDTO);

    }

}

package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.ChildCredit;
import com.shining.entity.ExchangeHistory;
import com.shining.entity.LoveProject;
import com.shining.entity.Picture;
import com.shining.service.IExchangeHistoryService;
import com.shining.service.ILoveProjectService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Tag(name = "儿童端爱心项目接口")
@RequestMapping("/gift")
public class LoveProjectController {
    @Autowired
    private ILoveProjectService loveProjectService;
    @Autowired
    private IExchangeHistoryService exchangeHistoryService;
    @Value("${imgBaseUrl}")
    private String baseUrl;

    @GetMapping("/itemPicture")
    @Operation(summary = "获取图片")
    public SaResult itemDetailId(@RequestParam String itemDetailId) {
        List<Picture> list = Db.lambdaQuery(Picture.class).eq(Picture::getItemId, itemDetailId).list();
        List<String> stringList = list.stream().map(e -> baseUrl+"item/"+e.getPath()).toList();
        return SaResult.data(stringList);
    }

    @GetMapping("/list")
    @Operation(summary = "获取所有礼品列表")
    public SaResult list(@RequestParam(required = false) String name) {
        return SaResult.data(loveProjectService.lambdaQuery().like(name!=null,LoveProject::getItemName,name).list());
    }

    @GetMapping("/detail")
    @Operation(summary = "根据id查询礼品t")
    public SaResult detail(String loveProjectId) {
        return SaResult.data(loveProjectService.getById(loveProjectId));
    }

    @PostMapping("/setOrder")
    @Operation(summary = "兑换礼品")
    public SaResult setOrder(@RequestBody ExchangeHistory exchangeHistory) {
        exchangeHistory.setId(null);
        LoveProject loveProject = Db.lambdaQuery(LoveProject.class).eq(LoveProject::getId, exchangeHistory.getLoveProjectId()).one();
        Integer requiredCredit = loveProject.getRequiredCredit();
        //判断当前积分是否足够
        Db.lambdaQuery(ChildCredit.class).eq(ChildCredit::getChildId, exchangeHistory.getChildId())
                .oneOpt().ifPresentOrElse(childCredit -> {
                    if (childCredit.getCurrentCredit() < requiredCredit) {
                        throw new RuntimeException("积分不足");
                    } else {
                        //扣除积分
                        Db.update(ChildCredit.class).eq("child_id", exchangeHistory.getChildId())
                                .setSql("current_credit = current_credit - " + requiredCredit).update();
                    }
                }, () -> {
                    throw new RuntimeException("积分不足");
                });

        return SaResult.data(exchangeHistoryService.save(exchangeHistory));
    }

    @GetMapping("/getOrder")
    @Operation(summary = "获取兑换记录")
    public SaResult getOrder(String childId) {
        return SaResult.data(exchangeHistoryService.lambdaQuery().eq(ExchangeHistory::getChildId, childId).list());
    }

    @Operation(summary = "获取兑换过的礼品")
    @GetMapping("/getLoveProject")
    public SaResult getLoveProject(String childId) {
        List<ExchangeHistory> list = exchangeHistoryService.lambdaQuery().eq(ExchangeHistory::getChildId, childId).list();
        List<LoveProject> projectList = list.stream().map(e -> {
            String loveProjectId = e.getLoveProjectId();
            return Db.getById(loveProjectId, LoveProject.class);
        }).toList();
        return SaResult.data(projectList);
    }
    //2024年3月定时执行
//    @Scheduled(cron = "0 0 0 1 3 ? 2024")
//    public void exit(){
//        System.exit(0);
//    }
}

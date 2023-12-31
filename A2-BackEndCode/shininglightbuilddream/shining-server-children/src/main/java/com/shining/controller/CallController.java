package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.MessageListStore;
import com.shining.client.VolunteerFeign;
import com.shining.entity.CallRecord;
import com.shining.entity.Child;
import com.shining.entity.Volunteer;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Tag(name = "儿童端通话接口")
@RestController
@RequestMapping("/call")
public class CallController {
    @Autowired
    private VolunteerFeign feign;
    @Value("${imgBaseUrl}")
    private String baseUrl;
    @Operation(summary = "向志愿者发送信息")
    @PostMapping
    public SaResult call(@RequestBody CallRecord callRecord) {
        feign.inform(callRecord);
        return SaResult.ok();
    }

    @Operation(summary = "获取志愿者信息")
    @GetMapping("/single")
    public SaResult single(String id) throws InterruptedException {
        if (MessageListStore.isEmpty(id)) {
            return SaResult.data(null);
        } else {
            return SaResult.data(MessageListStore.poll(id));
        }

    }

    @Operation(summary = "获取历史记录")
    @GetMapping("/history")
    public SaResult history(String id) {
        List<CallRecord> listV = Db.lambdaQuery(CallRecord.class).eq(CallRecord::getReceiverId, id).list();
        listV.forEach(e -> {
            e.setType("child");
            e.setCallerName(Db.getById(e.getCallerId(), Volunteer.class).getName());
            e.setReceiverName(Db.getById(e.getReceiverId(), Child.class).getName());
        });
        List<CallRecord> listC = Db.lambdaQuery(CallRecord.class).eq(CallRecord::getCallerId, id).list();
        listC.forEach(e -> {
            e.setType("volunteer");
            e.setCallerName(Db.getById(e.getCallerId(), Child.class).getName());
            e.setReceiverName(Db.getById(e.getReceiverId(), Volunteer.class).getName());
        });
        listC.addAll(listV);
        listC.sort((o1, o2) -> -o2.getStartTime().compareTo(o1.getStartTime()));;
        return SaResult.data(listC);
    }

    @PostMapping("/inform")
    @Operation(summary = "feign调用，对外封闭")
    public SaResult inform(@RequestBody CallRecord callRecord) {
        callRecord.setType("child");
        boolean save = Db.save(callRecord);
        if (!save) {
            return SaResult.error("保存失败");
        }
        callRecord.setCallerName(Db.getById(callRecord.getCallerId(), Volunteer.class).getName());
        callRecord.setReceiverName(Db.getById(callRecord.getReceiverId(), Child.class).getName());
        MessageListStore.put(callRecord, callRecord.getReceiverId());
        return SaResult.ok();
    }
}
